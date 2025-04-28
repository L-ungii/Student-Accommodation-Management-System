/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.tut.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.ac.tut.entities.Student;
import za.ac.tut.entities.StudentFacadeLocal;

/**
 *
 * @author khens
 */
public class StudentSignUPServlet extends HttpServlet {
 @EJB
 private StudentFacadeLocal sfl;
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String studentNumber = request.getParameter("studNum");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        Student stud = createStudent(surname, name, surname, email, password);
        sfl.create(stud);
         RequestDispatcher disp = request.getRequestDispatcher("student_login.jsp");
        disp.forward(request, response);
        
    }
   private Student createStudent(String studNo,String name,String surname,String email,String password){
    Student stud = new Student();
    stud.setStudId(studNo);
     stud.setFname(name);
     stud.setLname(surname);
     stud.setEmail(email);
     stud.setP_password(password);
     return stud;
   }
}
