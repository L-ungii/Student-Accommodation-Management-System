<%@page import="za.ac.tut.enetities.Residence"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reserve Room Page</title>
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

            .form-group {
                margin-bottom: 1.5rem;
                text-align: left;
            }

            .form-label {
                display: block;
                font-weight: 600;
                color: #4a5568;
                margin-bottom: 0.75rem;
            }

            .form-input, .form-select {
                width: 100%;
                padding: 0.75rem 1rem;
                border: 1px solid #d1d5db;
                border-radius: 0.5rem;
                background-color: #ffffff;
                font-size: 1rem;
                color: #374151;
                transition: border-color 0.2s ease, box-shadow 0.2s ease;
            }

            .form-select {
                appearance: none;
                background-image: url('pic.jpg');
                background-repeat: no-repeat;
                background-position: right 0.75rem center;
                background-size: 1.5em;
            }

            .form-input:focus, .form-select:focus {
                border-color: #6366f1;
                outline: none;
                box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.25);
            }

            .submit-btn {
                display: block;
                width: 100%;
                padding: 1rem 2rem;
                background-color: #4f46e5;
                color: white;
                font-size: 1.125rem;
                font-weight: 600;
                border: none;
                border-radius: 0.75rem;
                cursor: pointer;
                transition: background-color 0.2s ease, transform 0.1s ease;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                margin-top: 2rem;
            }

            .submit-btn:hover {
                background-color: #4338ca;
                transform: translateY(-2px);
            }

            .submit-btn:active {
                transform: translateY(0);
            }

            .logout-link {
                display: inline-block;
                color: #ef4444;
                font-weight: 600;
                text-decoration: none;
                transition: color 0.2s ease;
                margin-top: 1.5rem;
            }

            .logout-link:hover {
                color: #dc2626;
            }

            .llm-output {
                background-color: #f9fafb;
                border: 1px solid #e5e7eb;
                border-radius: 0.75rem;
                padding: 1.5rem;
                margin-top: 2rem;
                text-align: left;
                color: #374151;
                line-height: 1.6;
                box-shadow: inset 0 1px 3px 0 rgba(0, 0, 0, 0.05);
            }

            .llm-output h3 {
                font-weight: 700;
                color: #4f46e5;
                margin-bottom: 1rem;
                font-size: 1.25rem;
            }

            .loading-indicator {
                text-align: center;
                color: #6b7280;
                font-style: italic;
                margin-top: 1rem;
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
                .form-group {
                    text-align: left;
                }
                .form-label {
                    text-align: left;
                }
                .llm-output {
                    padding: 1rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="heading">Reserve Room</h1>
            
            <%
                List<Residence> resList = (List<Residence>) request.getAttribute("resList");
            %>

            <form action="ReseveRoomServlet2.do" method="POST">
                <div class="form-group">
                    <label for="roomType" class="form-label">Room type:</label>
                    <select id="roomType" name="roomType" class="form-select" required>
                        <option value="">-- Choose Option --</option>
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        <option value="disable">Special Conditions(disable)</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="resName" class="form-label">Residence Name:</label>
                    <select id="resName" name="resName" class="form-select" required>
                        <option value="">-- Choose Option --</option>
                        <%
                            if (resList != null) {
                                for (int i = 0; i < resList.size(); i++) {
                        %>
                            <option value="<%=resList.get(i).getResName()%>"><%=resList.get(i).getResName()%></option>
                        <%
                                }
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="reservation_year" class="form-label">Reservation Year:</label>
                    <input type="text" id="reservation_year" name="reservation_year" class="form-input" placeholder="e.g., 2025" required>
                </div>

                <button type="submit" class="submit-btn">Reserve Room</button>
            </form>

            <p>
                <a href="LogoutServlet.do" class="logout-link">Logout</a>
            </p>
        </div>
    </body>
</html>
