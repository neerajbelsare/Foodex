package com.pack;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

/**
 *
 * @author mrina
 */

@Controller
public class PasswordController {
    String usernm="";
    
    @RequestMapping(value = "/forgot")
    public String forgotPass()
    {
        return "Forgot";
    }
    
    @RequestMapping(value = "/forgot", method = RequestMethod.POST)
    public String checkPass(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x, @RequestParam("b") String y, Model obj1)
    {
        try 
        {
            HttpSession session1 = request.getSession();
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8","root","root");

            PreparedStatement stmt=con.prepareStatement("SELECT * FROM USERS WHERE USERNAME=?");
            
            stmt.setString(1, y);
            
            ResultSet rs=stmt.executeQuery();

            while (rs.next())
            {
                if(rs.getString("USERNAME").equals(y))
                {
                    obj1.addAttribute("EM",rs.getString("EMAIL"));
                    usernm=rs.getString("USERNAME");

                    Random rand = new Random();
                    int code = rand.nextInt(900000) + 100000;

                    session1.setAttribute("emailCode", x);

                    String recipient = x;

                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.ssl.protocols", "TLSv1.2");
                    props.put("mail.smtp.starttls.enable", "true");

                    Authenticator auth = new Authenticator() {
                        public PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("belsareneeraj@gmail.com", "scwmjhfrfhbtahgr");
                        }
                    };
                    
                    Session session = Session.getInstance(props, auth);

                    MimeMessage message = new MimeMessage(session);
                    message.setFrom(new InternetAddress("belsareneeraj@gmail.com"));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
                    message.setSubject("Reset your Foodex Password");

                    String htmlBody = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional //EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
                            "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n" +
                            "<head>\n" +
                            "<!--[if gte mso 9]>\n" +
                            "<xml>\n" +
                            "  <o:OfficeDocumentSettings>\n" +
                            "    <o:AllowPNG/>\n" +
                            "    <o:PixelsPerInch>96</o:PixelsPerInch>\n" +
                            "  </o:OfficeDocumentSettings>\n" +
                            "</xml>\n" +
                            "<![endif]-->\n" +
                            "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n" +
                            "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" +
                            "  <meta name=\"x-apple-disable-message-reformatting\">\n" +
                            "  <!--[if !mso]><!--><meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"><!--<![endif]-->\n" +
                            "  <title></title>\n" +
                            "  \n" +
                            "    <style type=\"text/css\">\n" +
                            "      @media only screen and (min-width: 620px) {\n" +
                            "  .u-row {\n" +
                            "    width: 600px !important;\n" +
                            "  }\n" +
                            "  .u-row .u-col {\n" +
                            "    vertical-align: top;\n" +
                            "  }\n" +
                            "\n" +
                            "  .u-row .u-col-100 {\n" +
                            "    width: 600px !important;\n" +
                            "  }\n" +
                            "\n" +
                            "}\n" +
                            "\n" +
                            "@media (max-width: 620px) {\n" +
                            "  .u-row-container {\n" +
                            "    max-width: 100% !important;\n" +
                            "    padding-left: 0px !important;\n" +
                            "    padding-right: 0px !important;\n" +
                            "  }\n" +
                            "  .u-row .u-col {\n" +
                            "    min-width: 320px !important;\n" +
                            "    max-width: 100% !important;\n" +
                            "    display: block !important;\n" +
                            "  }\n" +
                            "  .u-row {\n" +
                            "    width: 100% !important;\n" +
                            "  }\n" +
                            "  .u-col {\n" +
                            "    width: 100% !important;\n" +
                            "  }\n" +
                            "  .u-col > div {\n" +
                            "    margin: 0 auto;\n" +
                            "  }\n" +
                            "}\n" +
                            "body {\n" +
                            "  margin: 0;\n" +
                            "  padding: 0;\n" +
                            "}\n" +
                            "\n" +
                            "table,\n" +
                            "tr,\n" +
                            "td {\n" +
                            "  vertical-align: top;\n" +
                            "  border-collapse: collapse;\n" +
                            "}\n" +
                            "\n" +
                            "p {\n" +
                            "  margin: 0;\n" +
                            "}\n" +
                            "\n" +
                            ".ie-container table,\n" +
                            ".mso-container table {\n" +
                            "  table-layout: fixed;\n" +
                            "}\n" +
                            "\n" +
                            "* {\n" +
                            "  line-height: inherit;\n" +
                            "}\n" +
                            "\n" +
                            "a[x-apple-data-detectors='true'] {\n" +
                            "  color: inherit !important;\n" +
                            "  text-decoration: none !important;\n" +
                            "}\n" +
                            "\n" +
                            "table, td { color: #000000; } #u_body a { color: #161a39; text-decoration: underline; }\n" +
                            "    </style>\n" +
                            "  \n" +
                            "  \n" +
                            "\n" +
                            "<!--[if !mso]><!--><link href=\"https://fonts.googleapis.com/css?family=Lato:400,700\" rel=\"stylesheet\" type=\"text/css\"><!--<![endif]-->\n" +
                            "\n" +
                            "</head>\n" +
                            "\n" +
                            "<body class=\"clean-body u_body\" style=\"margin: 0;padding: 0;-webkit-text-size-adjust: 100%;background-color: #f9f9f9;color: #000000\">\n" +
                            "  <!--[if IE]><div class=\"ie-container\"><![endif]-->\n" +
                            "  <!--[if mso]><div class=\"mso-container\"><![endif]-->\n" +
                            "  <table id=\"u_body\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;min-width: 320px;Margin: 0 auto;background-color: #f9f9f9;width:100%\" cellpadding=\"0\" cellspacing=\"0\">\n" +
                            "  <tbody>\n" +
                            "  <tr style=\"vertical-align: top\">\n" +
                            "    <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                            "    <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td align=\"center\" style=\"background-color: #f9f9f9;\"><![endif]-->\n" +
                            "    \n" +
                            "\n" +
                            "<div class=\"u-row-container\" style=\"padding: 0px;background-color: #f9f9f9\">\n" +
                            "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #f9f9f9;\">\n" +
                            "    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: #f9f9f9;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #f9f9f9;\"><![endif]-->\n" +
                            "      \n" +
                            "<!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "  <!--[if (!mso)&(!IE)]><!--><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
                            "  \n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:15px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #f9f9f9;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                            "    <tbody>\n" +
                            "      <tr style=\"vertical-align: top\">\n" +
                            "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                            "          <span>&#160;</span>\n" +
                            "        </td>\n" +
                            "      </tr>\n" +
                            "    </tbody>\n" +
                            "  </table>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "<!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "    </div>\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                            "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n" +
                            "    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n" +
                            "      \n" +
                            "<!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "  <!--[if (!mso)&(!IE)]><!--><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
                            "  \n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:25px 10px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                            "  <tr>\n" +
                            "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
                            "      \n" +
                            "      <img align=\"center\" border=\"0\" src=\"https://assets.unlayer.com/projects/139298/1676743167636-logo-exp-light.png\" alt=\"Image\" title=\"Image\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 29%;max-width: 168.2px;\" width=\"168.2\"/>\n" +
                            "      \n" +
                            "    </td>\n" +
                            "  </tr>\n" +
                            "</table>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "<!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "    </div>\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                            "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #161a39;\">\n" +
                            "    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #161a39;\"><![endif]-->\n" +
                            "      \n" +
                            "<!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "  <!--[if (!mso)&(!IE)]><!--><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
                            "  \n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:35px 10px 10px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n" +
                            "  <tr>\n" +
                            "    <td style=\"padding-right: 0px;padding-left: 0px;\" align=\"center\">\n" +
                            "      \n" +
                            "      <img align=\"center\" border=\"0\" src=\"https://cdn.templates.unlayer.com/assets/1593141680866-reset.png\" alt=\"Image\" title=\"Image\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: inline-block !important;border: none;height: auto;float: none;width: 10%;max-width: 58px;\" width=\"58\"/>\n" +
                            "      \n" +
                            "    </td>\n" +
                            "  </tr>\n" +
                            "</table>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 10px 30px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n" +
                            "    <p style=\"font-size: 14px; line-height: 140%; text-align: center;\"><span style=\"font-size: 28px; line-height: 39.2px; color: #ffffff; font-family: Lato, sans-serif;\">Please reset your password </span></p>\n" +
                            "  </div>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "<!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "    </div>\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                            "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #ffffff;\">\n" +
                            "    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #ffffff;\"><![endif]-->\n" +
                            "      \n" +
                            "<!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "  <!--[if (!mso)&(!IE)]><!--><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
                            "  \n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:40px 40px 30px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n" +
                            "    <p style=\"font-size: 14px; line-height: 140%;\"><span style=\"font-size: 18px; line-height: 25.2px; color: #666666;\">Hello, + " + y + "</span></p>\n" +
                            "<p style=\"font-size: 14px; line-height: 140%;\"> </p>\n" +
                            "<p style=\"font-size: 14px; line-height: 140%;\"><span style=\"font-size: 18px; line-height: 25.2px; color: #666666;\">We have sent you this email in response to your request to reset your password on Foodex. Your 6-digit code for verification is: </span></p>\n" +
                            "  </div>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:0px 40px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "  <!--[if mso]><style>.v-button {background: transparent !important;}</style><![endif]-->\n" +
                            "<div align=\"center\">\n" +
                            "  <!--[if mso]><v:roundrect xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:w=\"urn:schemas-microsoft-com:office:word\" href=\"\" style=\"height:58px; v-text-anchor:middle; width:240px;\" arcsize=\"1.5%\"  stroke=\"f\" fillcolor=\"#18163a\"><w:anchorlock/><center style=\"color:#FFFFFF;font-family:'Lato',sans-serif;\"><![endif]-->  \n" +
                            "    <a href=\"\" target=\"_blank\" class=\"v-button\" style=\"box-sizing: border-box;display: inline-block;font-family:'Lato',sans-serif;text-decoration: none;-webkit-text-size-adjust: none;text-align: center;color: #FFFFFF; background-color: #18163a; border-radius: 1px;-webkit-border-radius: 1px; -moz-border-radius: 1px; width:auto; max-width:100%; overflow-wrap: break-word; word-break: break-word; word-wrap:break-word; mso-border-alt: none;font-size: 23px;\">\n" +
                            "      <span style=\"display:block;padding:15px 40px;line-height:120%;\"><span style=\"line-height: 16.8px;\">" + code + "</span></span>\n" +
                            "    </a>\n" +
                            "  <!--[if mso]></center></v:roundrect><![endif]-->\n" +
                            "</div>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:40px 40px 30px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "  <div style=\"line-height: 140%; text-align: left; word-wrap: break-word;\">\n" +
                            "    <p style=\"font-size: 14px; line-height: 140%;\"><span style=\"color: #888888; font-size: 14px; line-height: 19.6px;\"><em><span style=\"font-size: 16px; line-height: 22.4px;\">Please ignore this email if you did not request a password change.</span></em></span><br /><span style=\"color: #888888; font-size: 14px; line-height: 19.6px;\"><em><span style=\"font-size: 16px; line-height: 22.4px;\">&nbsp;</span></em></span></p>\n" +
                            "  </div>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "<!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "    </div>\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "<div class=\"u-row-container\" style=\"padding: 0px;background-color: transparent\">\n" +
                            "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #18163a;\">\n" +
                            "    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: transparent;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #18163a;\"><![endif]-->\n" +
                            "      \n" +
                            "<!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px 0px 0px 20px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "  <!--[if (!mso)&(!IE)]><!--><div style=\"box-sizing: border-box; height: 100%; padding: 0px 0px 0px 20px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
                            "  \n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:25px 10px 10px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "<div align=\"center\">\n" +
                            "  <div style=\"display: table; max-width:187px;\">\n" +
                            "  <!--[if (mso)|(IE)]><table width=\"187\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"border-collapse:collapse;\" align=\"center\"><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"border-collapse:collapse; mso-table-lspace: 0pt;mso-table-rspace: 0pt; width:187px;\"><tr><![endif]-->\n" +
                            "  \n" +
                            "    \n" +
                            "    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 15px;\" valign=\"top\"><![endif]-->\n" +
                            "    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 15px\">\n" +
                            "      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                            "        <a href=\" \" title=\"Facebook\" target=\"_blank\">\n" +
                            "          <img src=\"https://cdn.tools.unlayer.com/social/icons/circle-white/facebook.png\" alt=\"Facebook\" title=\"Facebook\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                            "        </a>\n" +
                            "      </td></tr>\n" +
                            "    </tbody></table>\n" +
                            "    <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "    \n" +
                            "    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 15px;\" valign=\"top\"><![endif]-->\n" +
                            "    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 15px\">\n" +
                            "      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                            "        <a href=\" \" title=\"Twitter\" target=\"_blank\">\n" +
                            "          <img src=\"https://cdn.tools.unlayer.com/social/icons/circle-white/twitter.png\" alt=\"Twitter\" title=\"Twitter\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                            "        </a>\n" +
                            "      </td></tr>\n" +
                            "    </tbody></table>\n" +
                            "    <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "    \n" +
                            "    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 15px;\" valign=\"top\"><![endif]-->\n" +
                            "    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 15px\">\n" +
                            "      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                            "        <a href=\" \" title=\"Instagram\" target=\"_blank\">\n" +
                            "          <img src=\"https://cdn.tools.unlayer.com/social/icons/circle-white/instagram.png\" alt=\"Instagram\" title=\"Instagram\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                            "        </a>\n" +
                            "      </td></tr>\n" +
                            "    </tbody></table>\n" +
                            "    <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "    \n" +
                            "    <!--[if (mso)|(IE)]><td width=\"32\" style=\"width:32px; padding-right: 0px;\" valign=\"top\"><![endif]-->\n" +
                            "    <table align=\"left\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"32\" height=\"32\" style=\"width: 32px !important;height: 32px !important;display: inline-block;border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;margin-right: 0px\">\n" +
                            "      <tbody><tr style=\"vertical-align: top\"><td align=\"left\" valign=\"middle\" style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top\">\n" +
                            "        <a href=\" \" title=\"LinkedIn\" target=\"_blank\">\n" +
                            "          <img src=\"https://cdn.tools.unlayer.com/social/icons/circle-white/linkedin.png\" alt=\"LinkedIn\" title=\"LinkedIn\" width=\"32\" style=\"outline: none;text-decoration: none;-ms-interpolation-mode: bicubic;clear: both;display: block !important;border: none;height: auto;float: none;max-width: 32px !important\">\n" +
                            "        </a>\n" +
                            "      </td></tr>\n" +
                            "    </tbody></table>\n" +
                            "    <!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "    \n" +
                            "    \n" +
                            "    <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:5px 10px 10px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "  <div style=\"line-height: 140%; text-align: center; word-wrap: break-word;\">\n" +
                            "    <p style=\"line-height: 140%; font-size: 14px;\"><span style=\"font-size: 14px; line-height: 19.6px;\"><span style=\"color: #ecf0f1; font-size: 14px; line-height: 19.6px;\"><span style=\"line-height: 19.6px; font-size: 14px;\">Foodex ©  All Rights Reserved</span></span></span></p>\n" +
                            "  </div>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "<!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "    </div>\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "<div class=\"u-row-container\" style=\"padding: 0px;background-color: #f9f9f9\">\n" +
                            "  <div class=\"u-row\" style=\"Margin: 0 auto;min-width: 320px;max-width: 600px;overflow-wrap: break-word;word-wrap: break-word;word-break: break-word;background-color: #1c103b;\">\n" +
                            "    <div style=\"border-collapse: collapse;display: table;width: 100%;height: 100%;background-color: transparent;\">\n" +
                            "      <!--[if (mso)|(IE)]><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" border=\"0\"><tr><td style=\"padding: 0px;background-color: #f9f9f9;\" align=\"center\"><table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" style=\"width:600px;\"><tr style=\"background-color: #1c103b;\"><![endif]-->\n" +
                            "      \n" +
                            "<!--[if (mso)|(IE)]><td align=\"center\" width=\"600\" style=\"width: 600px;padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\" valign=\"top\"><![endif]-->\n" +
                            "<div class=\"u-col u-col-100\" style=\"max-width: 320px;min-width: 600px;display: table-cell;vertical-align: top;\">\n" +
                            "  <div style=\"height: 100%;width: 100% !important;\">\n" +
                            "  <!--[if (!mso)&(!IE)]><!--><div style=\"box-sizing: border-box; height: 100%; padding: 0px;border-top: 0px solid transparent;border-left: 0px solid transparent;border-right: 0px solid transparent;border-bottom: 0px solid transparent;\"><!--<![endif]-->\n" +
                            "  \n" +
                            "<table style=\"font-family:'Lato',sans-serif;\" role=\"presentation\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" border=\"0\">\n" +
                            "  <tbody>\n" +
                            "    <tr>\n" +
                            "      <td style=\"overflow-wrap:break-word;word-break:break-word;padding:15px;font-family:'Lato',sans-serif;\" align=\"left\">\n" +
                            "        \n" +
                            "  <table height=\"0px\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;table-layout: fixed;border-spacing: 0;mso-table-lspace: 0pt;mso-table-rspace: 0pt;vertical-align: top;border-top: 1px solid #1c103b;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                            "    <tbody>\n" +
                            "      <tr style=\"vertical-align: top\">\n" +
                            "        <td style=\"word-break: break-word;border-collapse: collapse !important;vertical-align: top;font-size: 0px;line-height: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%\">\n" +
                            "          <span>&#160;</span>\n" +
                            "        </td>\n" +
                            "      </tr>\n" +
                            "    </tbody>\n" +
                            "  </table>\n" +
                            "\n" +
                            "      </td>\n" +
                            "    </tr>\n" +
                            "  </tbody>\n" +
                            "</table>\n" +
                            "\n" +
                            "  <!--[if (!mso)&(!IE)]><!--></div><!--<![endif]-->\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "<!--[if (mso)|(IE)]></td><![endif]-->\n" +
                            "      <!--[if (mso)|(IE)]></tr></table></td></tr></table><![endif]-->\n" +
                            "    </div>\n" +
                            "  </div>\n" +
                            "</div>\n" +
                            "\n" +
                            "\n" +
                            "    <!--[if (mso)|(IE)]></td></tr></table><![endif]-->\n" +
                            "    </td>\n" +
                            "  </tr>\n" +
                            "  </tbody>\n" +
                            "  </table>\n" +
                            "  <!--[if mso]></div><![endif]-->\n" +
                            "  <!--[if IE]></div><![endif]-->\n" +
                            "</body>\n" +
                            "\n" +
                            "</html>\n";
                    message.setContent(htmlBody, "text/html");

                    Transport.send(message);
                    }

                    return "Forward";
                }
            
            stmt.executeUpdate();
        }
        catch(Exception k)
        {
            System.out.println(k.getMessage());
        }
        
        return "Forgot";
    }
    
    @RequestMapping(value="/create")
    public String enterNewPass()
    {
        return "CreateNew";
    }
    
    @RequestMapping(value="/create", method = RequestMethod.POST)
    public String NewPass(HttpServletRequest request, HttpServletResponse response, @RequestParam("a") String x,Model obj1)
    {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("emailCode");

        if(email.equals(x)) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fooddelivery?characterEncoding=utf8", "root", "root");
                PreparedStatement stmt = con.prepareStatement("UPDATE USERS SET PASSWORD=? WHERE USERNAME=?");
                stmt.setString(1, x);
                stmt.setString(2, usernm);
                stmt.executeUpdate();
            } catch (Exception k1) {
                System.out.println(k1.getMessage());
            }
        }
        else {
            obj1.addAttribute("msg", "The code you entered was invalid!");
            return "Forward";
        }
         return "SetFinally";
    }
}
