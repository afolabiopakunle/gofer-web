/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

/**
 *
 * @author DELL
 */
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

public class ElasticEmail {

    private static String userName = "princejoswal@gmail.com";
    private static String apiKey = "44B9D92E2EE6B020CC10AE601F3BCD756A390E6AD4AB9702BEFF617B035E0D278A546CE815A285F27A0F43A59D63E95F";

    public static String fromName = "ITHub";
    public static String fromEmail = "princejoswal@gmail.com";

    public static String main(String[] args) {
         String result = "failed";
         
        String html = args[0];
        String email = args[1];
        String subject = args[2];
      
        result =  SendElasticEmail(userName, apiKey, fromEmail, fromName, subject, html, email);
        return result;
    }

    public static String SendElasticEmail(String userName, String apiKey, String from, String fromName, String subject, String body, String to) {

        String result = "failed";
        try {

            //Construct the data
            String data = "userName=" + URLEncoder.encode(userName, "UTF-8");
            data += "&api_key=" + URLEncoder.encode(apiKey, "UTF-8");
            data += "&from=" + URLEncoder.encode(from, "UTF-8");
            data += "&from_name=" + URLEncoder.encode(fromName, "UTF-8");
            data += "&subject=" + URLEncoder.encode(subject, "UTF-8");
            data += "&body_html=" + URLEncoder.encode(body, "UTF-8");
            data += "&to=" + URLEncoder.encode(to, "UTF-8");

            //Send data
            URL url = new URL("https://api.elasticemail.com/v2/email/send");
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(data);
            wr.flush();
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String res = rd.readLine();
            System.out.println(res);
            if (!res.contains("Error")) {
                result = "success";
            }
            wr.close();
            rd.close();

        } catch (Exception e) {

            e.printStackTrace();
        }

        return result;
    }

}
