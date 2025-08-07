package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.enetities.Student;

public class LoginServlet extends HttpServlet {
    @EJB
        private StudentFacadeLocal sfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        
        Integer studNum = Integer.valueOf(request.getParameter("studNum"));
        String password = request.getParameter("password");
        
        Student stud = sfl.find(studNum);
        if(stud != null){
            if(stud.getPassword().equals(password)){
            session.setAttribute("stud", stud);
            
            RequestDispatcher disp = request.getRequestDispatcher("studentMenu.jsp");
            disp.forward(request, response);
            }
            else{
            request.setAttribute("incorrectPassword", "Authentication failed please enter the correct password");
            RequestDispatcher disp = request.getRequestDispatcher("studentLogin.jsp");
            disp.forward(request, response);
            
        }
        }else{
            request.setAttribute("incorrectId", "Authentication failed please enter the correct student number");
            RequestDispatcher disp = request.getRequestDispatcher("studentLogin.jsp");
            disp.forward(request, response);
            
        }
       
    }

}
