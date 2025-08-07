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
import za.ac.tut.enetities.Reservation;
import za.ac.tut.enetities.Student;

public class ViewReserveServlet extends HttpServlet {
    @EJB
        private ReservationFacadeLocal rfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        Student stud = (Student)session.getAttribute("stud");
        
        List<Reservation> resveredList = rfl.findStudents(stud);
        
        request.setAttribute("resveredList", resveredList);
        request.setAttribute("message", "Here is the list of reservations you made:");
        
        RequestDispatcher disp = request.getRequestDispatcher("viewReserveOutcome.jsp");
        disp.forward(request, response);
    }

}
