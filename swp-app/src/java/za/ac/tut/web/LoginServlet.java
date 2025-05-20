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
        
        Integer studNum = Integer.parseInt(request.getParameter("studNum"));
        String password = request.getParameter("password");
        
        Student stud = sfl.findStudentLogin(password, studNum);
        if(stud != null){
            session.setAttribute("stud", stud);
            
            RequestDispatcher disp = request.getRequestDispatcher("studentMenu.html");
            disp.forward(request, response);
        }else{
            RequestDispatcher disp = request.getRequestDispatcher("incorrectStudentLogin.jsp");
            disp.forward(request, response);
            
        }
       
    }

}
