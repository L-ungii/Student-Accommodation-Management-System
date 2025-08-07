package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.enetities.Student;

public class UpdateServlet extends HttpServlet {

    @EJB
    private StudentFacadeLocal sfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String studNumParam = request.getParameter("studNum");
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("password2");

        Integer studNum = null;
        RequestDispatcher disp = null;

        try {
            studNum = Integer.valueOf(studNumParam);
        } catch (NumberFormatException e) {
            request.setAttribute("incorrectId", "Invalid student number format. Please enter a valid number.");
            disp = request.getRequestDispatcher("forgotPassword.jsp");
            disp.forward(request, response);
            return;
        }

        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("passwordMismatchError", "Passwords do not match. Please re-enter.");
            disp = request.getRequestDispatcher("forgotPassword.jsp");
            disp.forward(request, response);
            return;
        }

        Student stud = sfl.find(studNum);

        if (stud != null) {
            stud.setPassword(newPassword);
            
            sfl.edit(stud);

            response.sendRedirect("studentLogin.jsp?status=passwordUpdated");
        } else {
            request.setAttribute("incorrectId", "Student number not found. Please check your student number.");
            disp = request.getRequestDispatcher("forgotPassword.jsp");
            disp.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("forgotPassword.jsp");
    }
}
