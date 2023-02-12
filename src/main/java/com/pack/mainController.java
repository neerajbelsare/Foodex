/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String resDashboardPage() throws IOException {
        return "RestaurantDashboard";
    }

    @RequestMapping (value = "/offers")
    public String offersPage() throws IOException {
        return "Offers";
    }
}

   
