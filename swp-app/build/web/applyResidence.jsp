<%@page import="za.ac.tut.enetities.Residence"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Apply for Residence</title>
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

            .theme-container {
                max-width: 600px;
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

            .form-group label {
                display: block;
                font-weight: 600;
                color: #4a5568;
                margin-bottom: 0.5rem;
                font-size: 0.95rem;
            }

            .text-input,
            select {
                width: 100%;
                padding: 0.75rem 1rem;
                border: 1px solid #d1d5db;
                border-radius: 0.5rem;
                background-color: #ffffff;
                font-size: 1rem;
                color: #374151;
                transition: border-color 0.2s ease, box-shadow 0.2s ease;
                box-sizing: border-box;
            }

            .text-input:focus,
            select:focus {
                border-color: #6366f1;
                outline: none;
                box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.25);
            }

            select {
                appearance: none;
                background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 20 20' fill='currentColor'%3E%3Cpath fill-rule='evenodd' d='M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z' clip-rule='evenodd'/%3E%3C/svg%3E");
                background-repeat: no-repeat;
                background-position: right 0.75rem center;
                background-size: 1.5em;
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
                .logout-link {
                    font-size: 0.9rem;
                }
            }
        </style>
    </head>
    <body class="flex flex-col items-center justify-center min-h-screen">
        <div class="theme-container">
            <h1 class="heading">Apply for Residence</h1>
            <p class="description">
                Please fill in the form below to register for a residence.
            </p>
            <%
                List<Residence> resList = (List<Residence>) request.getAttribute("resList");
            %>
            <form action="ApplyReidence2.do" method="POST" enctype="multipart/form-data" class="space-y-4">
                
                <div class="form-group">
                    <label for="roomType">Room type:</label>
                    <select name="roomType" id="roomType" class="text-input">
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        <option value="disable">Special Conditions(disable)</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="resName">Residence Name:</label>
                    <select name="resName" id="resName" class="text-input">
                        <option value="" disabled selected>Choose an option</option>
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
                    <label for="proofOfFunding">Upload proof of Funding:</label>
                    <input type="file" id="proofOfFunding" name="proofOfFunding" required class="text-input"/>
                </div>

                <div class="form-group">
                    <label for="proofOfReg">Upload proof of Registration:</label>
                    <input type="file" id="proofOfReg" name="proofOfReg" required class="text-input"/>
                </div>

                <div class="form-group">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate" required class="text-input"/>
                </div>

                <div class="form-group">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate" required class="text-input"/>
                </div>

                <input type="submit" value="SUBMIT" class="submit-btn"/>
            </form>

            <ul class="space-y-2 mt-8">
                <li>
                    <a href="studentMenu.html" class="text-indigo-600 hover:text-indigo-800 hover:underline font-medium transition duration-150 ease-in-out">
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
