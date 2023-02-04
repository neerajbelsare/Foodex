package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @RequestMapping(value = "/admin")
    public String getAdmin() {
        return "Admin";
    }

    @RequestMapping(value = "/users")
    public String getUsers() {
        return "Users";
    }
}
