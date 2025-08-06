package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Residence;

public class CheckSpaceAdmin extends HttpServlet {
    @EJB
    private ResidenceFacadeLocal rfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Administrator admin = (Administrator)session.getAttribute("admin");
        Residence res = rfl.findWithAdmin(admin);
        
        String resName = res.getResName();
        Integer capacity = res.getCapacity();
        
        request.setAttribute("resName", resName);
        request.setAttribute("capacity", capacity);
        
        RequestDispatcher disp = request.getRequestDispatcher("checkSpaceAmin.jsp");
        disp.forward(request, response);
    }

}
