/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author mrina
 */

@Controller
public class DeleteController {
    @RequestMapping(value="/deleteuser", method = RequestMethod.GET)
    public String deleteUser()
    {
        return "Delete";
    }
    
    String id="";
    
    @RequestMapping(value="/deleteuser", method = RequestMethod.POST)
    public String delete(@RequestParam("a") String x,@RequestParam("b") String y, Model obj1)
    {
        obj1.addAttribute("msg","Checking");
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","root");
            PreparedStatement stmt=con.prepareStatement("SELECT * FROM USERS WHERE EMAIL=? AND PASSWORD=?");
            
            stmt.setString(1, x);
            stmt.setString(2, y);
            
            ResultSet rs=stmt.executeQuery();
                    
            while (rs.next())
            {
                if((rs.getString("EMAIL").equals(x)) && (rs.getString("PASSWORD").equals(y)))
                {
                    obj1.addAttribute("EM",rs.getString("EMAIL"));
                    id=rs.getString("EMAIL");
                    return "Forward1";
                }
            }
            
            stmt.executeUpdate();
        }
        catch(Exception k)
        {
            System.out.println(k.getMessage());
        }
        
        return "Delete";
    }
    
    @RequestMapping(value="/deletefin", method = RequestMethod.GET)
    public String NewPass(Model obj1)
    {
        obj1.addAttribute("msg","Record Deleted Successfully");
         try 
         {
             Class.forName("oracle.jdbc.driver.OracleDriver");
             Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","root");
             PreparedStatement stmt=con.prepareStatement("DELETE FROM USERS WHERE EMAIL=?");
             stmt.setString(1, id);
             stmt.executeUpdate();
         }
         catch(Exception k1)
         {
             System.out.println(k1.getMessage());
         }
         return "DeletedFinally";
    }
}
