package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import static java.lang.System.out;

@Controller
public class AccountController {
    @RequestMapping(value = "/account")
    public String returnAccount(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        HttpSession session = request.getSession();
        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
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
            }
            return "Account";
        }
    }

    @RequestMapping(value = "/accountform", method = RequestMethod.POST)
    public String getDetails(HttpServletRequest request, HttpServletResponse response, @RequestParam("inputUsername") String m, @RequestParam("inputName") String n,
                             @RequestParam("inputPhone") Long o, @RequestParam("inputEmail") String p, @RequestParam("inputAddress") String q, @RequestParam("inputPassword") String r, @RequestParam(value = "profile-image", required = false) CommonsMultipartFile file) {

        try {
            HttpSession session = request.getSession();

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("update users set name = ?, phone=?, email=?, address=?, password=? where username=?;");

            stmt.setString(1, n);
            stmt.setLong(2, o);
            stmt.setString(3, p);
            stmt.setString(4, q);
            stmt.setString(5, r);
            stmt.setString(6, (String) session.getAttribute("userName"));
            stmt.executeUpdate();

            InputStream inputStream = null;

            if (file != null) {
                inputStream = file.getInputStream();
            }

            String message = null;

            try {

                PreparedStatement statement = con.prepareStatement("update user_images set data=? where username=?");

                if (inputStream != null) {
                    statement.setBlob(1, inputStream);
                }

                statement.setString(2, m);

                stmt.executeUpdate();
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            } catch (SQLException ex) {
                out.println(ex);
            }
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }

        return "Account";
    }
}
