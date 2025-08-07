/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Student;

/**
 *
 * @author sambo
 */
public class AdminReport extends HttpServlet {
    @EJB AdministratorFacadeLocal afl;
    @EJB ApplicationFacadeLocal appfl;
    @EJB ResidenceFacadeLocal rfl;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Residence> resses = rfl.findAll();
                Integer resNumber = resses.size();
                
                Integer appTotal = appfl.findAll().size();
                
                List<Student> approved = appfl.findApproved();
                Integer approve = approved.size();
                
                session.setAttribute("resses", resses);
                session.setAttribute("resNumber", resNumber);
                session.setAttribute("appTotal", appTotal);
                session.setAttribute("approve", approve);
                
                RequestDispatcher disp = request.getRequestDispatcher("adminStats.jsp");
                disp.forward(request, response);
    }

}
