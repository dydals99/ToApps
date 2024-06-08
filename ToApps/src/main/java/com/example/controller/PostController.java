package com.example.controller;

import com.example.model.Post;
import com.example.repository.PostRepository;
import com.example.service.CommentService;
import com.example.service.FileService;
import com.example.service.PostService;

import jakarta.servlet.http.HttpSession;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/post")
public class PostController {
    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private FileService fileService;

    @Autowired
    private PostRepository postRepository;
    
    @GetMapping("/list")
    public String list(Model model, HttpSession session) {
        List<Post> posts = postService.getAllPostsSortedById();
        String userId = (String) session.getAttribute("userId");
        model.addAttribute("posts", posts);
        model.addAttribute("userId", userId);
        System.out.println(userId);
        return "post/list";
    }
    
   
    @GetMapping("/view/{id}")
    public String view(@PathVariable("id") Long id, Model model, HttpSession session) {
        Post post = postService.getPostById(id);
        String userId = (String) session.getAttribute("userId");
        if (post == null) {
            return "redirect:/post/list";
        }
        model.addAttribute("userId", userId);
        System.out.println(userId);
        model.addAttribute("post", post);
        model.addAttribute("comments", commentService.getCommentsByPostId(id));
        model.addAttribute("files", fileService.getFilesByPostId(id)); // 파일 리스트 추가
        return "post/view";
    }
    
    
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("post", new Post());
        return "post/create";
    }

    @PostMapping("/create")
    public String createPost(@ModelAttribute("post") Post post, Model model) {
        postService.savePost(post);
        model.addAttribute("message", "글이 성공적으로 작성되었습니다.");
        return "redirect:/post/list";
    }

    // 모든 글 목록 가져오기
    @GetMapping
    public String getAllPosts(Model model) {
        List<Post> posts = postRepository.findAll();
        model.addAttribute("posts", posts);
        return "posts";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable("id") Long id, Model model, HttpSession session) {
        Post post = postService.getPostById(id);
        if (post == null) {
            return "redirect:/post/list";
        }

        String userId = (String) session.getAttribute("userId");
        if (!post.getAuthorId().equals(userId)) {
            // 현재 사용자와 글 작성자가 일치하지 않으면 권한이 없다는 메시지를 반환하거나 다른 처리를 수행할 수 있습니다.
            return "redirect:/post/list";
        }

        model.addAttribute("post", post);
        return "post/edit";
    }

    @PostMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, @ModelAttribute Post post, HttpSession session) {
        Post existingPost = postService.getPostById(id);
        if (existingPost == null) {
            return "redirect:/post/list";
        }

        String userId = (String) session.getAttribute("userId");
        if (!existingPost.getAuthorId().equals(userId)) {
            // 현재 사용자와 글 작성자가 일치하지 않으면 권한이 없다는 메시지를 반환하거나 다른 처리를 수행할 수 있습니다.
            return "redirect:/post/list";
        }

        post.setId(id);
        postService.savePost(post);
        return "redirect:/post/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, HttpSession session) {
        Post post = postService.getPostById(id);
        if (post == null) {
            return "redirect:/post/list";
        }

        String userId = (String) session.getAttribute("userId");
        if (!post.getAuthorId().equals(userId)) {
            // 현재 사용자와 글 작성자가 일치하지 않으면 권한이 없다는 메시지를 반환하거나 다른 처리를 수행할 수 있습니다.
            return "redirect:/post/list";
        }

        postService.deletePost(id);
        return "redirect:/post/list";
    }

}
