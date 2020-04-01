/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goferengine.Managers;

import goferengine.Tables.Tables;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Objects;
import test.ElasticEmail;

/**
 *
 * @author georg
 */
public class EmailManager {

    public static void main(String[] args) throws IOException, InterruptedException, UnsupportedEncodingException, ClassNotFoundException, SQLException {
        int userid = Integer.parseInt(args[0]);
        String email = args[1];
        String name = args[2];
        String option = args[3];
        if (option.equalsIgnoreCase("login")) {
//            sendloginConfirmationEMail(userid, email, name);
        } else {
            sendAccountConfirmationEMail(userid, email, name);
        }

    }

    public static String GenerateRandomUserEmailLink(int UserID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        String result = "failed";
        String randomNumber = UtilityManager.randomAlphaNumeric(25);
        String randomLink = EncryptionManager.encrypt(randomNumber, "" + UserID);
        String key = randomLink + "-" + UserID;
        result = EncryptionManager.encrypt(key, "valid");
        return result;
    }

    public static String UnhashEmailLink(String HashLink) {
        String result = "failed";

        String res = EncryptionManager.decrypt(HashLink, "valid");
        if (!(res == null || res.isEmpty() || res == "null")) {
            String userid = res.split("-")[1];
            result = EncryptionManager.decrypt(res.split("-")[0], userid) + "-" + userid;
        }
        return result;
    }

