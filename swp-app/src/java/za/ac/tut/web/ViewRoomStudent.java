package za.ac.tut.web;

import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import za.ac.tut.ejb.bl.RoomFacadeLocal;
import za.ac.tut.enetities.Room;
import za.ac.tut.enetities.Student;

public class ViewRoomStudent extends HttpServlet {

    @EJB
    RoomFacadeLocal roomFL;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Student student = (Student) session.getAttribute("stud");
        Room room = roomFL.findByStudent(student); // Assuming this method exists

        if (room == null) {
            request.setAttribute("noRoomMessage", "No room has been assigned to you yet.");
        } else {
            request.setAttribute("room", room);
        }
        request.setAttribute("student", student);

        request.getRequestDispatcher("view_room_student.jsp").forward(request, response);
    }
}
