package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@Controller
public class AccountController {
    @RequestMapping(value = "/account")
    public String returnAccount(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        HttpSession session = request.getSession();
        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
            response.sendRedirect("login");
            return "Login";
        } else {
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
                PreparedStatement stmt = con.prepareStatement("select * from users where username = ?");
                stmt.setString(1, (String) session.getAttribute("userName"));
                ResultSet rs = stmt.executeQuery();

                while(rs.next()) {
                    model.addAttribute("NM",rs.getString("name"));
                    model.addAttribute("PHN",rs.getString("phone"));
                    model.addAttribute("USNM",rs.getString("username"));
                    model.addAttribute("EM",rs.getString("email"));
                    model.addAttribute("ADD",rs.getString("address"));
                    model.addAttribute("PWD",rs.getString("password"));
                }
            } catch (SQLException e) {
                String errorMessage = "Unknown Error";
                model.addAttribute("errorMessage", errorMessage);
                return "Account";
            }
            return "Account";
        }
    }

//    @RequestMapping(value = "/accountform")
//    public String getDetails(HttpServletRequest request, HttpServletResponse response, Model model) {
//
//    }
}
