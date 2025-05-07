package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.AdministratorFacadeLocal;
import za.ac.tut.ejb.bl.ResidenceFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Residence;

public class AdminLoginServlet extends HttpServlet {
    @EJB
        private AdministratorFacadeLocal afl;
    @EJB 
        private ResidenceFacadeLocal rfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer adminNum = Integer.parseInt(request.getParameter("adminNum"));
        String password = request.getParameter("password");
        String resName = request.getParameter("resName");
        
        Administrator admin = afl.find(adminNum);
        Residence res = rfl.findWithAdminnRes(admin, resName);
        
        if(admin != null){
            if(password.equals(admin.getPassword())){
                if(res != null){
                    RequestDispatcher disp = request.getRequestDispatcher("studentMenu.html");
                    disp.forward(request, response);
                }
            }
            
        }else{
            RequestDispatcher disp = request.getRequestDispatcher("incorrectStudentLogin.jsp");
            disp.forward(request, response);
            
        }
    }

}
