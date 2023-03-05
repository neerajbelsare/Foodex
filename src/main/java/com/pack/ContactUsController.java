package com.pack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ContactUsController {

    @RequestMapping(value = "/contact",method = RequestMethod.GET)
    public String viewForm(HttpServletRequest request)
    {
        String referrer = request.getHeader("Referer");
        request.getSession().setAttribute("previousUrl", referrer);
        return "Contact";
    }

    @RequestMapping(value = "/contact",method = RequestMethod.POST)
    public String getForm(HttpServletRequest request, HttpServletResponse response, @RequestParam("name") String name, @RequestParam("email") String email, @RequestParam("description") String description, RedirectAttributes redirectAttributes)
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("insert into problems (name, email_id, problem) values(?,?,?)");

            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, description);
            stmt.executeUpdate();
        }
        catch(Exception k)
        {
            System.out.println(k);
        }
        
        String previousUrl = (String) request.getSession().getAttribute("previousUrl");
        return "redirect:" + previousUrl;
    }
}