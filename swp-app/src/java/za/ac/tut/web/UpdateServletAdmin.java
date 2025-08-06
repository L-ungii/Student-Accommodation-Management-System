package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.AdministratorFacadeLocal;
import za.ac.tut.enetities.Administrator;

public class UpdateServletAdmin extends HttpServlet {
    @EJB
        private AdministratorFacadeLocal afl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer studNum = Integer.parseInt(request.getParameter("adminNum"));
        String password = request.getParameter("password");
        
        Administrator admin = afl.find(studNum);
        admin.setPassword(password);
        admin.getEmail();
        admin.getName();
        admin.getSurname();
        
        afl.edit(admin);
        
        RequestDispatcher disp = request.getRequestDispatcher("adminLogin.jsp");
        disp.forward(request, response);
    }
}
