package org.example.Zhanibek;

import org.example.Zhanibek.configuration.InfoDB;
import org.example.Zhanibek.exception.WrongDateException;

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
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class AddNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String userId = null;
        String title =  request.getParameter("title");
        String date = request.getParameter("date");
        String status = request.getParameter("status");
        Connection connection = InfoDB.getConnection();

        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

        Cookie ck[] = request.getCookies();

        if(ck != null){
            int  i = 0;
            while (!ck[i].getName().equals("userId")) {
                i++;
            }

            userId = ck[i].getValue();
        }

        try {

                if (!date.matches("\\d{2}/\\d{2}/\\d{4}")) {
                    throw new WrongDateException("wrong date try in format dd/MM/yyyy");
                }

            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Notes(title, date, status, user_id)  VALUES(?,?, ?, ?)");

            preparedStatement.setString(1, title);
            preparedStatement.setString(2,date);
            preparedStatement.setBoolean(3, Boolean.parseBoolean(status));
            preparedStatement.setLong(4, Long.parseLong(userId));

            preparedStatement.executeUpdate();

            String message;

            message = "The note has been  added";




            request.setAttribute("message", message);
            request.getRequestDispatcher("addNote.jsp").include(request,response);


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
