/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goferengine.Managers;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.URL;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author ndfmac
 */
public class UtilityManager {

    public UtilityManager() {

    }

    public static LinkedHashMap<String, String> sortHashMapStringStringByValues(HashMap<String, String> passedMap) {
        List<String> mapKeys = new ArrayList<>(passedMap.keySet());
        List<String> mapValues = new ArrayList<>(passedMap.values());
        Collections.sort(mapValues);
        Collections.sort(mapKeys);

        LinkedHashMap<String, String> sortedMap
                = new LinkedHashMap<>();

        Iterator<String> valueIt = mapValues.iterator();
        while (valueIt.hasNext()) {
            String val = valueIt.next().trim();
            Iterator<String> keyIt = mapKeys.iterator();

            while (keyIt.hasNext()) {
                String key = keyIt.next().trim();
                String comp1 = passedMap.get(key);
                String comp2 = val;

                if (comp1.equals(comp2)) {
                    keyIt.remove();
                    sortedMap.put(key, val);
                    break;
                }
            }
        }
        return sortedMap;
    }

    public static LinkedHashMap<Integer, String> SortHashMapIntStringByValues(HashMap<Integer, String> passedMap) {
        List<Integer> mapKeys = new ArrayList<>(passedMap.keySet());
        List<String> mapValues = new ArrayList<>(passedMap.values());
        Collections.sort(mapValues);
        Collections.sort(mapKeys);

        LinkedHashMap<Integer, String> sortedMap = new LinkedHashMap<>();

        Iterator<String> valueIt = mapValues.iterator();
        while (valueIt.hasNext()) {
            String val = valueIt.next().trim();
            Iterator<Integer> keyIt = mapKeys.iterator();
            while (keyIt.hasNext()) {
                int key = keyIt.next();
                String comp1 = passedMap.get(key);
                String comp2 = val;
                if (comp1.trim().equals(comp2.trim())) {
                    keyIt.remove();
                    sortedMap.put(key, val);
                    break;
                }
            }
        }
        return sortedMap;
    }

    public static ArrayList<Integer> SortHashMapIntStringReturnArrayListInt(HashMap<Integer, String> passedMap) {
        List<Integer> mapKeys = new ArrayList<>(passedMap.keySet());
        List<String> mapValues = new ArrayList<>(passedMap.values());
        Collections.sort(mapValues);
        Collections.sort(mapKeys);

        ArrayList<Integer> sortedList = new ArrayList<>();

        Iterator<String> valueIt = mapValues.iterator();
        while (valueIt.hasNext()) {
            String val = valueIt.next().trim();
            Iterator<Integer> keyIt = mapKeys.iterator();

            while (keyIt.hasNext()) {
                int key = keyIt.next();
                String comp1 = passedMap.get(key).trim();
                String comp2 = val.trim();

                if (comp1.equals(comp2)) {
                    keyIt.remove();
                    sortedList.add(key);
                    break;
                }
            }
        }
        return sortedList;
    }

    public static java.sql.Date CurrentDate() throws ParseException {
        Calendar currentdate = Calendar.getInstance();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
        String Placeholder = formatter.format(currentdate.getTime());
        java.util.Date datenow = formatter.parse(Placeholder);
        java.sql.Date CurrentDate = new Date(datenow.getTime());
        return CurrentDate;
    }

