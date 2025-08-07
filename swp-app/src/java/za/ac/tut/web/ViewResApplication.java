package za.ac.tut.web;

import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import za.ac.tut.ejb.bl.AdministratorFacadeLocal;
import za.ac.tut.enetities.Administrator;

public class ViewResApplication extends HttpServlet {
    @EJB AdministratorFacadeLocal afl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Administrator> admin = afl.findAll();
       
       request.setAttribute("admin", admin);

        request.getRequestDispatcher("resApplication_outcome.jsp").forward(request, response);
    }

}
