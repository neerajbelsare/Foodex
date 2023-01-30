/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Controller
public class RegisterController {
    
    String usnm="";
    
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
            PreparedStatement stmt=con.prepareStatement("insert into users values(?,?,?,?,?,?)");

            stmt.setString(1, u);
            stmt.setString(2, v);
            stmt.setString(3, w);
            stmt.setString(4, x);
            stmt.setString(5, y);
            stmt.setString(6, z);
            stmt.executeUpdate();
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
    public String processLogin(@RequestParam("a") String x, @RequestParam("b") String y, Model object2) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("select * from users where username=? and password=?");

            stmt.setString(1, x);
            stmt.setString(2, y);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                if (rs.getString("username").equals(x) && rs.getString("password").equals(y)) {
                    usnm=rs.getString("username");
                    object2.addAttribute("NA", rs.getString("username"));
                    object2.addAttribute("EM", rs.getString("email"));

                    return "main";
                }
            }
        } catch (Exception k) {
            System.out.println(k);
        }

        return "errorLogin";
    }
    
    @RequestMapping(value = "/profile",method = RequestMethod.POST)
    public String viewProfile(Model obj)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("select * from users where username=?");
            stmt.setString(1, usnm);
            
            ResultSet rs=stmt.executeQuery();
            
            while(rs.next())
            {
//                obj.addAttribute("NM",rs.getString("NAME"));
                obj.addAttribute("NM",rs.getString("name"));
                obj.addAttribute("PHN",rs.getString("phone"));
                obj.addAttribute("USNM",rs.getString("username"));
                obj.addAttribute("EM",rs.getString("email"));
                obj.addAttribute("ADD",rs.getString("address"));
            }
            
            stmt.executeUpdate();
        }
        
        catch(Exception k)
        {
            System.out.println(k.getMessage());
        }
        
        return "DisplayProfile";
    }

    @RequestMapping(value = "/setlocation",method = RequestMethod.POST)
    public String getLocation(@RequestParam("location") String x) {
        System.out.println(x);
        return "main";
    }
}