    public static java.sql.Time CurrentTime() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Time(today.getTime());
    }

    public static java.sql.Date getSqlDateFromString(String StringDate) {
        Date date;
        try {
            date = Date.valueOf(StringDate);
        } catch (Exception e) {
            date = null;
        }
        return date;
    }

    public static int RandomNumber(int max, int min) {
        Random rand = new Random();
        int itID = rand.nextInt((max - min) + 1) + min;
        return itID;
    }

    public static String GenerateAlphaNumericCode(int LengthOfCode) {
        char[] chars = "abcdefghijklmnopqrstuvwxyz1234567890".toCharArray();
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < LengthOfCode; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        return output;
    }

    public static String PunctuatePrice(String price) {
        if (price.length() > 3) {
            price = price.substring(0, price.length() - 3) + "," + price.substring(price.length() - 3, price.length());
        }
        return price;
    }

    public static ArrayList<Integer> removeDuplicatesIntegerArrayList(ArrayList<Integer> arraylist) {
        ArrayList<Integer> result = new ArrayList<Integer>(new LinkedHashSet<Integer>(arraylist));
        return result;
    }

    public static String getTextBeforeCharacter(String text, String character) {
        String res = text.substring(0, text.indexOf(character));
        return res;
    }

    public static java.sql.Date GetExpiryMonth(int value) throws ParseException {
        Calendar currentdate = Calendar.getInstance();
        currentdate.add(Calendar.MONTH, value);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
        String Placeholder = formatter.format(currentdate.getTime());
        java.util.Date datenow = formatter.parse(Placeholder);
        java.sql.Date CurrentDate = new Date(datenow.getTime());
        return CurrentDate;
    }

    public static java.sql.Date GetExpiryDate(int value) throws ParseException {
        Calendar currentdate = Calendar.getInstance();
        currentdate.add(Calendar.DATE, value);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
        String Placeholder = formatter.format(currentdate.getTime());
        java.util.Date datenow = formatter.parse(Placeholder);
        java.sql.Date CurrentDate = new Date(datenow.getTime());
        return CurrentDate;
    }

    public static java.sql.Date GetExpiryHour(int value) throws ParseException {
        Calendar currentdate = Calendar.getInstance();
        currentdate.add(Calendar.HOUR, value);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
        String Placeholder = formatter.format(currentdate.getTime());
        java.util.Date datenow = formatter.parse(Placeholder);
        java.sql.Date CurrentDate = new Date(datenow.getTime());
        return CurrentDate;
    }

    public static java.sql.Date GetExpiryMinute(int value) throws ParseException {
        Calendar currentdate = Calendar.getInstance();
        currentdate.add(Calendar.MINUTE, value);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MMM-dd");
        String Placeholder = formatter.format(currentdate.getTime());
        java.util.Date datenow = formatter.parse(Placeholder);
        java.sql.Date CurrentDate = new Date(datenow.getTime());
        return CurrentDate;
    }

    public static ArrayList<String> removeDuplicatesStringArrayList(ArrayList<String> arraylist) {
        ArrayList<String> result = new ArrayList<String>(new LinkedHashSet<String>(arraylist));
        return result;
    }

    public static String getTextAfterCharacter(String text, String character) {
        String res = text.substring(text.indexOf(character) + 1, text.length());
        return res;
    }

    private static final String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    public static String randomAlphaNumeric(int count) {
        StringBuilder builder = new StringBuilder();
        while (count-- != 0) {
            int character = (int) (Math.random() * ALPHA_NUMERIC_STRING.length());
            builder.append(ALPHA_NUMERIC_STRING.charAt(character));
        }
        return builder.toString();
    }

    public static String getIPAddress() {
        try {
            InetAddress inetaddress = InetAddress.getLocalHost(); //Get LocalHost refrence

            String ip = inetaddress.getHostAddress(); // Get Host IP Address
            return ip; // return IP Address
        } catch (Exception E) {

            E.printStackTrace(); //print Exception StackTrace
            return null;
        }

    }

    public static String getPublicIPAddress() {
        String systemipaddress = "";
        try {
            URL url_name = new URL("http://bot.whatismyipaddress.com");

            BufferedReader sc
                    = new BufferedReader(new InputStreamReader(url_name.openStream()));

            // reads system IPAddress 
            systemipaddress = sc.readLine().trim();
        } catch (Exception e) {
            systemipaddress = "Cannot Execute Properly";
        }
        return systemipaddress;

    }

    public static String RemoveSpecialCharactersExceptColon(String Original) {
        Pattern MyRegex = Pattern.compile("[a-zA-Z0-9s:]");
        Matcher match = MyRegex.matcher(Original);
        String Result = "";
        while (match.find()) {
            String NextCharacter = match.group();
            Result += NextCharacter;
        }
        return Result;
    }

    public static String RemoveBackwardSlashandQuotes(String Original) {
        Pattern MyRegex = Pattern.compile("[a-zA-Z0-9s:/+.\\s-_]");
        Matcher match = MyRegex.matcher(Original);
        String Result = "";
        while (match.find()) {
            String NextCharacter = match.group();
            Result += NextCharacter;
        }
        return Result;
    }
}
