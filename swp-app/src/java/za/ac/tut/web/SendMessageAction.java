package za.ac.tut.web;

import jakarta.ejb.EJB;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.io.IOException;
import java.util.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import za.ac.tut.ejb.bl.NotificationFacadeLocal;
import za.ac.tut.enetities.Administrator;
import za.ac.tut.enetities.Notification;
import za.ac.tut.enetities.Student;

public class SendMessageAction extends HttpServlet {
    @EJB
    private NotificationFacadeLocal nfl;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManagerFactory emf = null;
        EntityManager em = null;
        try {
            String message = request.getParameter("message");
            String studentNumStr = request.getParameter("studNum");
            String adminNumStr = request.getParameter("adminNum");
            String senderName = request.getParameter("senderName"); // Retrieve senderName from JSP form

            // Basic validation for required parameters
            if (message == null || message.trim().isEmpty() ||
                studentNumStr == null || studentNumStr.isEmpty() ||
                adminNumStr == null || adminNumStr.isEmpty() ||
                senderName == null || senderName.trim().isEmpty()) { // Added senderName to validation
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing required message parameters.");
                return;
            }

            // Parse IDs with correct types
            Integer studentNum = Integer.parseInt(studentNumStr); // Student.studNum is Integer
            Long adminId = Long.valueOf(adminNumStr); // Administrator.id is Long

            // JPA setup to fetch Student and Admin entities
            emf = Persistence.createEntityManagerFactory("StudentManagentEJBPU");
            em = emf.createEntityManager();

            Student student = em.find(Student.class, studentNum);
            Administrator admin = em.find(Administrator.class, adminId); // Use Long for admin ID

            if (student != null && admin != null) {
                Notification notification = new Notification();
                notification.setStud_id(student);
                notification.setAdmin_id(admin);
                notification.setSenderName(senderName); // Now correctly setting senderName
                notification.setMessage(message);
                notification.setCreationDate(new Date());

                nfl.create(notification);

                // Redirect back to the chat page for the specific student
                // The sendMessage.jsp is used by the admin to chat with a student,
                // so we redirect back to that page with the student's ID.
                response.sendRedirect("sendMessage.jsp?studNum=" + studentNum);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student or Administrator not found. Student ID: " + studentNum + ", Admin ID: " + adminId);
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ID format. Please ensure student and admin IDs are numbers.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred: " + e.getMessage());
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
