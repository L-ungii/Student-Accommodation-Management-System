<%@page import="za.ac.tut.enetities.Reservation"%>
<%@page import="za.ac.tut.enetities.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List of Reserved Students</title>
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
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.05);
            }

            .description {
                font-size: 1.125rem;
                color: #6b7280;
                margin-bottom: 2rem;
                line-height: 1.75rem;
            }

            .student-card {
                background-color: #ffffff;
                border: 1px solid #e5e7eb;
                border-radius: 0.75rem;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                text-align: left;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }

            .student-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 12px -3px rgba(0, 0, 0, 0.15);
            }

            .student-detail {
                margin-bottom: 0.5rem;
            }

            .student-detail strong {
                color: #374151;
                font-weight: 600;
            }

            .student-detail span {
                color: #4b5563;
            }

            .no-students-message {
                color: #6b7280;
                font-size: 1.125rem;
                margin-top: 2rem;
                text-align: center;
            }

            .logout-link {
                display: inline-block;
                color: #ef4444;
                font-weight: 600;
                text-decoration: none;
                transition: color 0.2s ease;
            }

            .logout-link:hover {
                color: #dc2626;
            }

            @media (max-width: 768px) {
                .theme-container {
                    padding: 2rem;
                    width: 90%;
                }
                .heading {
                    font-size: 2rem;
                }
                .description {
                    font-size: 1rem;
                }
                .student-card {
                    padding: 1rem;
                }
                .logout-link {
                    font-size: 0.9rem;
                }
            }
        </style>
    </head>
    <body class="flex flex-col items-center justify-center min-h-screen">
        <div class="theme-container">
            <h1 class="heading">List of Reserved Students</h1>
            <p class="description">
                Below is a list of students who have reserved a room.
            </p>
            <%
                List<Reservation> registered = (List<Reservation>) request.getAttribute("registerd");

                if (registered != null && !registered.isEmpty()) {
                    for (Reservation app : registered) {
                        List<Student> studentList = app.getStudent();
                        for (Student elem : studentList) {
            %>
            <div class="student-card">
                <div class="student-detail"><strong>Student Number:</strong> <span><%=elem.getStudNum()%></span></div>
                <div class="student-detail"><strong>Name:</strong> <span><%= elem.getName()%> <%= elem.getSurname()%></span></div>
                <div class="student-detail"><strong>Year:</strong> <span><%=app.getReservation_year()%></span></div>
                <div class="student-detail"><strong>Room Type:</strong> <span><%=app.getRoomType()%></span></div>
            </div>
            <%
                        }
                    }
                } else {
            %>
            <p class="no-students-message">No students have reserved this residence yet.</p>
            <%}%>
            
            <ul class="space-y-2 mt-8">
                <li>
                    <a href="adminMenu.html" class="text-indigo-600 hover:text-indigo-800 hover:underline font-medium transition duration-150 ease-in-out">
                        Main menu
                    </a>
                </li>
                <li>
                    <a href="LogoutServlet.do" class="logout-link">Logout</a>
                </li>
            </ul>
        </div>
    </body>
</html>
