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

public class UpdateResApplication extends HttpServlet {
    @EJB AdministratorFacadeLocal afl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long id = Long.valueOf(request.getParameter("applicantId"));
        String status = request.getParameter("status");
        Administrator admin = afl.find(id);
        admin.setStatus(status);
        admin.getBusniess_lic();
        admin.getEmail();
        admin.getId_copy();
        admin.getLic_copy();
        admin.getName();
        admin.getSurname();
        admin.getUsername();
        admin.getPassword();
        afl.edit(admin);
        
        List<Administrator> adminList = afl.findAll();
       
       request.setAttribute("admin", adminList);

        request.getRequestDispatcher("resApplication_outcome.jsp").forward(request, response);
    }

}
