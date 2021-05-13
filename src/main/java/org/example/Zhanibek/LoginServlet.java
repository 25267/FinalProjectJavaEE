package org.example.Zhanibek;

import org.example.Zhanibek.configuration.InfoDB;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String password = request.getParameter("password");

        Connection connection = InfoDB.getConnection();

        String userName = null;
        String userPassword = null;
        Long userId = null;


        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Users WHERE name=? and password=?");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();


            while (resultSet.next()) {

                userId = resultSet.getLong("id");
                userName = resultSet.getString("name");
                userPassword = resultSet.getString("password");


            }



            if (name.equals(userName) && password.equals(userPassword)) {
                request.setAttribute("name", name);
                Cookie ck = new Cookie("userId", String.valueOf(userId));
                ck.setMaxAge(60 * 60);
                response.addCookie(ck);

                request.getRequestDispatcher("dashboard.jsp").include(request, response);
            } else {
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.include(request, response);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
