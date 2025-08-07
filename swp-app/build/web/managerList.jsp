<%@page import="za.ac.tut.enetities.Residence"%>
<%@page import="za.ac.tut.enetities.Administrator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="za.ac.tut.enetities.Notification"%>
<%@page import="za.ac.tut.enetities.Student"%>
<%@page import="jakarta.persistence.EntityManager"%>
<%@page import="jakarta.persistence.EntityManagerFactory"%>
<%@page import="jakarta.persistence.Persistence"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Contact List</title>
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
            background-image: url('pic.jpg'); /* Ensure 'pic.jpg' is in your webapp's root or adjust the path */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            filter: blur(5px);
            -webkit-filter: blur(5px);
            z-index: -1;
        }

        .theme-container {
            max-width: 650px;
            width: 95%;
            padding: 2.5rem;
            background-color: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border-radius: 1.5rem;
            box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.15);
            text-align: center;
            border: 1px solid rgba(255, 255, 255, 0.4);
            z-index: 1;
            max-height: 90vh;
            overflow-y: auto;
        }

        .heading {
            font-size: 2.5rem;
            font-weight: 700;
            color: #4f46e5;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.05);
        }

        .description {
            font-size: 1.05rem;
            color: #6b7280;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .contact-list {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
            margin-top: 1.5rem;
        }

        .contact-card {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            box-shadow: 0 4px 8px -2px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.05);
            padding: 1.2rem;
            text-align: left;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .contact-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 16px -4px rgba(0, 0, 0, 0.18);
        }

        .manager-name-link {
            font-size: 1.2rem;
            font-weight: 700;
            color: #4f46e5;
            text-decoration: none;
            transition: color 0.2s ease;
            display: block;
            margin-bottom: 0.4rem;
        }

        .manager-name-link:hover {
            color: #6366f1;
            text-decoration: underline;
        }

        .latest-message {
            color: #6b7280;
            font-size: 0.9rem;
            margin-top: 0.4rem;
            font-style: italic;
            line-height: 1.3;
        }

        .no-managers-message {
            color: #6b7280;
            font-size: 1.1rem;
            margin-top: 2rem;
            text-align: center;
        }

        @media (max-width: 768px) {
            .theme-container {
                padding: 1.5rem;
                width: 90%;
            }
            .heading {
                font-size: 2rem;
            }
            .description {
                font-size: 0.95rem;
            }
            .manager-name-link {
                font-size: 1.05rem;
            }
            .latest-message {
                font-size: 0.8rem;
            }
            .contact-card {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="theme-container">
        <h1 class="heading">Contact Managers</h1>
        <p class="description">Select a manager to view conversation history and send messages.</p>

        <%
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("StudentManagentEJBPU");
            EntityManager em = emf.createEntityManager();

            List<Notification> messages = em.createQuery(
                "SELECT m FROM Notification m ORDER BY m.creationDate DESC", Notification.class)
                .getResultList();

            Map<Long, Notification> latestMessagesMap = new HashMap<>();
            for (Notification msg : messages) {
                // Safely get admin ID from Notification
                Long adminId = (msg.getAdmin_id() != null) ? msg.getAdmin_id().getId() : null; 
                if (adminId != null && !latestMessagesMap.containsKey(adminId)) {
                    latestMessagesMap.put(adminId, msg);
                }
            }
            
            List<Residence> res = (List<Residence>)request.getAttribute("res");

            if (res == null || res.isEmpty()) {
        %>
                <p class="no-managers-message">No Managers found.</p>
        <%
            } else {
                for (Residence r : res) {
                    Administrator admin = r.getAdmin(); // Get the Administrator object from Residence
                    Long adminId = null;
                    String adminName = "N/A"; // Default value if admin is null
                    Notification latestMsg = null;

                    if (admin != null) { // Check if Administrator object is not null
                        adminId = admin.getId();
                        adminName = admin.getName(); // Assuming Administrator has a getName() method
                        latestMsg = latestMessagesMap.get(adminId);
                    }
        %>
                <div class="contact-list">
                    <div class="contact-card">
                        <%-- The link now safely uses adminId, which could be null --%>
                        <a href="chatStudent.jsp?adminNum=<%= (adminId != null) ? adminId : "" %>" class="manager-name-link">
                            <%= r.getResName() %>
                        </a>
                        <div class="latest-message">
                            <%
                                if (latestMsg != null) {
                                    out.print(latestMsg.getMessage());
                                } else {
                                    out.print("<i>No messages yet.</i>");
                                }
                            %>
                        </div>
                    </div>
                </div>
        <%
                }
            }
            em.close();
            emf.close();
        %>
    </div>
</body>
</html>
