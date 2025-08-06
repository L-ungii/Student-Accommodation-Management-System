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
        Integer studNum = Integer.parseInt(request.getParameter("studNum"));
        String password = request.getParameter("password");
        
        Student stud = sfl.find(studNum);
        stud.setPassword(password);
        stud.getEmail();
        stud.getName();
        stud.getSurname();
        
        sfl.edit(stud);
        
        RequestDispatcher disp = request.getRequestDispatcher("studentLogin.jsp");
        disp.forward(request, response);
    }

}
