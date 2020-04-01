/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package goferengine.Connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class JDBCConnector {
    private static final String JDBC_LOADER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/goferDB";
    private static final String LOGIN = "root";
    private static final String PASSWORD = "";

    private Connection connection;
    
    static String resources = "C:\\Users\\georg\\Dropbox\\NDF\\TeamManager\\web\\resources\\";
    static String profilePicture = "C:\\Users\\georg\\Dropbox\\NDF\\WealthMarketWrite\\web\\ProfilePicture\\";

    public JDBCConnector() throws ClassNotFoundException, SQLException {
        Class.forName(JDBC_LOADER);
        connection = DriverManager.getConnection(URL, LOGIN, PASSWORD);
    }

    public Connection getConnection() throws SQLException {
        return connection;
    }

    public static String getResourceAddress() {
        return resources;
    }

    public static String getProfilePictureAddress() {
        return profilePicture;
    }
}
