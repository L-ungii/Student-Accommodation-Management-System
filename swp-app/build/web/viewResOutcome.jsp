<%@page import="java.util.Base64"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.enetities.Residence"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Res Page</title>
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
                max-width: 1000px;
                width: 95%;
                padding: 3rem;
                background-color: rgba(255, 255, 255, 0.6); 
                backdrop-filter: blur(15px);
                -webkit-backdrop-filter: blur(15px);
                border-radius: 1.5rem;
                box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.5); 
                text-align: center;
                border: 1px solid rgba(255, 255, 255, 0.3);
                z-index: 1;
            }

            img {
                max-width: 100%;
                height: auto;
                display: block;
                border-radius: 0.5rem;
                object-fit: cover;
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

            .logout-link {
                display: inline-block;
                color: #ef4444;
                font-weight: 600;
                text-decoration: none;
                transition: color 0.2s ease;
                margin-top: 1rem;
            }

            .logout-link:hover {
                color: #dc2626;
            }

            table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0 1.5rem;
                margin-bottom: 2rem;
            }

            td {
                padding: 1.5rem;
                vertical-align: top;
                background-color: #ffffff;
                border: 1px solid #e5e7eb;
                border-radius: 0.75rem;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                display: flex;
                flex-direction: row;
                align-items: center;
                text-align: left;
                gap: 1.5rem;
            }

            .residence-image-container {
                flex-shrink: 0;
                width: 150px;
                height: 150px;
                display: flex;
                justify-content: center;
                align-items: center;
                overflow: hidden;
            }

            .residence-image-container img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .residence-details {
                flex-grow: 1;
            }

            em {
                color: #6b7280;
                font-size: 0.9rem;
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
                table, tbody, tr {
                    display: block;
                    width: 100%;
                }
                tr {
                    margin-bottom: 1rem;
                }
                td {
                    flex-direction: column;
                    align-items: center;
                    text-align: center;
                    padding: 1rem;
                    gap: 0.75rem;
                }
                .residence-image-container {
                    width: 120px;
                    height: 120px;
                    margin-bottom: 0.5rem;
                }
            }
        </style>
    </head>
    <body>
        <div class="theme-container">
            <h1 class="heading">View Residence</h1>
            <p class="description">
                Here is the list of residence
            </p>
            <%
                List<Residence> resList = (List<Residence>) request.getAttribute("resList");
            %>

            <table>
                <tbody>
                    <%
                        if (resList != null && !resList.isEmpty()) {
                            for (int i = 0; i < resList.size(); i++) {
                                byte[] photo = resList.get(i).getResidence_Picture();
                                String base64Image = "";

                                if (photo != null && photo.length > 0) {
                                    base64Image = Base64.getEncoder().encodeToString(photo);
                                }
                    %>
                    <tr>
                        <td>
                            <div class="residence-image-container">
                                <% if (!base64Image.isEmpty()) { %>
                                    <img src="data:image/jpeg;base64,<%= base64Image%>" alt="residence Photo"/>
                                <% } else { %>
                                    <em>No photo available</em>
                                <% } %>
                            </div>
                            <div class="residence-details">
                                <span class="font-semibold text-gray-800 text-lg"><%=resList.get(i).getResName()%></span><br/>
                                <span class="text-gray-600 text-base"><%=resList.get(i).getLocation()%></span><br/>
                                <p>
                                    More information about the residence visit:
                                </p>
                                <%
                                    if(resList.get(i).getInsta() != null){
                                %>
                                <a href="https://www.instagram.com/<%=resList.get(i).getInsta()%>" target="_blank">Instagram</a><br/>
                                <%
                                    }if(resList.get(i).getTiktok() != null){
                                %>
                                <a href="https://www.tiktok.com/@<%=resList.get(i).getTiktok()%>" target="_blank">TikTok</a><br/>
                                <%
                                    }
                                %>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td class="text-center text-gray-500">No residences found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
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
