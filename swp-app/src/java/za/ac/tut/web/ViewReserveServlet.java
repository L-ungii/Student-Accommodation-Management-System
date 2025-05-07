package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import za.ac.tut.ejb.bl.ReservationFacadeLocal;
import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.enetities.Reservation;
import za.ac.tut.enetities.Student;

public class ViewReserveServlet extends HttpServlet {
    @EJB
        private ReservationFacadeLocal rfl;
    @EJB
        private StudentFacadeLocal sfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer studNum = Integer.parseInt(request.getParameter("studNum"));
        
        Student stud = sfl.find(studNum);
        
        List<Reservation> resveredList = rfl.findStudents(stud);
        
        request.setAttribute("resveredList", resveredList);
        
        RequestDispatcher disp = request.getRequestDispatcher("viewReserveOutcome.jsp");
        disp.forward(request, response);
    }

}
