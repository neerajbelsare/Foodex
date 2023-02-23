/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller

public class mainController 
{
    @RequestMapping (value="/browse")
    public String homePage()
    {
        return "main";
    }
    
    @RequestMapping (value = "/restaurants")
    public String restaurantPage()
    {
        return "restaurantdisp";
    }

    @RequestMapping (value = "/dashboard")
    public String resDashboardPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
            response.sendRedirect("login");
            return "Login";
        } else {
            return "RestaurantDashboard";
        }
    }

    @RequestMapping (value = "/offers")
    public String offersPage() throws IOException {
        return "Offers";
    }
}

   
