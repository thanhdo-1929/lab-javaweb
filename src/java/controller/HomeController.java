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
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            response.setContentType("text/html;charset=UTF-8");
            DAO dao = new DAO();
            Calendar calendar = Calendar.getInstance();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

            String from = sdf.format(getFromDate(Calendar.getInstance()).getTime());
            String to = sdf.format(getToDate(Calendar.getInstance()).getTime());

            List<TimeTable> listTimeTable = dao.getListTimetable(from, to);

            for (TimeTable timeTable : listTimeTable) {
                String date = timeTable.getDate();
                Date inputDate = sdf.parse(date);
                calendar.setTime(inputDate);
                String dayOfWeek = calendar.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, Locale.US);
                timeTable.setDate(dayOfWeek + " " + date);
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

        } catch (ParseException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected Calendar getFromDate(Calendar from) {
        while (from.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            from.add(Calendar.DATE, -1);
        }
        return from;
    }

    protected Calendar getToDate(Calendar to) {
        while (to.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {
            to.add(Calendar.DATE, 1);
        }
        return to;
    }

}
