package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Student;

public class ApplicationServlet extends HttpServlet {
    @EJB ApplicationFacadeLocal afl;
    @EJB StudentFacadeLocal sfl;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String status = request.getParameter("status");
        Integer studNum = Integer.parseInt(request.getParameter("studNum"));
        
        Student stud = sfl.find(studNum);
        Application app = afl.findWithStud(stud);
        
        switch (status) {
            case "pending" -> {
                app.setStatus("pending");
                app.getEndDate();
                app.getId();
                app.getProofOfFunding();
                app.getProofOfReg();
                app.getResidence();
                app.getStartDate();
                app.getRoomType();
                app.getStudent();
            }
            case "approved" -> {
                app.setStatus("approved");
                app.getEndDate();
                app.getId();
                app.getProofOfFunding();
                app.getProofOfReg();
                app.getResidence();
                app.getStartDate();
                app.getRoomType();
                app.getStudent();
            }
            default -> {
                app.setStatus("declined");
                app.getEndDate();
                app.getId();
                app.getProofOfFunding();
                app.getProofOfReg();
                app.getResidence();
                app.getStartDate();
                app.getRoomType();
                app.getStudent();
            }
        }
        
        afl.edit(app);
        RequestDispatcher disp = request.getRequestDispatcher("adminViewApplication_Outcome.jsp");
        disp.forward(request, response);
    }

}
