/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hùng
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        Calendar calender = Calendar.getInstance();

        String date = request.getParameter("date");
        String slotID = request.getParameter("slot");
        String roomID = request.getParameter("room");
        String teacher = request.getParameter("teacher");
        String classID = request.getParameter("class");
        String mess = "";
        int check = 0;
        int teacherID = dao.checkExistTeacher(teacher);
        if (teacherID == -1) {
            mess += "The teacher doesn't exist!<br>";
            check++;
        }
        if (!dao.checkRoom(date, roomID, slotID)) {
            mess += "One Room cannot arrange for 2 class/course in the same time!<br>";
            check++;
        }
        if (!dao.checkTeacherTeach(date, teacherID, slotID)) {
            mess += "One teacher cannot teach 2 class/course in the same time!<br>";
            check++;
        }
        if (check == 0) {
            dao.insertTimeTable(date, Integer.parseInt(slotID), Integer.parseInt(classID), teacherID, Integer.parseInt(roomID));
            request.setAttribute("mess", "Add a successful schedule!");
            request.setAttribute("check", 0);
        } else {
            request.setAttribute("mess", mess);
            request.setAttribute("check", 1);
        }
        request.getRequestDispatcher("addTimeTable.jsp").forward(request, response);
    }
}
