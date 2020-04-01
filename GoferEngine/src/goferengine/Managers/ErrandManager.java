/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goferengine.Managers;

import goferengine.Tables.Tables;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
/**
 *
 * @author user
 */
public class ErrandManager {
    public ErrandManager(){
        
    }
    
    public static boolean checkUserInputs(int Poster, String Category, String Pickup, String Delivery, String Description, String Amount, Date Deadline_Date) throws ClassNotFoundException, SQLException {
        return true;
    }
    public static boolean checkForExistingErrand(int Poster, String Category, String Pickup, String Description, String Amount, Date Deadline_Date) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        boolean result = false;
        int errId = DBManager.GetInt(Tables.Errands.ID, Tables.Errands.Table, "where " + Tables.Errands.Errand_Poster + " = " + Poster + " and " + Tables.Errands.Category + " = " + Category + " and " + Tables.Errands.PickUpLocation + " = " + Pickup + " and " + Tables.Errands.Description + " = " + Description + " and " + Tables.Errands.Amount + " = " + Amount + " and " + Tables.Errands.Deadline + " = " + Deadline_Date);
        if (errId != 0) {
            result = true;
        }
        return result;
    }
    public static String CreateErrand(int Poster, String Category, String Pickup, String Delivery, String Description, String Amount, Date Deadline_Date, String D_Time, String Insurance, String Status) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
        HashMap<String, Object> tableData = new HashMap<>();
        String result = "failed";
        tableData.put(Tables.Errands.Errand_Poster, Poster);
        tableData.put(Tables.Errands.Category , Category);
        tableData.put(Tables.Errands.PickUpLocation , Pickup);
        tableData.put(Tables.Errands.Delivery , Delivery);
        tableData.put(Tables.Errands.Description, Description);
        tableData.put(Tables.Errands.Amount , Amount);
        tableData.put(Tables.Errands.Deadline , Deadline_Date);
        tableData.put(Tables.Errands.Time , D_Time);
        tableData.put(Tables.Errands.Insurance , Insurance);
        tableData.put(Tables.Errands.Status , Status);
        int errID = DBManager.insertTableDataReturnID(Tables.Errands.Table, tableData, "");
        if(errID>0){result = "success";}
        
        return result;
    }
    
}
