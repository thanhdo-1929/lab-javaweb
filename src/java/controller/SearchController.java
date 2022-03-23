/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import entity.TimeTable;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hùng
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        String from = request.getParameter("from");
        String to = request.getParameter("to");
        List<TimeTable> listTimeTable = dao.getListTimetable(from, to);
        
        for (TimeTable timeTable : listTimeTable) {
            try {
                String dateTime = timeTable.getDate();
                Date date = sdf.parse(dateTime);
                calendar.setTime(date);
                String dayOfWeek = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.US).toUpperCase();
                timeTable.setDate(dayOfWeek + " " + dateTime);
            } catch (ParseException ex) {
                Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        if (listTimeTable.size() > 0) {
            request.setAttribute("check", 1);
        } else {
            request.setAttribute("check", 0);
        }

        request.setAttribute("from", from);
        request.setAttribute("to", to);
        request.setAttribute("list", listTimeTable);
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }
}