    public static String sendAccountConfirmationEMail(int UserId, String email, String name) throws ClassNotFoundException, SQLException, UnsupportedEncodingException, IOException, InterruptedException {
        String result = "failed";
        System.out.println("SimpleEmail Start");

        String emailLink = GenerateRandomUserEmailLink(UserId);
        HashMap<String, String> attachments = null;

        String emailHmtl = ""
                + "<head>\n"
                + "<title>ITHUB Verification email</title>\n"
                + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n"
                + "<meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\" />\n"
                + "<!--[if !mso]><!-- --><meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"><!--<![endif]-->\n"
                + "<!--[if !mso]><!-- --><link href=\"https://fonts.googleapis.com/css?family=Open+Sans:600,400,300\" rel=\"stylesheet\" type=\"text/css\"><!--<![endif]-->\n"
                + "<link href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" type=\"text/css\">\n"
                + "</head>\n"
                + "<body style=\"background-color:#fafbfc; padding: 5px;height: fit-content;\">\n"
                + "<div style=\"max-width: 700px;margin-right: auto!important;margin-left: auto !important;\">\n"
                + "<div style=\"text-align: center !important; margin-right: auto!important;margin-left: auto !important; padding: 10px;\">\n"
                + "<a href=\"https://ithub.ng\" style=\"text-decoration:none;\" target=\"_blank\">\n"
                + "<img alt=\"Gofer\" height=\"40\" src=\"../images/logo-blue.png\" width=\"160\"/>\n"
                + "</a>\n"
                + "</div>\n"
                + "<div style=\" padding: 30px; margin-top: 20px;background-color:#fff; border-top: 3px solid #02b3e4; border-radius: 3px; font-family:'Open+Sans', 'Open Sans', Helvetica, Arial, sans-serif;font-size:14px; line-height:24px; color:#525C65; box-shadow: 1px 2px 5px lightgrey;\">\n"
                + "<p style=\"Margin:0; font-size:18px; line-height:23px; color:#102231; font-weight:bold;\"><strong> Dear " + name + ",</strong><br><br></p>\n"
                + "<p>Thanks for registering. To activate your account, please verify your email: <br><br></p>\n"
                + "<div style=\"padding:15px 0 40px 0; border-bottom:1px solid #f3f6f9; text-align: center !important; margin-right: auto!important;margin-left: auto !important;\">\n"
                + "<a href=\"http://localhost:8090/Gofer/validate?scope=reg&key=" + emailLink + "\"  target=\"_blank\" style=\"background-color:#01b3e3; border-collapse:separate !important; border-top:10px solid #01b3e3; border-bottom:10px solid #01b3e3; border-right:45px solid #01b3e3; border-left:45px solid #01b3e3; border-radius:4px; color:#ffffff; display:inline-block; font-family:'Open+Sans','Open Sans',Helvetica, Arial, sans-serif; font-size:13px; font-weight:bold; text-align:center; text-decoration:none; letter-spacing:2px;\">VERIFY EMAIL</a>\n"
                + "</div>\n"
                + "<div style=\"padding-top:30px;\">\n"
                + "<p style=\"Margin:20px 0 20px 0;\">Or copy this link and paste in your web browser</p>\n"
                + "<p style=\"Margin:20px 0; font-size:12px; line-height:17px; word-wrap:break-word; word-break:break-all;\">\n"
                + "<a href=\"http://localhost:8090/Gofer/validate?scope=reg&key=" + emailLink + "\" style=\"color:#5885ff; text-decoration:underline;\" target=\"_blank\">\n"
                + "http://localhost:8090/Gofer/validate?scope=reg&key=" + emailLink
                + "</a>\n"
                + "</p>\n"
                + "<p style=\"font:14px/16px Arial, Helvetica, sans-serif; color:#363636; padding:0 0 14px;\">Cheers,</p>\n"
                + "<p style=\"font:bold 14px/16px Arial, Helvetica, sans-serif; color:#363636; padding:0 0 7px; \">The ITHub Team</p>\n"
                + "</div>\n"
                + "</div>\n"
                + "<div style=\"text-align: center !important; padding: 20px; margin-top: 15px;\">\n"
                + "<div style=\"width:220px; margin-right: auto!important;margin-left: auto !important; display: flex;\" >\n"
                + "<a href=\"https://twitter.com/\" target=\"_blank\" style=\"margin-right: auto; margin-left: auto;\"><i></i class=\"fab fa-facebook-square\"></a>\n"
                + "<a href=\"https://www.facebook.com/\" target=\"_blank\" style=\"margin-right: auto; margin-left: auto;\"><img alt=\"Facebook\" border=\"0\" height=\"26\" src=\"https://s3-us-west-2.amazonaws.com/udacity-email/Footer/facebook.jpg\" style=\"display:block; width:26px!important; height:26px!important;\" width=\"26\"></a>\n"
                + "<a href=\"https://www.linkedin.com/\" target=\"_blank\" style=\"margin-right: auto; margin-left: auto;\"><img alt=\"Linkedin\" border=\"0\" height=\"26\" src=\"https://s3-us-west-2.amazonaws.com/udacity-email/Footer/linkedin.jpg\" style=\"display:block; width:26px!important; height:26px!important;\" width=\"26\"></a>\n"
                + "</div>\n"
                + "</div>\n"
                + "<div style=\" text-align: center;\">\n"
                + "<div style=\"padding-bottom:40px; font-family:'Open+Sans', 'Open Sans', Helvetica, Arial, sans-serif; font-size:12px; line-height:18px; text-align:center; width:auto; color:#b7bdc1;\">\n"
                + "<p ><span>Suite J208, Road 5, Ikota Shopping Complex</span> &nbsp;•&nbsp; <span>off VGC,Ajah Lagos.</span></p>\n"
                + "</div>\n"
                + "</div>\n"
                + "</div>\n"
                + "</body>";

        String[] args = new String[]{emailHmtl, email, "welcome Aboard"};
        result = ElasticEmail.main(args);
//        result = "success";
        return result;
    }

    public static String sendPasswordResetConfirmationEMail(String email) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        String result = "failed";

