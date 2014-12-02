/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dbConnection;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import coreservlets.*;

/**
 *
 * @author Akram
 */
public class DBConnect {

    final static String serverName = "localhost";
    final static String databaseName = "tmsasus";
    
    static String driver;
    static String url;
    
    static Connection con;
    
    public static Connection LoadConnection() {
        String username = "root"; // Username/password required
        String password = ""; // for MSSQL SERVER.
        DriverUtilities.loadDrivers();
        driver = DriverUtilities.getDriver(DriverUtilities.MYSQL);
        url = DriverUtilities.makeURL(serverName, databaseName, DriverUtilities.MYSQL);

        con = null;
        try {
            Class.forName(driver);

            con = DriverManager.getConnection(url, username, password);
// PreparedStatement updateCity = con.prepareStatement(     
//         "DELETE FROM penyelia WHERE nostaff=? OR nostaff=?");
 /*
             updateCity.setString(1, "M002");
             updateCity.executeUpdate();
             updateCity.setString(1, "M003");
             updateCity.executeUpdate();
             */
// updateCity.setString(1, "S008");
// updateCity.setString(2, "S009");
// updateCity.executeUpdate();
// updateCity.close();
// 	con.close();
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        return con;
    }

}
