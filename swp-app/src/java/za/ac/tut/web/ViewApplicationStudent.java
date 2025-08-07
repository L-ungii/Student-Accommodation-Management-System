package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Student;

public class ViewApplicationStudent extends HttpServlet {
    @EJB ApplicationFacadeLocal afl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Student stud = (Student)session.getAttribute("stud");
        
        List<Application> app = afl.finAllStud(stud);
        request.setAttribute("app", app);
        
        RequestDispatcher disp = request.getRequestDispatcher("viewApplicationStud_outcome.jsp");
        disp.forward(request, response);
    }

}
