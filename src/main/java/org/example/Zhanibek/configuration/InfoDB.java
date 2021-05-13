package org.example.Zhanibek.configuration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class InfoDB {

    private static String URL = "jdbc:postgresql://localhost:5432/notes_db";
    private static String USERNAME = "postgres";
    private static String PASSWORD = "1991";


    public static Connection getConnection(){
        Connection connection = null;

        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }
}
