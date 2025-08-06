package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Student;

public class CancelRegitrationAdmin extends HttpServlet {
    @EJB 
        private ApplicationFacadeLocal afl;
    @EJB
        private StudentFacadeLocal sfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer studNum = Integer.parseInt(request.getParameter("studNum"));
        
        Student stud = sfl.find(studNum);
        Application app = afl.findWithStud(stud);
        
        afl.remove(app);
        
        RequestDispatcher disp = request.getRequestDispatcher("cancelRegistrationAdmin.jsp");
        disp.forward(request, response);
    }

}
