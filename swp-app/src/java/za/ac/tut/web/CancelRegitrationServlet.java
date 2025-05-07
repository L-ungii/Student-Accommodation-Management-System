package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.enetities.Application;

public class CancelRegitrationServlet extends HttpServlet {
    @EJB 
        private ApplicationFacadeLocal afl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer studNum = Integer.parseInt(request.getParameter("studNum"));
        
        Application app = afl.findWithStud(studNum);
        
        afl.remove(app);
        
        RequestDispatcher disp = request.getRequestDispatcher("cancelRegistrationOutcome.jsp");
        disp.forward(request, response);
    }

}
