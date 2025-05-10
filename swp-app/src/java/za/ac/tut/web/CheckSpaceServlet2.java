package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Residence;

public class CheckSpaceServlet2 extends HttpServlet {
    @EJB
    private ResidenceFacadeLocal rfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String resName = request.getParameter("resName");
        
        Residence res = rfl.findWithName(resName);
        Integer capacity = res.getCapacity();
        
        request.setAttribute("resName", resName);
        request.setAttribute("capacity",capacity);
        
        RequestDispatcher disp = request.getRequestDispatcher("checkSpace2.jsp");
        disp.forward(request, response);
    }

}
