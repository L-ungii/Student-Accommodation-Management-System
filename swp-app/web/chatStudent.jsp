<%@page import="jakarta.persistence.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="za.ac.tut.enetities.Administrator"%>
<%@page import="za.ac.tut.enetities.Notification"%>
<%@page import="za.ac.tut.enetities.Student"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Message to Manager</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f3f4f6;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            padding: 1rem;
            box-sizing: border-box;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('pic.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            filter: blur(5px);
            -webkit-filter: blur(5px);
            z-index: -1;
        }

        .theme-container {
            max-width: 700px;
            width: 95%;
            padding: 3rem;
            background-color: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            border-radius: 1.5rem;
            box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.15);
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.3);
            z-index: 1;
            max-height: 90vh;
            overflow-y: auto;
        }

        .heading {
            font-size: 2.5rem;
            font-weight: 700;
            color: #4f46e5;
            margin-bottom: 1.5rem;
        }

        .description {
            font-size: 1.125rem;
            color: #6b7280;
            margin-bottom: 2rem;
        }

        .conversation-history {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            text-align: left;
            max-height: 300px;
            overflow-y: auto;
        }

        .message-item {
            margin-bottom: 10px;
            padding: 8px 12px;
            border-radius: 8px;
            background-color: #f0f4f8;
            border: 1px solid #e0e7ee;
        }

        .message-item .sender-name {
            font-weight: 700;
            color: #374151;
            margin-right: 5px;
        }

        .message-item .message-content {
            color: #4b5563;
        }

        .message-item .message-date {
            font-size: 0.85em;
            color: #888;
            display: block;
            margin-top: 5px;
        }

        .no-messages-message {
            color: #6b7280;
            font-style: italic;
            text-align: center;
        }

        .message-form {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            padding: 1.5rem;
            margin-top: 1.5rem;
            text-align: left;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: #374151;
            margin-bottom: 0.5rem;
        }

        .message-textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #d1d5db;
            border-radius: 0.5rem;
            font-size: 1em;
            resize: vertical;
            min-height: 100px;
            margin-bottom: 1rem;
        }

        .send-button {
            background-color: #4f46e5;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            border: none;
            transition: background-color 0.2s ease;
        }

        .send-button:hover {
            background-color: #6366f1;
        }

        .error-message {
            color: #ef4444;
            font-weight: 600;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
<div class="theme-container">
    <h1 class="heading">Send Message to Manager</h1>
    <p class="description">Communicate with your residence manager here.</p>

    <%
        Student loggedStudent = (Student) session.getAttribute("stud");
        Long adminId = null;
        EntityManagerFactory emf = null;
        EntityManager em = null;
        List<Notification> conversation = new ArrayList<>(); // Initialize to avoid NPE

        if (loggedStudent == null) {
    %>
        <p class="error-message">Error: Please log in as a student to view messages.</p>
    <%
        } else {
            String adminNumParam = request.getParameter("adminNum");
            if (adminNumParam != null && !adminNumParam.isEmpty()) {
                try {
                    adminId = Long.parseLong(adminNumParam);
                } catch (NumberFormatException e) {
                    out.println("<p class='error-message'>Invalid Manager ID provided. " + e.getMessage() + "</p>");
                }
            } else {
                out.println("<p class='error-message'>Manager ID not provided.</p>");
            }

            if (adminId != null) {
                try {
                    emf = Persistence.createEntityManagerFactory("StudentManagentEJBPU");
                    em = emf.createEntityManager();

                    // Find the Administrator entity
                    Administrator admin = em.find(Administrator.class, adminId);

                    if (admin != null) {
                        // Fetch conversation: messages between this student and this admin, regardless of sender
                        conversation = em.createQuery(
                                "SELECT n FROM Notification n WHERE " +
                                "(n.stud_id = :student AND n.admin_id = :admin) OR " +
                                "(n.admin_id = :admin AND n.stud_id = :student) " +
                                "ORDER BY n.id ASC", // Order by creationDate for chronological display
                                Notification.class)
                                .setParameter("student", loggedStudent)
                                .setParameter("admin", admin)
                                .getResultList();
                    } else {
                        out.println("<p class='error-message'>Manager not found for ID: " + adminId + "</p>");
                    }

                } catch (Exception e) {
                    e.printStackTrace(); // Log the exception for debugging
                    out.println("<p class='error-message'>Error loading conversation history: " + e.getMessage() + "</p>");
                } finally {
                    // Ensure EntityManager and EntityManagerFactory resources are closed
                    if (em != null && em.isOpen()) {
                        em.close();
                    }
                    if (emf != null && emf.isOpen()) {
                        emf.close();
                    }
                }
    %>

    <div class="conversation-history">
        <h3 class="heading" style="font-size: 1.5rem; margin-bottom: 1rem; color: #4f46e5;">Conversation History</h3>
        <%
            if (conversation.isEmpty()) {
        %>
            <p class="no-messages-message"><i>No previous messages. Start a conversation!</i></p>
        <%
            } else {
                for (Notification msg : conversation) {
        %>
        <div class="message-item">
            <span class="sender-name">
                <%= msg.getSenderName() != null ? msg.getSenderName() : "Unknown" %>:
            </span>
            <span class="message-content"><%= msg.getMessage() %></span><br/>
            <span class="message-date"><%= msg.getCreationDate() %></span>
        </div>
        <%
                }
            }
        %>
    </div>

    <form method="post" action="ChatServlet.do" class="message-form">
        <input type="hidden" name="studNum" value="<%= loggedStudent.getStudNum() %>" />
        <input type="hidden" name="adminNum" value="<%= adminId %>" />
        <input type="hidden" name="senderName" value="<%= loggedStudent.getName() %>" />
        <label for="message" class="form-label">Your Message:</label>
        <textarea id="message" name="message" class="message-textarea" required></textarea>
        <button type="submit" class="send-button">Send Message</button>
    </form>

    <%
            } // end of if (adminId != null)
        } // end of if (loggedStudent == null)
    %>
</div>
</body>
</html>
