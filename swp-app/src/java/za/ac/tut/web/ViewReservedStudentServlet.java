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
import za.ac.tut.ejb.bl.ReservationFacadeLocal;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Reservation;
import za.ac.tut.enetities.Residence;

public class ViewReservedStudentServlet extends HttpServlet {
    @EJB ReservationFacadeLocal rfl;
    @EJB ResidenceFacadeLocal rrfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Administrator admin = (Administrator)session.getAttribute("admin");
        Residence res = rrfl.findWithAdmin(admin);
        List<Reservation> applications = rfl.findByResidenceName(res);
        request.setAttribute("registerd", applications);

        RequestDispatcher disp = request.getRequestDispatcher("studentsPerResidence.jsp");
        disp.forward(request, response);

    }
    
}
