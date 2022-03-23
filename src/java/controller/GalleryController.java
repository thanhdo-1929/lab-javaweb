/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.GalleryDAO;
import dal.PictureDAO;
import entity.Gallery;
import entity.Picture;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class GalleryController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GalleryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GalleryController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idGallery = Integer.parseInt(request.getParameter("id"));
            PictureDAO pictureDAO = new PictureDAO();
            int pageCount = pictureDAO.countPicture(idGallery);
            pageCount = (pageCount % 8 == 0) ? pageCount / 8 : pageCount / 8 + 1;
            //list get size display page index
            ArrayList<Integer> listCount = new ArrayList<>();
            for (int i = 1; i <= pageCount; i++) {
                listCount.add(i);
            }
            String pageIndex_raw = request.getParameter("index");
            if (pageIndex_raw == null) {
                pageIndex_raw = "1";
            }
            int pageIndex = Integer.parseInt(pageIndex_raw);
            request.setAttribute("page", pageIndex);
            List<Picture> listPicture = pictureDAO.getListPicture(idGallery, pageIndex, 8);
            //get list 3 gallery in menu header
            GalleryDAO galleryDAO = new GalleryDAO();
            List<Gallery> listTop3 = galleryDAO.getListTop3Menu();
            Gallery galleryId = galleryDAO.getGalleryById(idGallery);
            request.setAttribute("gallery", galleryId);
            request.setAttribute("listTop3", listTop3);
            request.setAttribute("listPicture", listPicture);
             request.setAttribute("pageIndex", pageIndex);
             request.setAttribute("listCount", listCount);
              request.setAttribute("linkActive", idGallery);
            request.getRequestDispatcher("gallery.jsp").forward(request, response);
        } catch (Exception ex) {
            request.setAttribute("error", ex.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
            Logger.getLogger(GalleryController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
