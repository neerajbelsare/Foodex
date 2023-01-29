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

/**
 *
 * @author mrina
 */

@Controller
public class PasswordController {
    String usernm="";
    
    @RequestMapping(value = "/forgot")
    public String forgotPass()
    {
        return "Forgot";
    }
    
    @RequestMapping(value = "/forgot", method = RequestMethod.POST)
    public String checkPass(@RequestParam("a") String x, @RequestParam("b") String y, Model obj1)
    {      
        obj1.addAttribute("msg","Checking");
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");

            PreparedStatement stmt=con.prepareStatement("SELECT * FROM USERS WHERE EMAIL=? AND USERNAME=?");
            
            stmt.setString(1, x);
            stmt.setString(2, y);
            
            ResultSet rs=stmt.executeQuery();

            while (rs.next())
            {
                if(rs.getString("USERNAME").equals(y))
                {
                    obj1.addAttribute("EM",rs.getString("EMAIL"));
                    usernm=rs.getString("USERNAME");
                    System.out.println(rs.getString("USERNAME"));
                    return "Forward";
                }
            }
            
            stmt.executeUpdate();
        }
        catch(Exception k)
        {
            System.out.println(k.getMessage());
        }
        
        return "Forgot";
    }
    
    @RequestMapping(value="/create")
    public String enterNewPass()
    {
        return "CreateNew";
    }
    
    @RequestMapping(value="/create", method = RequestMethod.POST)
    public String NewPass(@RequestParam("a") String x,Model obj1)
    {
        obj1.addAttribute("msg","Password Updated Successfully");
         try 
         {
             Class.forName("com.mysql.cj.jdbc.Driver");

             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
             PreparedStatement stmt=con.prepareStatement("UPDATE USERS SET PASSWORD=? WHERE USERNAME=?");
             stmt.setString(1, x);
             stmt.setString(2, usernm);
             stmt.executeUpdate();
         }
         catch(Exception k1)
         {
             System.out.println(k1.getMessage());
         }
         return "SetFinally";
    }
}
