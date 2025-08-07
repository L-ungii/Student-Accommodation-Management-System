<%@page import="za.ac.tut.enetities.Administrator"%>
<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.enetities.Application"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin View Applications</title>
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
            max-width: 900px; /* Increased max-width for better display of multiple applications */
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
            min-width: 180px; /* Adjusted min-width for labels */
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
<body>
    <div class="theme-container">
        <h1 class="heading">View Residence Manager Applications</h1>
        <p class="description">Below is a list of pending Residence Manager applications. You can view details and update their status.</p>

        <%
            List<Administrator> appList = (List<Administrator>) request.getAttribute("admin"); // Expecting a list of Application objects

            if (appList == null || appList.isEmpty()) {
        %>
        <p class="no-applications-message">No applications found.</p>
        <%
            } else {
                for (int i = 0; i < appList.size(); i++) { // Correctly loop through the list size
                    Administrator currentApp = appList.get(i);

                    
                    byte[] idCopyBytes = currentApp.getId_copy(); // Assuming getIdCopy() method
                    String base64IdCopy = "";
                    if (idCopyBytes != null && idCopyBytes.length > 0) {
                        base64IdCopy = Base64.getEncoder().encodeToString(idCopyBytes);
                    }

                    byte[] leaseCopyBytes = currentApp.getLic_copy(); // Assuming getLeaseCopy() method
                    String base64LeaseCopy = "";
                    if (leaseCopyBytes != null && leaseCopyBytes.length > 0) {
                        base64LeaseCopy = Base64.getEncoder().encodeToString(leaseCopyBytes);
                    }

                    byte[] businessLicenseBytes = currentApp.getBusniess_lic(); // Assuming getBusinessLicenseCopy() method
                    String base64BusinessLicense = "";
                    if (businessLicenseBytes != null && businessLicenseBytes.length > 0) {
                        base64BusinessLicense = Base64.getEncoder().encodeToString(businessLicenseBytes);
                    }
        %>
        <form action="UpdateResApplication.do" method="POST" class="application-card">
            <table>
                <tr>
                    <td>Applicant Name:</td>
                    <td><%=currentApp.getName()%></td>
                    <td><input type="hidden" name="applicantId" value="<%=currentApp.getId()%>" /></td> <%-- Assuming an ID to identify the application --%>
                </tr>
                <tr>
                    <td>Surname:</td>
                    <td><%=currentApp.getSurname()%></td>
                </tr>
                <tr>
                    <td>ID Number:</td>
                    <td><%=currentApp.getId_no()%></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><%=currentApp.getEmail()%></td>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><%=currentApp.getUsername()%></td>
                </tr>
                <tr>
                    <td>Certified ID Copy:</td>
                    <td>
                        <% if (!base64IdCopy.isEmpty()) { %>
                            <a href="data:application/pdf;base64,<%=base64IdCopy%>" download="id_copy_<%=currentApp.getId_no()%>.pdf" class="download-link">Download (PDF)</a>
                        <% } else { %>
                            N/A
                        <% } %>
                        <a href="mailto:<%=currentApp.getEmail()%>" class="email-link">Email Applicant</a>
                    </td>
                </tr>
                <tr>
                    <td>Lease Agreement:</td>
                    <td>
                        <% if (!base64LeaseCopy.isEmpty()) { %>
                            <a href="data:application/pdf;base64,<%=base64LeaseCopy%>" download="lease_agreement_<%=currentApp.getId_no()%>.pdf" class="download-link">Download (PDF)</a>
                        <% } else { %>
                            N/A
                        <% } %>
                        <a href="mailto:<%=currentApp.getEmail()%>" class="email-link">Email Applicant</a>
                    </td>
                </tr>
                <tr>
                    <td>Business License:</td>
                    <td>
                        <% if (!base64BusinessLicense.isEmpty()) { %>
                            <a href="data:application/pdf;base64,<%=base64BusinessLicense%>" download="business_license_<%=currentApp.getId_no()%>.pdf" class="download-link">Download (PDF)</a>
                        <% } else { %>
                            N/A
                        <% } %>
                        <a href="mailto:<%=currentApp.getEmail()%>" class="email-link">Email Applicant</a>
                    </td>
                </tr>
                <tr>
                    <td>Application Status:</td>
                    <td>
                        <select name="status" class="status-select">
                            <option value="pending" <%= "pending".equals(currentApp.getStatus()) ? "selected" : "" %>>Pending</option>
                            <option value="approved" <%= "approved".equals(currentApp.getStatus()) ? "selected" : "" %>>Approved</option>
                            <option value="declined" <%= "declined".equals(currentApp.getStatus()) ? "selected" : "" %>>Declined</option>
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
                }
            }
        %>

        <div class="nav-links-container">
            <ul class="space-y-2">
                               <li>
                    <a href="LogoutServlet.do" class="logout-link">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</body>
</html>
