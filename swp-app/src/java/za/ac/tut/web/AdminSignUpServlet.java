package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.AdministratorFacadeLocal;
import za.ac.tut.enetities.Administrator;

public class AdminSignUpServlet extends HttpServlet {
    @EJB
        private AdministratorFacadeLocal afl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Integer adminNum = Integer.parseInt(request.getParameter("adminNum"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Administrator admin = new Administrator(adminNum, name, surname, email, password);
        afl.create(admin);
        
        session.setAttribute("admin", admin);
        
        RequestDispatcher disp = request.getRequestDispatcher("registerRes.jsp");
        disp.forward(request, response);
    }

}
