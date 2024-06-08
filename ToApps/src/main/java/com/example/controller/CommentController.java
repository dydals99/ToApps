package com.example.controller;

import com.example.model.Comment;
import com.example.model.User;
import com.example.service.CommentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/create")
    public String create(@RequestParam("postId") Long postId, @RequestParam("content") String content, HttpSession session) {
    	String userId = (String) session.getAttribute("userId");
        Comment comment = new Comment();
        comment.setPostId(postId);
        comment.setContent(content);
        comment.setAuthorId(userId);
        commentService.saveComment(comment);
        return "redirect:/post/view/" + postId;
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, @RequestParam("postId") Long postId) {
        commentService.deleteComment(id);
        return "redirect:/post/view/" + postId;
    }
}
