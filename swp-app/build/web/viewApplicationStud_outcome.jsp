<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<%@page import="za.ac.tut.enetities.Application"%>
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
                max-height: 90vh;
                overflow-y: auto;
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

            .application-details {
                background-color: #f9fafb;
                border: 1px solid #e5e7eb;
                border-radius: 0.75rem;
                padding: 2rem;
                margin-bottom: 1.5rem;
                text-align: left;
                box-shadow: 0 2px 4px -1px rgba(0, 0, 0, 0.05);
            }

            .detail-row {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 0.75rem;
            }

            .detail-label {
                font-weight: 600;
                color: #4a5568;
                width: 180px;
                flex-shrink: 0;
            }

            .detail-value {
                color: #374151;
                flex-grow: 1;
            }

            .document-link {
                color: #4f46e5;
                text-decoration: underline;
                transition: color 0.2s ease;
            }

            .document-link:hover {
                color: #4338ca;
            }

            .nav-links {
                list-style: none;
                padding: 0;
                margin-top: 2.5rem;
            }

            .nav-links li {
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

            @media (max-width: 768px) {
                .container {
                    padding: 2rem;
                    width: 90%;
                }
                .heading {
                    font-size: 2rem;
                }
                .description {
                    font-size: 1rem;
                }
                .application-details {
                    padding: 1.5rem;
                }
                .detail-row {
                    flex-direction: column;
                    align-items: flex-start;
                }
                .detail-label {
                    width: 100%;
                    margin-bottom: 0.25rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1 class="heading">View Application</h1>
            <p class="description">Your application details are displayed below:</p>

            <%
                List<Application> app = (List<Application>) request.getAttribute("app");
            %>

            <% 
                if (app != null) {
                for (Application a : app) {
                        
                    
            %>
                <div class="application-details">
                    <div class="detail-row">
                        <span class="detail-label">Student Number:</span>
                        <span class="detail-value"><%=a.getStudent().getStudNum()%></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Name:</span>
                        <span class="detail-value"><%=a.getStudent().getName()%></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Surname:</span>
                        <span class="detail-value"><%=a.getStudent().getSurname()%></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Room Type:</span>
                        <span class="detail-value"><%=a.getRoomType()%></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Proof of Funding:</span>
                        <span class="detail-value">
                            <%
                                byte[] funding = a.getProofOfFunding();
                                String base64FundingImage = "";
                                if (funding != null && funding.length > 0) {
                                    base64FundingImage = Base64.getEncoder().encodeToString(funding);
                            %>
                                <a href="data:application/pdf;base64,<%=base64FundingImage%>" download="applicant_funding.pdf" class="document-link">Download Proof of Funding (PDF)</a>
                            <% } else { %>
                                <em>No document available</em>
                            <% } %>
                        </span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Proof of Registration:</span>
                        <span class="detail-value">
                            <%
                                byte[] reg = a.getProofOfFunding();
                                String base64RegImage = "";
                                if (reg != null && reg.length > 0) {
                                    base64RegImage = Base64.getEncoder().encodeToString(reg);
                            %>
                                <a href="data:application/pdf;base64,<%=base64RegImage%>" download="applicant_registration.pdf" class="document-link">Download Proof of Registration (PDF)</a>
                            <% } else { %>
                                <em>No document available</em>
                            <% } %>
                        </span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Start Date:</span>
                        <span class="detail-value"><%=a.getStartDate()%></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">End Date:</span>
                        <span class="detail-value"><%=a.getEndDate()%></span>
                    </div>
                    <div class="detail-row">
                        <span class="detail-label">Application Status:</span>
                        <span class="detail-value"><%=a.getStatus()%></span>
                    </div>
                    <ul class="nav-links">
                        <li><a href="cancelApplicationStud.jsp?appId=<%=a.getId() %>" class="nav-link logout-link">Cancel Registration</a></li>
                    </ul>
                </div>
            <% }
                }else { %>
                <p class="description">No application found for your student number.</p>
            <% } %>

            <ul class="nav-links">
                <li><a href="studentMenu.html" class="nav-link main-menu-link">Main Menu</a></li>
                <li><a href="LogoutServlet.do" class="nav-link logout-link">Logout</a></li>
            </ul>
        </div>
    </body>
</html>
