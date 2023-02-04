package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@Controller
public class RestaurantController {
    @RequestMapping(value = "/partner")
    public String getPartner(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String currentURL = request.getRequestURI();
        session.setAttribute("previousPage", currentURL);

        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
            response.sendRedirect("login");
            return "Login";
        }
        else {
            return "AddRestaurant";
        }
    }

    @RequestMapping(value = "/restaurantform", method = RequestMethod.POST)
    public String submitresForm(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String s,
                                @RequestParam("b") String t, @RequestParam("c") Long u, @RequestParam("d") String v
            , @RequestParam("e") String w, @RequestParam("f") Long x, @RequestParam("g") String[] y, @RequestParam("h") String[] z
            , @RequestParam("i") String m, @RequestParam("j") String n) {
        try {
            HttpSession session = request.getSession();

            String type = String.join(",", y);
            String cuisine = String.join(",", z);

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("insert into res_requests (res_name, address, res_phone, manager, email, phone, type, cuisine, timing_open, timing_close, username) values(?,?,?,?,?,?,?,?,?,?,?)");

            stmt.setString(1, s);
            stmt.setString(2, t);
            stmt.setLong(3, u);
            stmt.setString(4, v);
            stmt.setString(5, w);
            stmt.setLong(6, x);
            stmt.setString(7, type);
            stmt.setString(8, cuisine);
            stmt.setString(9, m);
            stmt.setString(10, n);
            stmt.setString(11, (String) session.getAttribute("userName"));
            stmt.executeUpdate();

//            Part filePart = request.getPart("image");
//            InputStream inputStream = filePart.getInputStream();
//            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//            byte[] buffer = new byte[4096];
//            int bytesRead = -1;
//            while ((bytesRead = inputStream.read(buffer)) != -1) {
//                outputStream.write(buffer, 0, bytesRead);
//            }
//            byte[] imageBytes = outputStream.toByteArray();

            return "ResFormSubmit";
        } catch (Exception k) {
            System.out.println(k);
        }

        return "AddRestaurant";
    }
}
