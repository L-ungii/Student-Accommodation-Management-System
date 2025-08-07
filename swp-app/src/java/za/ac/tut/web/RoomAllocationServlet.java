package za.ac.tut.web;

import jakarta.ejb.EJB;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import za.ac.tut.ejb.bl.ApplicationFacadeLocal;
import za.ac.tut.ejb.bl.RoomFacadeLocal;
import za.ac.tut.ejb.bl.StudentFacadeLocal;
import za.ac.tut.enetities.Application;
import za.ac.tut.enetities.Residence;
import za.ac.tut.enetities.Room;
import za.ac.tut.enetities.Student;

public class RoomAllocationServlet extends HttpServlet {

    @EJB
    RoomFacadeLocal roomFL;
    @EJB
    ApplicationFacadeLocal afl;
    @EJB
    StudentFacadeLocal sfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer studNum = Integer.valueOf(request.getParameter("studNum"));
        Student stud = sfl.find(studNum);

        // ✅ Check if student already has a room
        Room existingRoom = roomFL.findByStudent(stud); // ← You must implement this method in RoomFacade

        
        Application app = afl.findWithStud(stud);
        Residence res = app.getResidence();
        
        if (existingRoom != null) {
            request.setAttribute("student", stud);
            request.setAttribute("residence", res); // ✅ Add this line!
            request.setAttribute("message", "Student already has a room assigned: Room " + existingRoom.getRoom_Num());
            request.getRequestDispatcher("roomAllocation_outcome.jsp").forward(request, response);
            return;
        }


        // Get all rooms for the residence
        List<Room> existingRooms = roomFL.findByResidence(res);

        // Find the next available room number
        int nextRoomNum = 1;
        Set<String> takenRoomNums = new HashSet<>();
        for (Room r : existingRooms) {
            takenRoomNums.add(r.getRoom_Num());
        }

        while (takenRoomNums.contains(String.valueOf(nextRoomNum))) {
            nextRoomNum++;
        }

        // Create the room and assign the number
        String assignedRoomNum = String.valueOf(nextRoomNum);
        Room room = new Room("Occupied", app.getRoomType(), assignedRoomNum, stud, res);

        roomFL.create(room);

        request.setAttribute("assignedRoomNum", assignedRoomNum);
        request.setAttribute("student", stud);
        request.setAttribute("residence", res);
        request.setAttribute("message", "Room " + assignedRoomNum + " successfully assigned.");

        request.getRequestDispatcher("roomAllocation_outcome.jsp").forward(request, response);
    }
}
