package com.pack;

import de.taimos.totp.TOTP;
import org.apache.commons.codec.binary.Base32;
import org.apache.commons.codec.binary.Hex;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegisterController {

    String usnm = "";
    String pwd = "";
    String email = "";
    
    @RequestMapping(value = "/register")
    public String viewRegistration() {
        return "Registration";
    }

    @RequestMapping(value = "/registerform", method = RequestMethod.POST)
    public String processRegistration(@RequestParam("a") String u, @RequestParam("b") String v, @RequestParam("c") String w,
                                      @RequestParam("d") String x, @RequestParam("e") String y, @RequestParam("f") String z,
                                      Model object1) {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt=con.prepareStatement("insert into users(username, name, phone, email, address, password) values(?,?,?,?,?,?)");

            stmt.setString(1, u);
            stmt.setString(2, v);
            stmt.setString(3, w);
            stmt.setString(4, x);
            stmt.setString(5, y);
            stmt.setString(6, z);
            stmt.executeUpdate();
            
            PreparedStatement stmt2 = con.prepareStatement("insert into deliver_address (name, username, address) values (?,?,?)");
            stmt2.setString(1, v);
            stmt2.setString(2, u);
            stmt2.setString(3, y);

            PreparedStatement stmt1 = con.prepareStatement("insert into user_images(username) values(?)");
            stmt1.setString(1, u);
            stmt1.executeUpdate();
        }
        catch(Exception k)
        {
            System.out.println(k);
        }

        return "Login";
    }

    @RequestMapping(value = "/login")
    public String viewLogin(HttpServletRequest request) {
        String referrer = request.getHeader("Referer");
        request.getSession().setAttribute("previousUrl", referrer);
        return "Login";
    }
    @RequestMapping(value = "/loginform", method = RequestMethod.POST)
    public String processLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, @RequestParam("b") String y, RedirectAttributes redirectAttributes) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("select * from users where username=? and password=?");

            stmt.setString(1, x);
            stmt.setString(2, y);

            ResultSet rs = stmt.executeQuery();

            PreparedStatement stmt1 = con.prepareStatement("select * from restaurants where username=?");
            stmt1.setString(1, x);

            ResultSet rst = stmt1.executeQuery();

            while (rs.next()) {
                if (rs.getString("username").equals(x) && rs.getString("password").equals(y)) {
                    if(rs.getString("twofa").equals("YES")) {
                        usnm = x;
                        pwd = y;
                        email = rs.getString("email");
                        return "TwoFA";
                    }

                    else if(rs.getString("twofa").equals("NO")) {
                        HttpSession session = request.getSession();
                        session.setAttribute("userName", x);
                        session.setAttribute("password", y);
                        session.setAttribute("email", rs.getString("email"));

                        session.setMaxInactiveInterval(30 * 24 * 30 * 60);
                        session.setAttribute("loggedIn", true);

                        while (rst.next()){
                            session.setAttribute("res_id", rst.getString("res_id"));
                        }

                        usnm=rs.getString("username");
                        redirectAttributes.addFlashAttribute("NA", rs.getString("username"));
                        redirectAttributes.addFlashAttribute("EM", rs.getString("email"));
                    }
                }
                else {
                    String errorMessage = "Invalid username/password";
                    redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
                }
            }
        } catch (Exception k) {
            String errorMessage = "There was an unknown error! Please try again";
            redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
            return "Login";
        }

        String previousUrl = (String) request.getSession().getAttribute("previousUrl");
        return "redirect:" + previousUrl;
    }

    @RequestMapping(value = "/setlocation",method = RequestMethod.POST)
    public String getLocation(HttpServletRequest request, HttpServletResponse response, @RequestParam("location") String x) {
        HttpSession session = request.getSession();
        session.setAttribute("currentLocation", x);
        return "Home";
    }

    @RequestMapping(value = "/twofa", method = RequestMethod.POST)
    public String getTwoFA(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, Model object2) {
        HttpSession session = request.getSession();

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt = con.prepareStatement("select * from users where username=? and password=?");

            stmt.setString(1, usnm);
            stmt.setString(2, pwd);

            ResultSet rs = stmt.executeQuery();

            PreparedStatement stmt1 = con.prepareStatement("select * from restaurants where username=?");
            stmt1.setString(1, x);

            ResultSet rst = stmt1.executeQuery();

            while(rs.next()) {
                if (x.equals(getTOTPCode(rs.getString("secretcode")))) {
                    session.setAttribute("userName", usnm);
                    session.setAttribute("password", pwd);
                    session.setAttribute("email", email);

                    session.setMaxInactiveInterval(30 * 24 * 30 * 60);
                    session.setAttribute("loggedIn", true);

                    while (rst.next()){
                        session.setAttribute("res_id", rst.getString("res_id"));
                    }

                    usnm=rs.getString("username");
                    object2.addAttribute("NA", rs.getString("username"));
                    object2.addAttribute("EM", rs.getString("email"));
                    return "Home";
                } else {
                    session.invalidate();
                    String errorMessage = "The code is incorrect. Please try again!";
                    object2.addAttribute("errorMessage", errorMessage);
                    return "TwoFA";
                }
            }
        } catch(Exception e) {
            System.out.println(e);
        }

        return "Home";
    }

    public static String getTOTPCode(String secretKey) {
        Base32 base32 = new Base32();
        byte[] bytes = base32.decode(secretKey);
        String hexKey = Hex.encodeHexString(bytes);
        return TOTP.getOTP(hexKey);
    }
}