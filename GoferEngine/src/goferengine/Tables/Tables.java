/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goferengine.Tables;

/**
 *
 * @author DELL
 */
public class Tables {

    public static class MemberTable {

        public static String Table = "members";
        public static String ID = "id";
        public static String UserID = "user_id";
        public static String FirstName = "first_name";
        public static String LastName = "last_name";
        public static String DOB = "dob";
        public static String Gender = "sex";
        public static String Permissions = "permissions";
        public static String Status = "status";
    }

    public static class Sessions {

        public static String Table = "sessions";
        public static String ID = "id";
        public static String UserID = "user_id";
        public static String SessionID = "session_id";
        public static String Date = "date";
        public static String Time = "time";
    }

    public static class UserTable {

        public static String Table = "users";
        public static String ID = "id";
        public static String Email = "email";
        public static String PhoneNumber = "phone_number";
        public static String Password = "password";
        public static String JoinedDate = "date_joined";
        public static String ActivatedDate = "date_activated";
        public static String Status = "status";
        public static String UserGroupID = "user_group_id";
        public static String LastUpdated = "last_updated";
        public static String LastSeen = "last_seen";
    }

    public static class UserProfile {

        public static String Table = "user_profile";
        public static String ID = "id";
        public static String UserID = "user_id";
        public static String Title = "sp_title";
        public static String Description = "sp_description";
        public static String Languages = "sp_languages";
        public static String Skills = "sp_skills";
        public static String CategoryID = "cat_id";
    }

    
    public static class Errands {

        public static String Table = "errands";
        public static String ID = "id";
        public static String Errand_Poster = "poster_id";
        public static String Category = "category";
        public static String PickUpLocation = "pickup";
        public static String Delivery = "delivery_location";
        public static String Description = "description";
        public static String Amount = "amount";
        public static String Deadline = "d_date";
        public static String Time = "d_time";
        public static String Insurance = "insurance";
        public static String Status = "status";
    }
    
}
