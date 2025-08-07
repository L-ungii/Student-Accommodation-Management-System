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
import za.ac.tut.ejb.bl.AdministratorFacadeLocal;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

public class AdminLoginServlet extends HttpServlet {
    @EJB AdministratorFacadeLocal afl;
    @EJB ApplicationFacadeLocal appfl;
    @EJB ResidenceFacadeLocal rfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Administrator admin = afl.findUsername(username);

        if (admin != null) {
            if (password.equals(admin.getPassword())) {
                
                List<Residence> resses = rfl.findAll();
                Integer resNumber = resses.size();
                
                Integer appTotal = appfl.findAll().size();
                
                List<Student> approved = appfl.findApproved();
                Integer approve = approved.size();
                
                session.setAttribute("resses", resses);
                session.setAttribute("resNumber", resNumber);
                session.setAttribute("appTotal", appTotal);
                session.setAttribute("approve", approve);
                
                RequestDispatcher disp = request.getRequestDispatcher("menu.jsp");
                disp.forward(request, response);
            } else {

                request.setAttribute("incorrectPassword", "Authentication failed please enter the correct password");
                RequestDispatcher disp = request.getRequestDispatcher("adminLogin.jsp");
                disp.forward(request, response);
            }
        } else {

            request.setAttribute("incorrectId", "Authentication failed please enter the correct admin number");
            RequestDispatcher disp = request.getRequestDispatcher("adminLogin.jsp");
            disp.forward(request, response);

        }

    }

}
