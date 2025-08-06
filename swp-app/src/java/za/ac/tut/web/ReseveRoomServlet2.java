package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import za.ac.tut.ejb.bl.ReservationFacadeLocal;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.enetities.Reservation;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

public class ReseveRoomServlet2 extends HttpServlet {
    @EJB
        private ReservationFacadeLocal rfl;
    @EJB
        private StudentFacadeLocal sfl;
    @EJB 
        private ResidenceFacadeLocal resfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer studNum = Integer.parseInt(request.getParameter("studNum"));
        String roomType = request.getParameter("roomType");
        String resName = request.getParameter("resName");
        Integer year = Integer.parseInt(request.getParameter("reservation_year"));
        
        Student stud = sfl.find(studNum);
        Residence res = resfl.findWithName(resName);
        
        List<Residence> resList = new ArrayList<>();
        resList.add(res);
        
        List<Student> studList = new ArrayList<>();
        studList.add(stud);
        
        Reservation reserve = new Reservation(roomType, year, resList, studList);
        rfl.create(reserve);
        
        RequestDispatcher disp = request.getRequestDispatcher("reserveOutcome.jsp");
        disp.forward(request, response);
    }

}
