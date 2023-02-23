package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Controller
public class RegisterController {

    String usnm = "";
    
    @RequestMapping(value = "/register")
    public String viewRegistration() {
        return "Registration";
    }

    @RequestMapping(value = "/registerform", method = RequestMethod.POST)
    public String processRegistration(@RequestParam("a") String u, @RequestParam("b") String v, @RequestParam("c") String w,
                                      @RequestParam("d") String x, @RequestParam("e") String y, @RequestParam("f") String z,
                                      Model object1) {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("insert into users(username, name, phone, email, address, password) values(?,?,?,?,?,?)");

            stmt.setString(1, u);
            stmt.setString(2, v);
            stmt.setString(3, w);
            stmt.setString(4, x);
            stmt.setString(5, y);
            stmt.setString(6, z);
            stmt.executeUpdate();

            PreparedStatement stmt1 = con.prepareStatement("insert into user_images(username) values(?)");
            stmt1.setString(1, u);
            stmt1.executeUpdate();
        }
        catch(Exception k)
        {
            System.out.println(k);
        }

        return "Login";
    }

    @RequestMapping(value = "/login")
    public String viewLogin() {
        return "Login";
    }
    @RequestMapping(value = "/loginform", method = RequestMethod.POST)
    public String processLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, @RequestParam("b") String y, Model object2) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("select * from users where username=? and password=?");

            stmt.setString(1, x);
            stmt.setString(2, y);

            ResultSet rs = stmt.executeQuery();

            PreparedStatement stmt1 = con.prepareStatement("select * from restaurants where username=?");
            stmt1.setString(1, x);

            ResultSet rst = stmt1.executeQuery();

            while (rs.next()) {
                if (rs.getString("username").equals(x) && rs.getString("password").equals(y)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("userName", x);
                    session.setAttribute("password", y);

                    session.setMaxInactiveInterval(30 * 24 * 30 * 60);
                    session.setAttribute("loggedIn", true);

                    while (rst.next()){
                        session.setAttribute("res_id", rst.getString("res_id"));
                    }

                    usnm=rs.getString("username");
                    object2.addAttribute("NA", rs.getString("username"));
                    object2.addAttribute("EM", rs.getString("email"));
                }
                else {
                    String errorMessage = "Invalid username/password";
                    object2.addAttribute("errorMessage", errorMessage);
                }
            }
        } catch (Exception k) {
            String errorMessage = "There was an unknown error! Please try again";
            object2.addAttribute("errorMessage", errorMessage);
            return "Login";
        }

        return "Home";
    }
    
//    @RequestMapping(value = "/profile",method = RequestMethod.POST)
//    public String viewProfile(Model obj)
//    {
//        try
//        {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//
//            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
//            PreparedStatement stmt=con.prepareStatement("select * from users where username=?");
//            stmt.setString(1, usnm);
//
//            ResultSet rs=stmt.executeQuery();
//
//            while(rs.next())
//            {
//                obj.addAttribute("NM",rs.getString("name"));
//                obj.addAttribute("PHN",rs.getString("phone"));
//                obj.addAttribute("USNM",rs.getString("username"));
//                obj.addAttribute("EM",rs.getString("email"));
//                obj.addAttribute("ADD",rs.getString("address"));
//            }
//
//            stmt.executeUpdate();
//        }
//
//        catch(Exception k)
//        {
//            System.out.println(k.getMessage());
//        }
//
//        return "DisplayProfile";
//    }

    @RequestMapping(value = "/setlocation",method = RequestMethod.POST)
    public String getLocation(HttpServletRequest request, HttpServletResponse response, @RequestParam("location") String x) {
        HttpSession session = request.getSession();
        session.setAttribute("currentLocation", x);
        return "main";
    }
}