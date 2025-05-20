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
import java.util.List;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Residence;

/**
 *
 * @author sambo
 */
public class RoleServlet extends HttpServlet {
    @EJB
    private ResidenceFacadeLocal rfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String role = request.getParameter("role");
        
        String url;
        if(role.endsWith("S")){
            url = "studentLogin.jsp";
        }else {
            List<Residence> res = rfl.findAll();
            
            request.setAttribute("res", res);
            
            url = "adminLogin.jsp";
        }
            
        
        RequestDispatcher disp = request.getRequestDispatcher(url);
        disp.forward(request, response);
    }
}
