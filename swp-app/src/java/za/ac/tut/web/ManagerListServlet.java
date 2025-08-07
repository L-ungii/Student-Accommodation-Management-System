package za.ac.tut.web;

import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Residence;

public class ManagerListServlet extends HttpServlet {
    @EJB ResidenceFacadeLocal rfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Residence> res = rfl.findAll();
        List<Administrator> adminList = new ArrayList<>();
        
        for (Residence r : res) {
            adminList.add(r.getAdmin());
        }
        
        request.setAttribute("res", res);
        request.setAttribute("adminList", adminList);
        
        request.getRequestDispatcher("managerList.jsp").forward(request, response);
    }
}
