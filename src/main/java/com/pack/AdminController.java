package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {
    @RequestMapping(value = "/admin")
    public String getAdmin(HttpServletRequest request, HttpServletResponse response) throws IOException {
            return "Admin";
    }

    @RequestMapping(value = "/users")
    public String getUsers(HttpServletRequest request, HttpServletResponse response) throws IOException {
            return "Users";
    }
    
    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public String addUsers(String username, String name, String phone, String email, String address, String password)
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
        
        return "Users";
    }
    
    @RequestMapping(value = "/userdelete", method = RequestMethod.POST)
    public String deleteUsers(@RequestParam("username")String username)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
//            PreparedStatement stmt=con.prepareStatement("delete from user_images where username=?");
//            stmt.setString(1, username);
//            stmt.executeUpdate();
            
            PreparedStatement stmt1=con.prepareStatement("delete from users where username=?");
            stmt1.setString(1, username);
            stmt1.executeUpdate();
//            PreparedStatement stmt=con.prepareStatement("select * from users where username=?");
//
//            stmt.setString(1, username);
//            ResultSet rs=stmt.executeQuery();
//                    
//            while (rs.next())
//            {
//                if((rs.getString("username").equals(username)))
//                {
//                    PreparedStatement stmt1=con.prepareStatement("delete from users where username=?");
//                    stmt1.setString(1, username);
//                    stmt1.executeUpdate();
//                }
//            }
//            stmt.executeUpdate();
        }
        
        catch (Exception k)
        {
            System.out.println(k);
        }
        
        return "Users";
    }
    
    String usnm="";
    
    @RequestMapping(value = "/userupdate", method = RequestMethod.POST)
    public String updateUsers(String username)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("select * from users where username=?");

            stmt.setString(1, username);
            ResultSet rs=stmt.executeQuery();
                
            usnm=username;
            
            while (rs.next())
            {
                if((rs.getString("username").equals(username)))
                {
                    return "updateUsers";
                }
            }
            stmt.executeUpdate();
        }
        
        catch (Exception k)
        {
            System.out.println(k);
        }
        
        return "Users";
    }
    
    @RequestMapping(value = "/Restaurantsdash")
    public String getRes() {
        return "Restaurants";
    }
    
    @RequestMapping(value = "/restrodelete", method = RequestMethod.POST)
    public String deleteRestro(@RequestParam("res_id") Long res_id)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            //update cascade delete cascade
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("delete from res_images where res_id=?");
            stmt.setLong(1, res_id);
            stmt.executeUpdate();
            
            PreparedStatement stmt1=con.prepareStatement("delete from restaurants where res_id=?");
            stmt1.setLong(1, res_id);
            stmt1.executeUpdate();
                    
//            ResultSet rs=stmt.executeQuery();
//                    
//            while (rs.next())
//            {
//                if((rs.getLong("res_id").equals(res_id)))
//                {
////                    PreparedStatement stmt2=con.prepareStatement("delete from res_images where res_id=?");
////                    stmt2.setString(1, res_id);
//                    PreparedStatement stmt1=con.prepareStatement("delete from restaurants where res_id=?");
//                    stmt1.setLong(1, res_id);
//                    stmt1.executeUpdate();
////                    stmt2.executeUpdate();
//                }
//            }
//            stmt.executeUpdate();
        }
        
        catch (Exception k)
        {
            System.out.println(k);
        }
        
        return "Restaurants";
    }
}
