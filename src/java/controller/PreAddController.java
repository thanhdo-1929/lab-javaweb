/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import entity.Room;
import entity.Slot;
import entity.Class;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Hùng
 */
@WebServlet(name = "PreAddController", urlPatterns = {"/PreAddController"})
public class PreAddController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        List<Class> getAllClass = dao.getAllClass();
        List<Room> getAllRoom = dao.getAllRoom();
        List<Slot> getAllSlot = dao.getAllSlot();

        session.setAttribute("class", getAllClass);
        session.setAttribute("room", getAllRoom);
        session.setAttribute("slot", getAllSlot);
        request.getRequestDispatcher("addTimeTable.jsp").forward(request, response);
    }
}
