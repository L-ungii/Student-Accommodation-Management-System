package za.ac.tut.web;

import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.enetities.Application;

public class CancelRegitrationServlet extends HttpServlet {
    @EJB 
        private ApplicationFacadeLocal afl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long appId = Long.valueOf(request.getParameter("appId"));
        Application app = afl.find(appId);
        
        if (app != null) {
            Date regDate = app.getStartDate();
           LocalDate registrationDate = regDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate(); 
            LocalDate today = LocalDate.now();

            long daysPassed = ChronoUnit.DAYS.between(registrationDate, today);

            if (daysPassed <= 3) {
                afl.remove(app);
                request.setAttribute("message", "Registration successfully cancelled.");
            } else {
                request.setAttribute("message", "Cancellation failed. You can only cancel within 3 days.");
            }
        } else {
            request.setAttribute("message", "No registration found.");
        }

        request.getRequestDispatcher("cancelRegistrationOutcome.jsp").forward(request, response);

    }

}
