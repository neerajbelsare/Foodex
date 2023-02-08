package com.pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    
    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public void addUsers(String username, String name, String phone, String email, String address, String password)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("insert into users values(?,?,?,?,?,?)");

            stmt.setString(1, username);
            stmt.setString(2, name);
            stmt.setString(3, phone);
            stmt.setString(4, email);
            stmt.setString(5, address);
            stmt.setString(6, password);
            stmt.executeUpdate();
        }
        
        catch (Exception k)
        {
            System.out.println(k);
        }
    }
    
    @RequestMapping(value = "/userdelete", method = RequestMethod.POST)
    public String deleteUsers(String username)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("select * from users where username=?");

            stmt.setString(1, username);
            ResultSet rs=stmt.executeQuery();
                    
            while (rs.next())
            {
                if((rs.getString("username").equals(username)))
                {
                    PreparedStatement stmt1=con.prepareStatement("delete from users where username=?");
                    stmt1.setString(1, username);
                    stmt1.executeUpdate();
                }
            }
            stmt.executeUpdate();
        }
        
        catch (Exception k)
        {
            System.out.println(k);
        }
        
        return "users";
    }
}
