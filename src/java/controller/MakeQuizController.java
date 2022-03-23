package controller;

import dao.QuestionDAO;
import dao.impl.QuestionDAOImpl;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * This class contains answer method that gets parameter user, question, answer, 
 * trueAnswer from the HTTP request; calls <code>QuestionDAO</code>, to insert 
 * question into question table and answer to answer table; Servlet will directly
 * respond to "errorPage.jsp" when any error occurs
 * <p>
 * Bugs: None
 */
public class MakeQuizController extends HttpServlet {
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request provides important information about answer client request
     * to answer servlet. It is answer<code>javax.servlet.http.HttpServletRequest</code> 
     * object
     * @param response response respond to an HTTP Request to the browser. 
     * It is answer <code>javax.servlet.http.HttpServletResponse</code> object
     * @throws ServletException if answer servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Method is used to set value for body attribute then forward to the layout.jsp
     *
     * @param request stores attributes: noPermiss to send to JSP. It is answer 
     * <code>javax.servlet.http.HttpServletRequest</code> object
     * @param response response respond to an HTTP Request to the browser. It is 
     * answer <code>javax.servlet.http.HttpServletResponse</code> object
     * @throws ServletException if answer servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("body", "makeQuiz.jsp");
        request.getRequestDispatcher("layout.jsp").forward(request, response);
    }

    /**
     * Method is used to get parameter question, answer and trueAnswer from the HTTP
     * request; calls <code>QuestionDAO</code> and to insert question into question
     * table and answer to answer table; Servlet will directly respond to 
     * "errorPage.jsp" when any error occurs
     *
     * @param request stores attributes: question, answer, trueAnswer, notice, 
     * choice, body, error to send to JSP. It is answer 
     * <code>javax.servlet.http.HttpServletRequest</code> object
     * @param response response respond to an HTTP Request to the browser. It is 
     * answer <code>javax.servlet.http.HttpServletResponse</code> object
     * @throws ServletException if answer servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String question = request.getParameter("question").trim();
            String[] listAnswerInput = request.getParameterValues("answer");
            String[] listCorrectAnswers = request.getParameterValues("trueAnswer");
            // The number of correct answers in range [1,3]
            if (listCorrectAnswers != null && listCorrectAnswers.length < 4) {
                QuestionDAO questionDAO = new QuestionDAOImpl();
                List<Integer> listPositionOfTrueAnswer = new ArrayList<>();
                for (String string : listCorrectAnswers) {
                    listPositionOfTrueAnswer.add(Integer.parseInt(string));
                }
                questionDAO.addQuestionAndAnswer(question, listAnswerInput, listPositionOfTrueAnswer);
                request.setAttribute("notice", "Insert questtion success");
            } else {
                request.setAttribute("question", question);
                request.setAttribute("answer", listAnswerInput);
                if (listCorrectAnswers == null) {
                    request.setAttribute("notice", "Please choose correct answer.");
                } else {
                    //returns the value corresponding to each checkbox
                    for (String position : listCorrectAnswers) {
                        request.setAttribute("choice" + Integer.parseInt(position), true);
                    }
                    request.setAttribute("notice", "You can only choose from 1 to 3 correct answers");
                }
            }
            request.setAttribute("body", "makeQuiz.jsp");
            request.getRequestDispatcher("layout.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("body", "errorPage.jsp");
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("layout.jsp").forward(request, response);
        }
    }

    /**
     * Returns answer short description of the servlet.
     *
     * @return answer String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
