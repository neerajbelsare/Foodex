package com.pack;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import org.apache.commons.codec.binary.Base32;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.SecureRandom;
import java.sql.*;

import static java.lang.System.out;


@Controller
public class AccountController {
    String secretKey = null;

    @RequestMapping(value = "/account")
    public String returnAccount(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        HttpSession session = request.getSession();
        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
            return "Login";
        } else {
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
                PreparedStatement stmt = con.prepareStatement("select * from users where username = ?");
                stmt.setString(1, (String) session.getAttribute("userName"));
                ResultSet rs = stmt.executeQuery();

                while(rs.next()) {
                    model.addAttribute("NM",rs.getString("name"));
                    model.addAttribute("PHN",rs.getString("phone"));
                    model.addAttribute("USNM",rs.getString("username"));
                    model.addAttribute("EM",rs.getString("email"));
                    model.addAttribute("ADD",rs.getString("address"));
                    model.addAttribute("PWD",rs.getString("password"));
                }
            } catch (SQLException e) {
                String errorMessage = "Unknown Error";
                model.addAttribute("errorMessage", errorMessage);
            }
            return "Account";
        }
    }

    @RequestMapping(value = "/accountform", method = RequestMethod.POST)
    public String getDetails(HttpServletRequest request, HttpServletResponse response, @RequestParam("inputUsername") String m, @RequestParam("inputName") String n,
                             @RequestParam("inputPhone") Long o, @RequestParam("inputEmail") String p, @RequestParam("inputAddress") String q, @RequestParam("inputPassword") String r, @RequestParam(value = "profile-image", required = false) CommonsMultipartFile file) {

        try {
            HttpSession session = request.getSession();

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
            PreparedStatement stmt = con.prepareStatement("update users set name=?, phone=?, email=?, address=?, password=? where username=?");

            stmt.setString(1, n);
            stmt.setLong(2, o);
            stmt.setString(3, p);
            stmt.setString(4, q);
            stmt.setString(5, r);
            stmt.setString(6, (String) session.getAttribute("userName"));

            InputStream inputStream = null;

            if (file != null) {
                inputStream = file.getInputStream();
            }

            String message = null;

            try {
                PreparedStatement statement = con.prepareStatement("update user_images set data=? where username=?");
                statement.setString(2, m);

                if (inputStream != null) {
                    statement.setBlob(1, inputStream);
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
            throw new RuntimeException(e);
        }

        return "Account";
    }

    public static String generateSecretKey() {
        SecureRandom random = new SecureRandom();
        byte[] bytes = new byte[20];
        random.nextBytes(bytes);
        Base32 base32 = new Base32();
        return base32.encodeToString(bytes);
    }

    @RequestMapping(value = "/settings", method = RequestMethod.GET)
    public String getSettings(HttpServletRequest request, HttpServletResponse response) throws IOException, WriterException {
        HttpSession session = request.getSession();
        Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
        if (loggedIn == null || !loggedIn) {
            return "Login";
        } else {
            try {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
                PreparedStatement stmt = con.prepareStatement("select * from users where username=?");
                stmt.setString(1, (String) session.getAttribute("userName"));
                ResultSet rs = stmt.executeQuery();

                while(rs.next()){
                    if(rs.getString("secretcode") == null){
                        secretKey = generateSecretKey();
                    }

                    else {
                        secretKey = rs.getString("secretcode");
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
            }

            session.setAttribute("secretKey", secretKey);

            String email = (String) session.getAttribute("email");
            String companyName = "Foodex";
            String barCodeUrl = getGoogleAuthenticatorBarCode(secretKey, email, companyName);
            createQRCode(barCodeUrl,  "D:/MIT AOE/SY/Super 30/Foodex/src/main/webapp/resources/assets/img/qrcode.png", 1024, 1024);

            return "Settings";
        }
    }

    public static String getGoogleAuthenticatorBarCode(String secretKey, String account, String issuer) {
        try {
            return "otpauth://totp/"
                    + URLEncoder.encode(issuer + ":" + account, "UTF-8").replace("+", "%20")
                    + "?secret=" + URLEncoder.encode(secretKey, "UTF-8").replace("+", "%20")
                    + "&issuer=" + URLEncoder.encode(issuer, "UTF-8").replace("+", "%20");
        } catch (UnsupportedEncodingException e) {
            throw new IllegalStateException(e);
        }
    }

    public static void createQRCode(String barCodeData, String filePath, int height, int width)
            throws WriterException, IOException {
        BitMatrix matrix = new MultiFormatWriter().encode(barCodeData, BarcodeFormat.QR_CODE,
                width, height);
        try (FileOutputStream out = new FileOutputStream(filePath)) {
            MatrixToImageWriter.writeToStream(matrix, "png", out);
        }
    }

    @RequestMapping(value = "/settings", method = RequestMethod.POST)
    public String set2fa(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "a", required = false) String x) {
        HttpSession session = request.getSession();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");
            PreparedStatement stmt2 = con.prepareStatement("select * from users where username=?");
            stmt2.setString(1, (String) session.getAttribute("userName"));

            ResultSet rs = stmt2.executeQuery();

            PreparedStatement stmt3 = con.prepareStatement("update users set twofa=? where username=?");

            if(x == null){
                stmt3.setString(1, "NO");
                stmt3.setString(2, (String) session.getAttribute("userName"));
            }

            else if(x.equals("on")) {
                stmt3.setString(1, "YES");
                stmt3.setString(2, (String) session.getAttribute("userName"));
                PreparedStatement stmt1 = con.prepareStatement("update users set secretcode=? where username=?");
                stmt1.setString(1, secretKey);
                stmt1.setString(2, (String) session.getAttribute("userName"));
                stmt1.executeUpdate();
            }

            stmt3.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
        return "Settings";
    }
}
