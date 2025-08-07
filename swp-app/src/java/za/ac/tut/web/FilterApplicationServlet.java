package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.ejb.bl.ReservationFacadeLocal;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Reservation;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

public class FilterApplicationServlet extends HttpServlet {

    @EJB
    ApplicationFacadeLocal afl;
    @EJB
    ResidenceFacadeLocal rfl;
    @EJB
    ReservationFacadeLocal reserveFL;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        Administrator admin = (Administrator) session.getAttribute("admin");
        Residence res = rfl.findWithAdmin(admin);

        List<Application> appList = afl.findWithResName(res);

        // Get and parse level filter
        String levelParam = request.getParameter("level");
        int level = (levelParam != null && !levelParam.isEmpty()) ? Integer.parseInt(levelParam) : 0;

        // Get roomType filter
        String roomType = request.getParameter("roomType");

        // Apply level filter
        if (level != 0) {
            appList = appList.stream()
                    .filter(app -> app.getStudent().getStudyLevel() == level)
                    .collect(Collectors.toList());
        }

        // Apply room type filter (ignore if "all" or null)
        if (roomType != null && !roomType.equals("all")) {
            appList = appList.stream()
                    .filter(app -> app.getRoomType() != null && app.getRoomType().equalsIgnoreCase(roomType))
                    .collect(Collectors.toList());
        }

        List<Application> filtered = new ArrayList<>(appList);
        List<Reservation> reserved = reserveFL.findByResidenceName(res);
        String reservedParam = request.getParameter("reserved"); // expected: "yes", "no", or null
        if (reservedParam != null && !reservedParam.equalsIgnoreCase("all")) {
            filtered = filtered.stream()
                    .filter(app -> {
                        boolean isReserved = isStudentReserved(app.getStudent(), reserved );
                        return "reserved".equalsIgnoreCase(reservedParam) ? isReserved : !isReserved;
                    })
                    .collect(Collectors.toList());
        }

        request.setAttribute("reserved", reserved);
        request.setAttribute("appList", appList);
        RequestDispatcher disp = request.getRequestDispatcher("viewApplication_Outcome.jsp");
        disp.forward(request, response);
    }
private boolean isStudentReserved(Student student, List<Reservation> reservations) {
        for (Reservation r : reservations) {
            if (r.getStudent() != null) {
                for (Student s : r.getStudent()) {
                    if (s.getStudNum().equals(student.getStudNum())) {
                        return true;
                    }
                }
            }
        }
        return false;
    }
}
