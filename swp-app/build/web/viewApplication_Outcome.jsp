<%@page import="za.ac.tut.enetities.Reservation"%>
<%@page import="java.util.Base64"%>
<%@page import="za.ac.tut.enetities.Application"%>
<%@page import="za.ac.tut.enetities.Student"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Application Page</title>
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

            .application-card {
                background-color: #ffffff;
                border: 1px solid #e5e7eb;
                border-radius: 0.75rem;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                padding: 1.5rem;
                margin-bottom: 1.5rem;
                text-align: left;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }

            .application-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 6px 12px -3px rgba(0, 0, 0, 0.15);
            }


            .application-card table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 0.5rem;
            }

            .application-card table tr td {
                padding: 0.5rem 0;
                border-bottom: 1px solid #f3f4f6;
            }

            .application-card table tr:last-child td {
                border-bottom: none;
            }

            .application-card table tr td:first-child {
                color: #374151;
                font-weight: 600;
                min-width: 150px;
                padding-right: 10px;
            }

            .application-card table tr td:not(:first-child) {
                color: #4b5563;
            }


            .no-applications-message {
                color: #6b7280;
                font-size: 1.125rem;
                margin-top: 2rem;
                text-align: center;
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

            .status-select {
                padding: 0.5rem;
                border: 1px solid #d1d5db;
                border-radius: 0.375rem;
                margin-left: 10px;
                margin-right: 10px;
                min-width: 120px;
            }

            .download-link {
                color: #4f46e5;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.2s ease;
                margin-right: 15px;
            }

            .download-link:hover {
                color: #6366f1;
                text-decoration: underline;
            }

            .email-link {
                color: #10b981;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.2s ease;
            }

            .email-link:hover {
                color: #34d399;
                text-decoration: underline;
            }

            .nav-links-container {
                margin-top: 2rem;
                text-align: center;
            }

            .nav-links-container ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .nav-links-container li {
                margin-bottom: 0.5rem;
            }

            .nav-link {
                display: inline-block;
                color: #4f46e5;
                font-weight: 600;
                text-decoration: none;
                transition: color 0.2s ease;
            }

            .nav-link:hover {
                color: #6366f1;
                text-decoration: underline;
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

                .application-card {
                    padding: 1rem;
                }

                .application-card table tr td:first-child {
                    min-width: unset;
                    padding-right: 5px;
                }

                .status-select {
                    margin-left: 0;
                    margin-right: 0;
                    width: 100%;
                    margin-top: 5px;
                }

                .update-button {
                    width: 100%;
                }
            }
        </style>
    </head>
</head>
<body>
    <div class="theme-container">
        <h1 class="heading">View Applications</h1>
        <p class="description">Below is a list of applications. You can view details and update the status.</p>

        <form method="GET" action="FilterApplicationServlet.do" class="mb-6 flex gap-4 justify-center items-end flex-wrap">
    <div>
        <label for="level" class="text-lg font-semibold text-gray-700">Filter by Study Level:</label>
        <select name="level" id="level" class="status-select">
            <option value="0">All</option>
            <option value="1">1st Year</option>
            <option value="2">2nd Year</option>
            <option value="3">3rd Year</option>
            <option value="4">4th Year</option>
            <option value="5">5th Year</option>
            <option value="6">6th Year</option>
        </select>
    </div>
    <div>
        <label for="roomType" class="text-lg font-semibold text-gray-700">Filter by Room Type:</label>
        <select name="roomType" id="roomType" class="status-select">
            <option value="all">All</option>
            <option value="single">Single</option>
            <option value="double">Double</option>
            <option value="disable">Disable</option>
            <!-- Add any other room types if needed -->
        </select>
    </div>
            <div>
        <label class="block text-sm mb-2" for="reservationStatus">Reservation Status</label>
        <select name="reservationStatus" id="reservationStatus" class="status-select">
            <option value="all">All</option>
            <option value="reserved">Reserved</option>
            <option value="not_reserved">Not Reserved</option>
        </select>
    </div>
    <button type="submit" class="update-button">Filter</button>
        </form>
        <%
            List<Application> appList = (List<Application>) request.getAttribute("appList");
            List<Reservation> reserved = (List<Reservation>) request.getAttribute("reserved");

            if (appList == null || appList.isEmpty()) {
        %>
            <p class="no-applications-message">No applications found.</p>
        <%
            } else {
                for (int i = 0; i < appList.size(); i++) {
                    Application currentApp = appList.get(i);

                    byte[] funding = currentApp.getProofOfFunding();
                    String base64FundingImage = "";
                    if (funding != null && funding.length > 0) {
                        base64FundingImage = Base64.getEncoder().encodeToString(funding);
                    }

                    byte[] reg = currentApp.getProofOfReg();
                    String base64RegImage = "";
                    if (reg != null && reg.length > 0) {
                        base64RegImage = Base64.getEncoder().encodeToString(reg);
                    }

                    // --------- Reservation Check Start ----------
                    boolean isReserved = false;
                    if (reserved != null) {
                        for (Reservation r : reserved) {
                            List<Student> resStudents = r.getStudent();
                            if (resStudents != null) {
                                for (Student s : resStudents) {
                                    if (s.getStudNum().equals(currentApp.getStudent().getStudNum())) {
                                        isReserved = true;
                                        break;
                                    }
                                }
                            }
                            if (isReserved) break;
                        }
                    }
                    // --------- Reservation Check End ----------
        %>

        <form action="ApplicationServlet.do" method="POST" class="application-card">
            <table>
                <tr>
                    <td>Student Number:</td>
                    <td><%=currentApp.getStudent().getStudNum()%></td>
                    <td><input type="hidden" name="studNum" value="<%=currentApp.getStudent().getStudNum()%>" /></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><%=currentApp.getStudent().getName()%></td>
                </tr>
                <tr>
                    <td>Surname:</td>
                    <td><%=currentApp.getStudent().getSurname()%></td>
                </tr>
                <tr>
                    <td>Study Level:</td>
                    <td><%=currentApp.getStudent().getStudyLevel()%></td>
                </tr>
                <tr>
                    <td>Reservation Status:</td>
                    <td><%= isReserved ? "✅ Reserved" : "❌ Not Reserved" %></td>
                </tr>
                <tr>
                    <td>Room type:</td>
                    <td><%=currentApp.getRoomType()%></td>
                </tr>
                <tr>
                    <td>Proof of Funding:</td>
                    <td>
                        <% if (!base64FundingImage.isEmpty()) { %>
                        <a href="data:application/pdf;base64,<%=base64FundingImage%>" download="applicant_funding.pdf" class="download-link">Download Proof (PDF)</a>
                        <% } else { %>
                        N/A
                        <% } %>
                        <a href="mailto:<%=currentApp.getStudent().getEmail()%>" class="email-link">Email Student</a>
                    </td>
                </tr>
                <tr>
                    <td>Proof of Registration:</td>
                    <td>
                        <% if (!base64RegImage.isEmpty()) { %>
                        <a href="data:application/pdf;base64,<%=base64RegImage%>" download="applicant_registration.pdf" class="download-link">Download Proof (PDF)</a>
                        <% } else { %>
                        N/A
                        <% } %>
                        <a href="mailto:<%=currentApp.getStudent().getEmail()%>" class="email-link">Email Student</a>
                    </td>
                </tr>
                <tr>
                    <td>Start Date:</td>
                    <td><%=currentApp.getStartDate()%></td>
                </tr>
                <tr>
                    <td>End Date:</td>
                    <td><%=currentApp.getEndDate()%></td>
                </tr>
                <tr>
                    <td>Application Status:</td>
                    <td>
                        <select name="status" class="status-select">
                            <option value="pending" <%= "pending".equals(currentApp.getStatus()) ? "selected" : ""%>>Pending</option>
                            <option value="approved" <%= "approved".equals(currentApp.getStatus()) ? "selected" : ""%>>Approved</option>
                            <option value="decline" <%= "decline".equals(currentApp.getStatus()) ? "selected" : ""%>>Decline</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="UPDATE STATUS" class="update-button"></td>
                </tr>
            </table>
        </form>

        <%
                } // end for loop
            } // end else
        %>
    </div>
</body>
</html>
