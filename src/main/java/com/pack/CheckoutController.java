package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class CheckoutController {
    @RequestMapping(value = "checkout", method = RequestMethod.POST)
    public String getCheckout(HttpServletResponse response, HttpServletRequest request, @RequestParam("a") String amt, Model obj) throws IOException {
        try {
            HttpSession session = request.getSession();

            obj.addAttribute("AMT", amt);

            return "Payments";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "Payments";
    }
}
