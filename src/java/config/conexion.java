/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author DANIELS SYSTEMS
 */
public class conexion {
     Connection con;

    public conexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/galeria?serverTimezone=UTC", "root", "1025");

        } catch (Exception e) {
            System.err.println("Error: " + e);
        }
    }

    public Connection getConnection(){  
    return con;
    }
}
