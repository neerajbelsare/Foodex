package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import static java.lang.System.out;

@Controller
public class RestaurantController extends HttpServlet {
    @RequestMapping(value = "/partner")
    public String getPartner(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();

        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
            response.sendRedirect("login");
            return "Login";
        } else {
            return "AddRestaurant";
        }
    }

    Long id = 0L;

    @RequestMapping(value = "/restaurantform", method = RequestMethod.POST)
    public String submitresForm(HttpServletRequest request, HttpServletResponse response, @RequestParam("l") Long r, @RequestParam("a") String s,
                                @RequestParam("b") String t, @RequestParam("c") Long u, @RequestParam("d") String v
            , @RequestParam("e") String w, @RequestParam("f") Long x, @RequestParam("g") String y, @RequestParam("h") String [] z
            , @RequestParam("i") String m, @RequestParam("j") String n, @RequestParam("rt") Float rt, @RequestParam("k") CommonsMultipartFile file) {

        try {
            HttpSession session = request.getSession();

            String cuisine = String.join(", ", z);

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("insert into restaurants (res_name, address, res_phone, manager, email, phone, type, cuisine, timing_open, timing_close, username, res_id, rating) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");

            stmt.setString(1, s);
            stmt.setString(2, t);
            stmt.setLong(3, u);
            stmt.setString(4, v);
            stmt.setString(5, w);
            stmt.setLong(6, x);
            stmt.setString(7, y);
            stmt.setString(8, cuisine);
            stmt.setString(9, m);
            stmt.setString(10, n);
            stmt.setString(11, (String) session.getAttribute("userName"));
            stmt.setLong(12, r);
            stmt.setFloat(13, rt);

            InputStream inputStream = null;

            if (file != null) {
                inputStream = file.getInputStream();
            }

            String message = null;

            try {
                PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM restaurants WHERE username=? and res_name=?");
                stmt1.setString(1, (String) session.getAttribute("userName"));
                stmt1.setString(2, s);

                ResultSet rs1 = stmt1.executeQuery();

                String sql = "INSERT INTO res_images (res_id, data) values (?, ?)";
                PreparedStatement statement = con.prepareStatement(sql);
                statement.setLong(1, r);

                if (inputStream != null) {
                    statement.setBlob(2, inputStream);
                }

                stmt.executeUpdate();
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            } catch (SQLException ex) {
                out.println(ex);
            }

            return "ResFormSubmit";
        } catch (SQLException | ClassNotFoundException | IOException ex) {
            throw new RuntimeException(ex);
        }
    }

    @RequestMapping(value = "/itemform", method = RequestMethod.POST)
    public String setImage(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String m, @RequestParam("b") Float n,
                           @RequestParam("c") Long o, @RequestParam("d") Long p, @RequestParam("e") String q, @RequestParam("r") Float rt, @RequestParam("f") CommonsMultipartFile file, Model model) {

        try {
            HttpSession session = request.getSession();
            
            String id =(String) session.getAttribute("res_id");
            
            long num = Long.parseLong(id);
            long lastSixDigits = num % 1000000;
            
            String combinedString = String.valueOf(lastSixDigits) + String.valueOf(p);
            
            long z = Long.parseLong(combinedString);

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("insert into items (item_name, price, res_id, item_id, description, rating) values(?,?,?,?,?,?)");

            stmt.setString(1, m);
            stmt.setFloat(2, n);
            stmt.setLong(3, o);
            stmt.setLong(4, z);
            stmt.setString(5, q);
            stmt.setFloat(6, rt);

            InputStream inputStream = null;

            if (file != null) {
                inputStream = file.getInputStream();
            }

            String message = null;

            try {
                PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM items WHERE res_id=?");
                stmt1.setLong(1, o);

                ResultSet rs1 = stmt1.executeQuery();

                PreparedStatement statement = con.prepareStatement("INSERT INTO item_images (item_id, data) values (?, ?)");
                statement.setLong(1, z);

                if (inputStream != null) {
                    statement.setBlob(2, inputStream);
                }

                stmt.executeUpdate();
                int row = statement.executeUpdate();
                if (row > 0) {
                    message = "File uploaded and saved into database";
                }
            } catch (SQLException ex) {
                out.println(ex);
            }

        } catch (SQLException | IOException e) {
            String errorMessage = "Unknown Error";
            model.addAttribute("errorMessage", errorMessage);
            return "RestaurantDashboard";
        }

        return "RestaurantDashboard";
    }
    
    @RequestMapping(value = "/offerform", method = RequestMethod.POST)
    public String addOffers(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") Long m, @RequestParam("b") String n,
                           @RequestParam("c") Float o, @RequestParam("d") Long p, @RequestParam("e") String q, @RequestParam("f") String r, Model model) {

        try {
            HttpSession session = request.getSession();
            
            String id =(String) session.getAttribute("res_id");
            
            long num = Long.parseLong(id);
            long lastSevenDigits = num % 10000000;
            
            String combinedString = String.valueOf(lastSevenDigits) + String.valueOf(m);
            
            long z = Long.parseLong(combinedString);

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("insert into offers (offer_id, offer_name, offer_value, res_id, description, offer_code) values(?,?,?,?,?,?)");

            stmt.setLong(1, z);
            stmt.setString(2, n);
            stmt.setFloat(3, o);
            stmt.setLong(4, p);
            stmt.setString(5, q);
            stmt.setString(6, r);
            
            stmt.executeUpdate();
            

        } catch (Exception k) {
            System.out.println(k.getMessage());
        }

        return "RestaurantDashboard";
    }
    
    @RequestMapping(value = "/offerdelete", method = RequestMethod.POST)
    public String deleteOffer(@RequestParam("a") Long id)
    {
        try 
         {
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
             PreparedStatement stmt=con.prepareStatement("delete from offers where offer_id=?");
             stmt.setLong(1, id);
             stmt.executeUpdate();
         }
         catch(Exception k1)
         {
             System.out.println(k1.getMessage());
         }
         return "addedit_offers";
    }
    
    @RequestMapping(value = "/offercheck", method = RequestMethod.POST)
    public String checkOffer(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String code)
    {
        String flse="0";
        try 
         {
             HttpSession session = request.getSession();
             
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
             PreparedStatement stmt=con.prepareStatement("select * from offers");
             
            ResultSet rst = stmt.executeQuery();

            while (rst.next()) {
                if (rst.getString("offer_code").equals(code))
                {
                    session.setAttribute("Available", code);
                    return "sidebar";
                }
                else
                {
                    session.setAttribute("Available", flse);
                    return "sidebar";
                }
            }
         }
         catch(Exception k1)
         {
             System.out.println(k1.getMessage());
         }
         return "sidebar";
    }
    
    @RequestMapping(value = "/offerdel", method = RequestMethod.POST)
    public String delOffer(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        session.removeAttribute("Available");
        return "sidebar";
    }
    
    @RequestMapping(value = "/newaddress", method = RequestMethod.POST)
    public String newAdd(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String address, @RequestParam("b") String name)
    {
        try 
         {
             HttpSession session = request.getSession();
             Class.forName("com.mysql.cj.jdbc.Driver");
             Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
             PreparedStatement stmt=con.prepareStatement("insert into deliver_address (username, name, address) values (?,?,?)");
             stmt.setString(1, (String) session.getAttribute("userName"));
             stmt.setString(2, name);
             stmt.setString(3, address);
             stmt.executeUpdate();
         }
         catch(Exception k1)
         {
             System.out.println(k1.getMessage());
         }
        
        return "sidebar";
    }
    
    @RequestMapping(value = "/addedit_items", method = RequestMethod.GET)
    public String itemPageview()
    {
        return "addedit_items";
    }
    
    @RequestMapping(value = "/addedit_offers", method = RequestMethod.GET)
    public String offerPageview()
    {
        return "addedit_offers";
    }
    
    @RequestMapping(value = "/trials", method = RequestMethod.GET)
    public String Trials()
    {
        return "trial";
    }
}