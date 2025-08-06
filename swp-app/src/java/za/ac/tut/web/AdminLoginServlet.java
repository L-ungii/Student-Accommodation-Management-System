package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.AdministratorFacadeLocal;
import za.ac.tut.enetities.Administrator;

public class AdminLoginServlet extends HttpServlet {

    @EJB
    private AdministratorFacadeLocal afl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(true);

        Integer adminNum = Integer.valueOf(request.getParameter("adminNum"));
        String password = request.getParameter("password");

        Administrator admin = afl.find(adminNum);

        if (admin != null) {
            if (password.equals(admin.getPassword())) {

                session.setAttribute("admin", admin);
                RequestDispatcher disp = request.getRequestDispatcher("adminMenu.html");
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
