package org.example.Zhanibek;

import org.example.Zhanibek.configuration.InfoDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class ChangeStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long id = Long.valueOf(request.getParameter("noteId"));
        String status = request.getParameter("status");

        Connection connection = InfoDB.getConnection();

        String userId = null;

        Cookie ck[] = request.getCookies();

        if (ck != null) {
            int i = 0;
            while (!ck[i].getName().equals("userId")) {
                i++;
            }

            userId = ck[i].getValue();
        }

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("UPDATE Notes SET status=? WHERE  id=? and user_id=?");

            preparedStatement.setBoolean(1, Boolean.parseBoolean(status));
            preparedStatement.setLong(2, id);
            preparedStatement.setLong(3, Long.parseLong(userId));

            preparedStatement.executeUpdate();


            String message;

            message = "The note's status has been changed";


            request.setAttribute("message", message);
            request.getRequestDispatcher("status.jsp").include(request, response);

        } catch (
                SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
