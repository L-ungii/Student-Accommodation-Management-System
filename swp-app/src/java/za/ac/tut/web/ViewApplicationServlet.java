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
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Residence;

public class ViewApplicationServlet extends HttpServlet {
    @EJB ApplicationFacadeLocal afl;
    @EJB ResidenceFacadeLocal rfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Administrator admin = (Administrator)session.getAttribute("admin");
        Residence res = rfl.findWithAdmin(admin);
        
        List<Application> appList = afl.findWithResName(res);
        
        request.setAttribute("appList", appList);
        
        RequestDispatcher disp = request.getRequestDispatcher("viewApplication_Outcome.jsp");
        disp.forward(request, response);
    }

}
