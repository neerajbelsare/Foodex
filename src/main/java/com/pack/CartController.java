package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@Controller
public class CartController {
    @RequestMapping(value = "/cart", method = RequestMethod.POST)
    public String getCart(HttpServletResponse response, HttpServletRequest request, @RequestParam("a") Long item_id, @RequestParam("quantity") int quantity) {
        long res_id = 0;
        try {
            HttpSession session = request.getSession();

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("select * from items where item_id=?");
            stmt.setLong(1, item_id);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                res_id = rs.getLong("res_id");
            }

            PreparedStatement stmt1 = con.prepareStatement("insert into cart(username, item_id, res_id, quantity) values(?,?,?,?)");
            stmt1.setString(1, (String) session.getAttribute("userName"));
            stmt1.setLong(2, item_id);
            stmt1.setLong(3, res_id);
            stmt1.setInt(4, quantity);
            stmt1.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return "main";
    }
}
