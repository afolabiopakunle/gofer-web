/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goferengine.Managers;

import goferengine.Tables.Tables;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashMap;
import goferengine.Managers.EmailManager;

/**
 *
 * @author DELL
 */
public class UserManager {
    
    public static boolean checkUserInputs(String email, String phone, String password, String fnam, String lnam) throws ClassNotFoundException, SQLException {
        return true;
    }

    public static boolean checkSocialData(String email, String fnam, String lnam) throws ClassNotFoundException, SQLException {
        return true;
    }

    public static boolean checkEmailAddressOrPhoneNumberExist(String email, String phone) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        boolean result = false;
        int usid = DBManager.GetInt(Tables.UserTable.ID, Tables.UserTable.Table, "where " + Tables.UserTable.Email + " = '" + email + "'");
        if (usid == 0) {
            usid = DBManager.GetInt(Tables.UserTable.ID, Tables.UserTable.Table, "where " + Tables.UserTable.PhoneNumber + " = '" + phone + "'");
            if (usid != 0) {
                result = true;
            }
        } else {
            result = true;
        }
        return result;
    }

    public static boolean checkEmailAddressExist(String email) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        boolean result = false;
        int userId = DBManager.GetInt(Tables.UserTable.ID, Tables.UserTable.Table, "where " + Tables.UserTable.Email + " = '" + email + "'");
        if (userId != 0) {
            result = true;
        }
        return result;
    }

    public static int getUserIdfromEmailAddress(String email) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        int userId = DBManager.GetInt(Tables.UserTable.ID, Tables.UserTable.Table, "where " + Tables.UserTable.Email + " = '" + email + "'");
        return userId;
    }

    public static int getUserID(String EmailAddress, String PhoneNumber) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        int usid = DBManager.GetInt(Tables.UserTable.ID, Tables.UserTable.Table, "where " + Tables.UserTable.Email + " = '" + EmailAddress + "' and " + Tables.UserTable.PhoneNumber + " = '" + PhoneNumber + "'");
        return usid;
    }

    public static int checkPasswordEmailMatch(String Password, String Email_PhoneNum) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        int result = 0;
        String memPassword = "";
        String email = Email_PhoneNum;
        memPassword = DBManager.GetString(Tables.UserTable.Password, Tables.UserTable.Table, "where " + Tables.UserTable.Email + " = '" + Email_PhoneNum + "'");
        if (memPassword.equals("none")) {
            memPassword = DBManager.GetString(Tables.UserTable.Password, Tables.UserTable.Table, "where " + Tables.UserTable.PhoneNumber + " = '" + Email_PhoneNum + "'");
            email = DBManager.GetString(Tables.UserTable.Email, Tables.UserTable.Table, "where " + Tables.UserTable.PhoneNumber + " = '" + Email_PhoneNum + "'");
        }
        if (memPassword.equals(Password)) {
            result = DBManager.GetInt(Tables.UserTable.ID, Tables.UserTable.Table, "where " + Tables.UserTable.Email + " = '" + email + "'");
        }
        return result;
    }

    public static String getUserName(int UserID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        int group = getUserGroupID(UserID);
        String Name = "", FirstName, LastName;
        switch (group) {
            case 1:
                LastName = DBManager.GetString(Tables.MemberTable.LastName, Tables.MemberTable.Table, "where " + Tables.MemberTable.UserID + " = " + UserID);
                FirstName = DBManager.GetString(Tables.MemberTable.FirstName, Tables.MemberTable.Table, "where " + Tables.MemberTable.UserID + " = " + UserID);
                Name = FirstName + " " + LastName;
                break;
//            case 2:
//                Name = DBManager.GetString(Tables.Business.Name, Tables.Business.Table, "where " + Tables.Business.UserID + " = " + UserID);
//                break;
//            case 3:
//                Name = DBManager.GetString(Tables.Agent.AgentName, Tables.Agent.Table, "where " + Tables.Agent.UserID + " = " + UserID);
//                break;
//            case 4:
//                FirstName = DBManager.GetString(Tables.Admin.FirstName, Tables.Admin.Table, "where " + Tables.Admin.UserID + " = " + UserID);
//                LastName = DBManager.GetString(Tables.Admin.LastName, Tables.Admin.Table, "where " + Tables.Admin.UserID + " = " + UserID);
//                Name = FirstName + " " + LastName;
//                break;
        }
        return Name;
    }

    public static String getUserFirstName(int UserID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        int group = getUserGroupID(UserID);
        String Name = "";
        switch (group) {
            case 1:
                Name = DBManager.GetString(Tables.MemberTable.FirstName, Tables.MemberTable.Table, "where " + Tables.MemberTable.UserID + " = " + UserID);
                break;
//            case 2:
//                Name = DBManager.GetString(Tables.Business.Name, Tables.Business.Table, "where " + Tables.Business.UserID + " = " + UserID);
//                break;
//            case 3:
//                Name = DBManager.GetString(Tables.Agent.AgentName, Tables.Agent.Table, "where " + Tables.Agent.UserID + " = " + UserID);
//                break;
//            case 4:
//                FirstName = DBManager.GetString(Tables.Admin.FirstName, Tables.Admin.Table, "where " + Tables.Admin.UserID + " = " + UserID);
//                LastName = DBManager.GetString(Tables.Admin.LastName, Tables.Admin.Table, "where " + Tables.Admin.UserID + " = " + UserID);
//                Name = FirstName + " " + LastName;
//                break;
        }
        return Name;
    }

    public static String CreateUser(String FirstName, String LastName, String Email, String Password, String Phone, String Status) throws ClassNotFoundException, SQLException, UnsupportedEncodingException, IOException, InterruptedException {
        HashMap<String, Object> tableData = new HashMap<>();
        String result = "failed";
        tableData.put(Tables.UserTable.Email, Email);
        tableData.put(Tables.UserTable.PhoneNumber, Phone);
        tableData.put(Tables.UserTable.Password, Password);
        tableData.put(Tables.UserTable.Status, Status);
        int userID = DBManager.insertTableDataReturnID(Tables.UserTable.Table, tableData, "");
        if (userID > 0) {
            DBManager.UpdateCurrentDate(Tables.UserTable.Table, Tables.UserTable.JoinedDate, "where " + Tables.UserTable.ID + " = " + userID);
            CreateMember(FirstName, LastName, userID);
            CreateUserProfile(userID);
//            ActivateUser(userID);
            int ID = DBManager.GetInt(Tables.UserTable.Table, Tables.UserTable.ID, "where " + Tables.UserTable.ID + " = " + userID);
            EmailManager.sendAccountConfirmationEMail(ID, Email, FirstName);
            result = "sucess";
        }

        return result;
    }

    public static String CreateUserWithSocialData(String FirstName, String LastName, String Email) throws ClassNotFoundException, SQLException, UnsupportedEncodingException, IOException, InterruptedException {
        HashMap<String, Object> tableData = new HashMap<>();
        String result = "failed";
        tableData.put(Tables.UserTable.Email, Email);
        int userID = DBManager.insertTableDataReturnID(Tables.UserTable.Table, tableData, "");
        if (userID > 0) {
            DBManager.UpdateCurrentDate(Tables.UserTable.Table, Tables.UserTable.JoinedDate, "where " + Tables.UserTable.ID + " = " + userID);
            result = CreateMember(FirstName, LastName, userID);
            CreateUserProfile(userID);
            ActivateUser(userID);
            result = CreateSession(userID);
        }

        return result;
    }

    public static String CreateMember(String FirstName, String LastName, int userID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        HashMap<String, Object> tableData = new HashMap<>();
        String result = "failed";
        tableData.put(Tables.MemberTable.FirstName, FirstName);
        tableData.put(Tables.MemberTable.LastName, LastName);
        tableData.put(Tables.MemberTable.UserID, userID);
        result = DBManager.insertTableData(Tables.MemberTable.Table, tableData, "");
        return result;
    }

    public static String CreateUserProfile(int userID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        HashMap<String, Object> tableData = new HashMap<>();
        String lang = "1";
        String result = "failed";
        tableData.put(Tables.UserProfile.UserID, userID);
        tableData.put(Tables.UserProfile.Languages, lang);
        result = DBManager.insertTableData(Tables.UserProfile.Table, tableData, "");
        return result;
    }

    public static String ActivateUser(int userID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        DBManager.UpdateCurrentDate(Tables.UserTable.Table, Tables.UserTable.LastUpdated, "where " + Tables.UserTable.ID + " = " + userID);
        DBManager.UpdateCurrentDate(Tables.UserTable.Table, Tables.UserTable.LastSeen, "where " + Tables.UserTable.ID + " = " + userID);
        DBManager.UpdateStringData(Tables.UserTable.Table, Tables.UserTable.Status, "active", "where " + Tables.UserTable.ID + " = " + userID);
        String result = DBManager.UpdateCurrentDate(Tables.UserTable.Table, Tables.UserTable.ActivatedDate, "where " + Tables.UserTable.ID + " = " + userID);
        return result;
    }

    public static String CreateSession(int userID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        DBManager.DeleteObject(Tables.Sessions.Table, "where " + Tables.Sessions.UserID + " = " + userID);
        HashMap<String, Object> tableData = new HashMap<>();
        String result = "failed";
        String sessID = UtilityManager.GenerateAlphaNumericCode(15);
        tableData.put(Tables.Sessions.UserID, userID);
        tableData.put(Tables.Sessions.SessionID, sessID);
        int ID = DBManager.insertTableDataReturnID(Tables.Sessions.Table, tableData, "");
        if (ID > 0) {
            result = sessID;
        }
        DBManager.UpdateCurrentDate(Tables.Sessions.Table, Tables.Sessions.Date, "where " + Tables.Sessions.ID + " = " + ID);
        DBManager.UpdateCurrentTime(Tables.Sessions.Table, Tables.Sessions.Time, "where " + Tables.Sessions.ID + " = " + ID);
        return result;
    }

    public static String generateRegistrationActivationCode() {
        String result = "";
        return result;
    }

    public static int getUserGroupID(int UserID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        int result = DBManager.GetInt(Tables.UserTable.UserGroupID, Tables.UserTable.Table, "where " + Tables.UserTable.ID + " =" + UserID);
        return result;
    }

    public static String getUserStatus(int UserID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        String result = DBManager.GetString(Tables.UserTable.Status, Tables.UserTable.Table, "where " + Tables.UserTable.ID + " =" + UserID);
        return result;
    }

    public static String getUserPhone(int UserID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        String result = DBManager.GetString(Tables.UserTable.PhoneNumber, Tables.UserTable.Table, "where " + Tables.UserTable.ID + " =" + UserID);
        return result;
    }

    public static String getUserEmail(int UserID) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        String result = DBManager.GetString(Tables.UserTable.Email, Tables.UserTable.Table, "where " + Tables.UserTable.ID + " =" + UserID);
        return result;
    }

    public static int getUserIDfromSession(String session) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        int userid = DBManager.GetInt(Tables.Sessions.UserID, Tables.Sessions.Table, "where " + Tables.Sessions.SessionID + " = '" + session + "'");
        return userid;
    }

    public static int getUserIDfromEmail(String email) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        int userid = DBManager.GetInt(Tables.UserTable.ID, Tables.UserTable.Table, "where " + Tables.UserTable.Email + " = '" + email + "'");
        return userid;
    }
    
    public static String changeUserPassword(int userid, String password) throws ClassNotFoundException, SQLException, UnsupportedEncodingException{
    String result = DBManager.UpdateStringData(Tables.UserTable.Table, Tables.UserTable.Password, password, "where " + Tables.UserTable.ID + " = " + userid);
    return result;
    }
    
    public static HashMap<String, String> getUserDetails(int userid) throws ClassNotFoundException, SQLException, UnsupportedEncodingException {
        HashMap<String, String> details = DBManager.GetTableData(Tables.UserTable.Table, "where " + Tables.UserTable.ID + " = " + userid);
        String name = getUserName(userid);
        details.put("user_name", name);
        return details; 
    }
    
}
