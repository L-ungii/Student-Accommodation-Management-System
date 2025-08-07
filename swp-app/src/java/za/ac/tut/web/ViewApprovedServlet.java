package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.enetities.Student;

public class ViewApprovedServlet extends HttpServlet {
    @EJB ApplicationFacadeLocal afl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Student> students = afl.findApproved();
        request.setAttribute("students", students);
        
        RequestDispatcher disp = request.getRequestDispatcher("viewApproved.jsp");
        disp.forward(request, response);
    }
 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
