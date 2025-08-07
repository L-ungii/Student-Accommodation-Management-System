<%-- 
    Document   : viewApproved
    Created on : 29 May 2025, 22:26:31
    Author     : sambo
--%>

<%@page import="za.ac.tut.enetities.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Approved Students Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f3f4f6;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
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

            .container {
                max-width: 800px;
                width: 90%;
                padding: 3rem;
                background-color: rgba(255, 255, 255, 0.5);
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
                border-radius: 1.5rem;
                box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.15);
                text-align: center;
                border: 1px solid rgba(255, 255, 255, 0.3);
                z-index: 1;
            }

            .heading {
                font-size: 2.5rem;
                font-weight: 700;
                color: #4f46e5;
                margin-bottom: 1.5rem;
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.05);
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
            }

            .description {
                font-size: 1.125rem;
                color: #6b7280;
                margin-bottom: 2rem;
                line-height: 1.75rem;
            }

            .reservation-card {
                background-color: #f9fafb;
                border: 1px solid #e5e7eb;
                border-radius: 0.75rem;
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                text-align: left;
                box-shadow: 0 2px 4px -1px rgba(0, 0, 0, 0.05);
            }

            .reservation-card p {
                margin-bottom: 0.5rem;
                color: #374151;
                font-size: 1rem;
            }

            .reservation-card p strong {
                color: #1f2937;
            }

            .nav-links {
                margin-top: 2.5rem;
                padding: 0;
            }

            .nav-links li {
                list-style: none;
                margin-bottom: 1rem;
            }

            .nav-link {
                font-weight: 600;
                text-decoration: none;
                transition: color 0.2s ease;
            }

            .main-menu-link {
                color: #4f46e5;
            }

            .main-menu-link:hover {
                color: #4338ca;
            }

            .logout-link {
                color: #ef4444;
            }

            .logout-link:hover {
                color: #dc2626;
            }
            
            .update-button {
                background-color: #4f46e5;
                color: white;
                padding: 0.75rem 1.5rem;
                border-radius: 0.5rem;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.2s ease;
                border: none;
                margin-top: 1rem;
            }

            .update-button:hover {
                background-color: #6366f1;
            }

            @media (max-width: 600px) {
                .container {
                    padding: 2rem;
                    margin: 2rem auto;
                }
                .heading {
                    font-size: 2rem;
                    white-space: normal;
                    text-overflow: clip;
                }
                .description {
                    font-size: 1rem;
                }
                .reservation-card {
                    padding: 1rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="heading">Approved Students</h1>

            <%
                List<Student> students = (List<Student>)request.getAttribute("students");
            %>

            <% if (students == null || students.isEmpty()) { %>
                <p class="description">There are no approved students.</p>
            <% } else { %>
                <p class="description">Here is a list of approved students:</p>
                <%
                    for (Student stud : students) {
                %>
                <form action="RoomAllocationServlet.do" method="POST">
                    <div class="reservation-card">
                        <p><strong>Student Number:</strong> <%= stud.getStudNum() %></p>
                        <p><strong>Name:</strong> <%= stud.getName() %></p>
                        <p><strong>Surname:</strong> <%= stud.getSurname() %></p>
                        <p><strong>email:</strong> <%= stud.getEmail() %></p>
                        <p><li><a href="cancelApprovedStud.jsp?studNum=<%=stud.getStudNum()%>" class="nav-link logout-link">Cancel Registration</a></li></p>
                        <input type="hidden" name="studNum" value="<%= stud.getStudNum() %>"/>
                        <input type="submit" class="update-button" value="ALLOCATE ROOM"/>
                    </div>
                    </form>
                <%
                    }
                }
                %>

            <ul class="nav-links">
                <li><a href="adminMenu.html" class="nav-link main-menu-link">Main Menu</a></li>
                <li><a href="LogoutServlet.do" class="nav-link logout-link">Logout</a></li>
            </ul>
        </div>
    </body>
</html>
