package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;
import za.ac.tut.ejb.bl.NotificationFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Notification;
import za.ac.tut.enetities.Student;

public class ChatServlet extends HttpServlet {

    @EJB
    private NotificationFacadeLocal nfl; // Injected EJB for Notification persistence

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManagerFactory emf = null;
        EntityManager em = null;
        try {
            // Retrieve parameters from the request
            String studentNumStr = request.getParameter("studNum");
            String adminNumStr = request.getParameter("adminNum");
            String messageContent = request.getParameter("message");
            String senderName = request.getParameter("senderName"); // Retrieve senderName from JSP form

            // Basic validation for required parameters
            if (studentNumStr == null || studentNumStr.isEmpty() ||
                adminNumStr == null || adminNumStr.isEmpty() ||
                messageContent == null || messageContent.trim().isEmpty() ||
                senderName == null || senderName.trim().isEmpty()) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required message parameters.");
                return;
            }

            // Parse IDs from String to Long
            Integer studentId = Integer.valueOf(studentNumStr);
            Long adminId = Long.valueOf(adminNumStr);

            // Initialize EntityManager and EntityManagerFactory
            emf = Persistence.createEntityManagerFactory("StudentManagentEJBPU");
            em = emf.createEntityManager();

            // Find Student and Administrator entities by their IDs
            Student student = em.find(Student.class, studentId);
            Administrator admin = em.find(Administrator.class, adminId);

            // Check if entities were found
            if (student == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student with ID " + studentId + " not found.");
                return;
            }
            if (admin == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Administrator with ID " + adminId + " not found.");
                return;
            }

            // Create a new Notification object
            Notification msg = new Notification();
            msg.setMessage(messageContent);
            msg.setStud_id(student);        // Set the Student entity
            msg.setAdmin_id(admin);         // Set the Administrator entity
            msg.setSenderName(senderName);
            msg.setCreationDate(new Date()); // Set the current date/time for the message

            // Persist the message using the injected EJB facade
            nfl.create(msg);

            // Redirect back to the chat page for the specific manager
            // The chatStudent.jsp is designed to be accessed by a student to chat with a manager.
            // So, redirect back to chatStudent.jsp with the adminNum.
            response.sendRedirect("chatStudent.jsp?adminNum=" + adminId);

        } catch (NumberFormatException e) {
            // Handle cases where studNum or adminNum are not valid numbers
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format. Please ensure student and admin IDs are numbers.");
        } catch (Exception e) {
            // Catch any other unexpected exceptions during processing
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while sending the message: " + e.getMessage());
        } finally {
            // Ensure EntityManager and EntityManagerFactory resources are closed
            if (em != null && em.isOpen()) {
                em.close();
            }
            if (emf != null && emf.isOpen()) {
                emf.close();
            }
        }
    }
}
