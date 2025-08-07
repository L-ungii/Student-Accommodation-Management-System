<%@page import="za.ac.tut.enetities.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Cancellation</title>
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
            max-width: 600px;
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
            color: #ef4444;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.05);
        }

        .description {
            font-size: 1.125rem;
            color: #6b7280;
            margin-bottom: 2rem;
            line-height: 1.75rem;
        }

        .confirmation-details {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .detail-item {
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            flex-wrap: wrap;
        }

        .detail-item strong {
            color: #374151;
            font-weight: 600;
            min-width: 150px;
            margin-right: 10px;
        }

        .detail-item span {
            color: #4b5563;
            flex-grow: 1;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 1rem;
            margin-top: 2rem;
        }

        .confirm-button {
            background-color: #ef4444;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
            border: none;
        }

        .confirm-button:hover {
            background-color: #dc2626;
        }

        .back-button {
            background-color: #6b7280;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease;
            border: none;
        }

        .back-button:hover {
            background-color: #4b5563;
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
            .detail-item strong {
                min-width: unset;
                margin-right: 0;
                margin-bottom: 5px;
            }
            .button-group {
                flex-direction: column;
            }
            .confirm-button, .back-button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="theme-container">
        <h1 class="heading">Confirm Cancellation</h1>
        <p class="description">
            Are you sure you want to cancel the registration for the following student? This action cannot be undone.
        </p>

        <div class="confirmation-details">
            <%
                Integer studNum = Integer.parseInt(request.getParameter("studNum"));
            %>
            <div class="detail-item"><strong>Student Number:</strong> <span><%= studNum != null ? studNum : "N/A" %></span></div>
        </div>
        <div class="button-group">
            <form action="CancelRegitrationAdmin.do" method="POST">
                <input type="hidden" name="studNum" value="<%= studNum != null?studNum : "0" %>" />
                <button type="submit" class="confirm-button">Confirm Cancellation</button>
            </form>
            <form action="ViewApprovedServlet.do" method="GET">
                <button type="submit" class="back-button">Go Back</button>
            </form>
        </div>
    </div>
</body>
</html>