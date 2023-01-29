package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContactUsController {

    @RequestMapping(value = "/contact",method = RequestMethod.GET)
    public String viewForm()
    {
        return "Contact";
    }

    @RequestMapping(value = "/contact",method = RequestMethod.POST)
    public String getForm()
    {
        return "ContactFormTaken";
    }
}