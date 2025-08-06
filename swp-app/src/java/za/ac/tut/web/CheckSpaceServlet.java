package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Residence;

public class CheckSpaceServlet extends HttpServlet {
    @EJB
    private ResidenceFacadeLocal rfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Residence> resList = rfl.findAll();
        request.setAttribute("resList", resList);
        
        RequestDispatcher disp = request.getRequestDispatcher("checkSpace.jsp");
        disp.forward(request, response);
    }

}
