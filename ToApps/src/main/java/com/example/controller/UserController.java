package com.example.controller;

import com.example.model.User;
import com.example.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String home() {
        return "home";
    }
    @GetMapping("/login")
    public String loginForm() {
        return "login";
    }
    @PostMapping("/login")
    public String login(@RequestParam("id") String id, @RequestParam("password") String password, HttpSession session, Model model) {
        User user = userService.login(id, password);
        if (user != null) {
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            System.out.println(user.getId());
            return "redirect:/post/list";
        } else {
            model.addAttribute("error", "Invalid ID or Password");
            return "login";
        }
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }

    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
        userService.saveUser(user);
        System.out.println(user);
        model.addAttribute("successMessage", "회원가입이 성공적으로 완료되었습니다.");
        return "login"; // 회원가입 완료 후 로그인 페이지로 이동
    }

}
