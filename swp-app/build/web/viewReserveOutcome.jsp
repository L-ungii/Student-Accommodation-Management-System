<%@page import="java.util.List"%>
<%@page import="za.ac.tut.enetities.Reservation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Reserve Outcome Page</title>
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
            <h1 class="heading">View Reserve Outcome</h1>

            <%
                List<Reservation> reservations = (List<Reservation>) request.getAttribute("resveredList");
                String message = (String)request.getAttribute("message");
            %>

            <% if (reservations == null || reservations.isEmpty()) { %>
                <p class="description">You have no reservations.</p>
            <% } else { %>
                <p class="description"><%=message%></p>
                <%
                    for (Reservation res : reservations) {
                %>
                    <div class="reservation-card">
                        <p><strong>Room Type:</strong> <%= res.getRoomType() %></p>
                        <p><strong>Residence name:</strong> <%= res.getResidence().get(0).getResName()%></p>
                        <p><strong>Location:</strong> <%= res.getResidence().get(0).getLocation()%></p>
                        <p><strong>Year:</strong> <%= res.getReservation_year() %></p>
                    </div>
                <%
                    }
                }
                %>

            <ul class="nav-links">
                <li><a href="studentMenu.html" class="nav-link main-menu-link">Main Menu</a></li>
                <li><a href="LogoutServlet.do" class="nav-link logout-link">Logout</a></li>
            </ul>
        </div>
    </body>
</html>
