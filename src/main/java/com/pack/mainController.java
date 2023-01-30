/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller

public class mainController
{
    @RequestMapping (value="/browse", method = RequestMethod.GET)
    public String homePage()
    {
        return "main";
    }

    @RequestMapping (value="/browseform", method = RequestMethod.POST)
    public String returnhomePage(@RequestParam("a") String x)
    {
        System.out.println(x);
        return "Login";
    }
}

   
