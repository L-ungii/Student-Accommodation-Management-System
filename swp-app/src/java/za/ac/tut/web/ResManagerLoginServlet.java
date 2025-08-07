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
import za.ac.tut.ejb.bl.AdministratorFacadeLocal;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.ejb.bl.RoomFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Room;
import za.ac.tut.enetities.Student;

public class ResManagerLoginServlet extends HttpServlet {
    @EJB AdministratorFacadeLocal afl;
    @EJB ApplicationFacadeLocal appfl;
    @EJB ResidenceFacadeLocal rfl;
    @EJB RoomFacadeLocal roomFL;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Administrator admin = afl.findUsername(username);

        if (admin != null) {
            if (password.equals(admin.getPassword())) {
                
                Residence res = rfl.findWithAdmin(admin);
                
                Integer capacity = res.getCapacity();
                
                List<Application> app = appfl.findWithResName(res);
                Integer applications = app.size();
                
                List<Student> approved = appfl.findApproved();
                Integer approve = approved.size();
                
                session.setAttribute("capacity", capacity);
                session.setAttribute("applications", applications);
                session.setAttribute("approve", approve);
                
                session.setAttribute("admin", admin);
                RequestDispatcher disp = request.getRequestDispatcher("adminMenu.jsp");
                disp.forward(request, response);
            } else {

                request.setAttribute("incorrectPassword", "Authentication failed please enter the correct password");
                RequestDispatcher disp = request.getRequestDispatcher("resLogin.jsp");
                disp.forward(request, response);
            }
        } else {

            request.setAttribute("incorrectId", "Authentication failed please enter the correct username");
            RequestDispatcher disp = request.getRequestDispatcher("resLogin.jsp");
            disp.forward(request, response);

        }

    }
    

}
