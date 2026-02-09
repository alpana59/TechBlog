package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null || con.isClosed()) {
                // Load driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to database
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/techblogdb",
                    "root",
                    "Richa@71519"
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
