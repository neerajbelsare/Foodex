package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Controller
public class HomeController {
    @RequestMapping(value="/home")
    public String deleteUser()
    {
        return "Home";
    }

    @RequestMapping(value="/payment")
    public String Homecontroller()
    {
        return "Payments";
    }

    @RequestMapping(value = "/itemdelete")
    public String getItem() {
        return "addedit_items";
    }
    
    @RequestMapping(value="/itemdelete", method = RequestMethod.POST)
    public String itemDelete(String item_id)
    {
        long id=Long.parseLong(item_id);
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("select * from items where item_id=?");

            stmt.setLong(1, id);
            ResultSet rs=stmt.executeQuery();
                    
            while (rs.next())
            {
                if((rs.getString("item_id").equals(id)))
                {
//                    PreparedStatement stmt2=con.prepareStatement("delete from res_images where res_id=?");
//                    stmt2.setString(1, res_id);
                    PreparedStatement stmt1=con.prepareStatement("delete from items where item_id=?");
                    stmt1.setLong(1, id);
                    stmt1.executeUpdate();
//                    stmt2.executeUpdate();
                }
            }
            stmt.executeUpdate();
        }
        
        catch (Exception k)
        {
            System.out.println(k);
        }
        
        return "addedit_items";
    }

}