        try {
            String subject = "Password Reset Confirmation";
            int UserId = UserManager.getUserIDfromEmail(email);
            String name = UserManager.getUserFirstName(UserId);
            String hashlink = GenerateRandomUserEmailLink(UserId);
            HashMap<String, String> attachments = null;
            String text = "";
            String state = "";
            String city = "";
            String timezone = "";
            String zipcode = "";
            String IpAdress = UtilityManager.getPublicIPAddress();
//            HashMap<String, String> locationDetails = GeolocationManager.GetUserLocationDetailsfromIp(IpAdress);
//            String LocationState = locationDetails.get("StateProvince");
//            String LocationCity = locationDetails.get("City");
//            String LocationZip = locationDetails.get("ZipCode");
//            String fullTimeZone = locationDetails.get("Timezone");
//            String[] timezoneArray = fullTimeZone.split("\n");
//            String timeZoneName = UtilityManager.RemoveBackwardSlashandQuotes(timezoneArray[0]);
//            String ZoneName = timeZoneName.split(":")[1];
//            String zoneOffset = UtilityManager.RemoveBackwardSlashandQuotes(timezoneArray[1]);
//            String offset = zoneOffset.split(":")[1];
//            String zoneTime = UtilityManager.RemoveBackwardSlashandQuotes(timezoneArray[2]);
//            int zonelength = zoneTime.length();
//            String currentTime = zoneTime.substring(14, zonelength - 10);
//            timezone = ZoneName + " GMT+" + offset.substring(1, 2);
//            if (!(LocationState.contains("null"))) {
//                state = LocationState;
//            }
//            if (!(LocationZip.contains("null"))) {
//                zipcode = LocationZip;
//            }
//            if (!(LocationCity.equals(state) || LocationCity.contains("null"))) {
//                city = LocationCity + " ,";
//            }

            String html = ""
                    + " <html>\n"
                    + "<head>\n"
                    + "<title>ITHUB login confirmation</title>\n"
                    + "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n"
                    + "<meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\" />\n"
                    + "<!--[if !mso]><!-- --><meta content=\"IE=edge\" http-equiv=\"X-UA-Compatible\"><!--<![endif]-->\n"
                    + "<!--[if !mso]><!-- --><link href=\"https://fonts.googleapis.com/css?family=Open+Sans:600,400,300\" rel=\"stylesheet\" type=\"text/css\"><!--<![endif]-->\n"
                    + "</head>\n"
                    + "<body style=\"background-color:#fafbfc; padding: 5px;height: fit-content;\">\n"
                    + "<div style=\"max-width: 700px;margin-right: auto!important;margin-left: auto !important;\">\n"
                    + "<div style=\"text-align: center !important; margin-right: auto!important;margin-left: auto !important; padding: 10px;\">\n"
                    + "<a href=\"https://ithub.ng\" style=\"text-decoration:none;\" target=\"_blank\">\n"
                    + "<img alt=\"ITHub\" height=\"40\" src=\"https://i.postimg.cc/6q5jS2n8/ITHub-Logo-email.png\" width=\"160\"/>\n"
                    + "</a>\n"
                    + "</div>\n"
                    + "<div style=\" padding: 30px; margin-top: 20px;background-color:#fff; border-top: 3px solid #02b3e4; border-radius: 3px; font-family:'Open+Sans', 'Open Sans', Helvetica, Arial, sans-serif;font-size:14px; line-height:24px; color:#525C65; box-shadow: 1px 2px 5px lightgrey;\">\n"
                    + "<p style=\"Margin:0; font-size:18px; line-height:23px; color:#102231; font-weight:bold; margin-bottom: 20px;\"><strong> Hello " + name + ",</strong><br></p>\n"
                    + "<p>someone recently tried to reset your account password, please confirm it is you. <br></p>\n"
//                    + "<p style=\"font-weight: bold;\"><span style=\"margin-right: 10px;\">Location: </span><span> " + city + "</span><span> " + state + " ," + "  </span><span style=\"margin-right: 5px;\"> " + locationDetails.get("CountryName") + "  </span> <span> Timezone:  </span><span>" + timezone + "  </span> <span> Current Time: </span><span>" + currentTime + "  </span></p>\n"
//                    + "<p style=\"font-weight: bold; margin-top: -5px;\"><span style=\"margin-right: 10px;\">IP Address: </span><span > " + IpAdress + " </span><br></p>\n"
                    + "<div style=\"padding:15px 0 15px 0; border-bottom:1px solid #f3f6f9; text-align: center !important; margin-right: auto!important;margin-left: auto !important; display: block;\">\n"
                    + "<a href=\"http://localhost:8084/ITHUB/validate?scope=passwordReset&answer=yes&key=" + hashlink + "\" target=\"_blank\" style=\"background-color:#01b3e3; border-collapse:separate !important; border-top:10px solid #01b3e3; border-bottom:10px solid #01b3e3; border-right:45px solid #01b3e3; border-left:45px solid #01b3e3; border-radius:4px; color:#ffffff; display:inline-block; font-family:'Open+Sans','Open Sans',Helvetica, Arial, sans-serif; font-size:13px; font-weight:bold; text-align:center; text-decoration:none; letter-spacing:2px; margin-bottom: 15px; margin-right: 5px;\">CONFIRM</a>\n"
                    + "<a href=\"http://localhost:8084/ITHUB/validate?scope=passwordReset&answer=no\" target=\"_blank\" style=\"background-color:#f44336; border-collapse:separate !important; border-top:10px solid #f44336; border-bottom:10px solid #f44336; border-right:45px solid #f44336; border-left:45px solid #f44336; border-radius:4px; color:#ffffff; display:inline-block; font-family:'Open+Sans','Open Sans',Helvetica, Arial, sans-serif; font-size:13px; font-weight:bold; text-align:center; text-decoration:none; letter-spacing:2px; margin-bottom: 15px;\">REJECT</a>\n"
                    + "</div>\n"
                    + "<div style=\"padding-top:10px;\">\n"
                    + "<p style=\"Margin:20px 0 20px 0;\">If you did not try to reset your account password, please reject and you can contact us by email at contact@ithub.ng or call 0806 000 0000, or visit our contact page</p>\n"
                    + "<p style=\"Margin:20px 0; font-size:12px; line-height:17px; word-wrap:break-word; word-break:break-all;\">\n"
                    + "<a href=\"https://ithub.ng/contact\" style=\"color:#5885ff; text-decoration:underline;\" target=\"_blank\">https://ithub.ng/contact</a>\n"
                    + "</p>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "<div style=\"text-align: center !important; padding: 20px; margin-top: 15px;\">\n"
                    + "<div style=\"width:220px; margin-right: auto!important;margin-left: auto !important; display: flex;\" >\n"
                    + "<a href=\"https://twitter.com/\" target=\"_blank\" style=\"margin-right: auto; margin-left: auto;\"><img alt=\"Twitter\" border=\"0\" height=\"26\" src=\"https://s3-us-west-2.amazonaws.com/udacity-email/Footer/twitter.jpg\" style=\"display:block; width:26px!important; height:26px!important;\" width=\"26\"></a>\n"
                    + "<a href=\"https://www.facebook.com/\" target=\"_blank\" style=\"margin-right: auto; margin-left: auto;\"><img alt=\"Facebook\" border=\"0\" height=\"26\" src=\"https://s3-us-west-2.amazonaws.com/udacity-email/Footer/facebook.jpg\" style=\"display:block; width:26px!important; height:26px!important;\" width=\"26\"></a>\n"
                    + "<a href=\"https://www.linkedin.com/\" target=\"_blank\" style=\"margin-right: auto; margin-left: auto;\"><img alt=\"Linkedin\" border=\"0\" height=\"26\" src=\"https://s3-us-west-2.amazonaws.com/udacity-email/Footer/linkedin.jpg\" style=\"display:block; width:26px!important; height:26px!important;\" width=\"26\"></a>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "<div style=\" text-align: center;\">\n"
                    + "<div style=\"padding-bottom:40px; font-family:'Open+Sans', 'Open Sans', Helvetica, Arial, sans-serif; font-size:12px; line-height:18px; text-align:center; width:auto; color:#b7bdc1;\">\n"
                    + "<p ><span>Suite J208, Road 5, Ikota Shopping Complex</span> &nbsp;•&nbsp; <span>off VGC,Ajah Lagos.</span></p>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "</body> \n"
                    + "</html>";

//            result = smtpSendMail(sendpulse, fromName, fromEmail, name, email, html, text, subject, attachments);
            String[] args = new String[]{html, email,subject};
            result = ElasticEmail.main(args);
        } catch (Exception ex) {
            String res = ex.getMessage();
            System.out.println(res);
        }

        return result;
    }


}
