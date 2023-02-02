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
                                @RequestParam("b") String t, @RequestParam("c") Integer u, @RequestParam("d") String v
            , @RequestParam("e") String w, @RequestParam("f") String x, @RequestParam("g") String[] y, @RequestParam("h") String[] z
            , @RequestParam("i") String m, @RequestParam("j") String n) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("insert into restaurants (res_name, address, res_phone, " +
                    "manager, email, phone, type, cuisine, timing_open, timing_close) values(?,?,?,?,?,?,?,?,?,?,?)");

            stmt.setString(1, s);
            stmt.setString(2, t);
            stmt.setInt(3, u);
            stmt.setString(4, v);
            stmt.setString(5, w);
            stmt.setString(6, x);
            stmt.setArray(7, stmt.getConnection().createArrayOf("String", y));
            stmt.setArray(8, stmt.getConnection().createArrayOf("String", z));
            stmt.setString(9, m);
            stmt.setString(10, n);
            stmt.setString(11, (String) request.getAttribute("userName"));
            stmt.executeUpdate();

//            Part part = request.getPart("image");
//            InputStream inputStream = part.getInputStream();
//            String fileName = getFileName(part);
//
//            String sql = "INSERT INTO res_images (name, data) VALUES (?, ?)";
//            PreparedStatement statement = con.prepareStatement(sql);
//            statement.setString(1, "image.jpg");
//
//            InputStream inputStream = new FileInputStream("path/to/image.jpg");
//            statement.setBinaryStream(2, inputStream);

            //statement.executeUpdate();
        } catch (Exception k) {
            System.out.println(k);
        }
        return s;
    }
}
