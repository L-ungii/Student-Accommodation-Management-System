<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="za.ac.tut.enetities.Student" %>
<%@ page import="za.ac.tut.enetities.Residence" %>
<!DOCTYPE html>
<html>
<head>
    <title>Room Allocation Result</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white shadow-md rounded-xl p-8 max-w-md text-center">
        <h1 class="text-2xl font-bold text-indigo-600 mb-4">Room Allocation</h1>

        <%
            Student student = (Student) request.getAttribute("student");
            Residence residence = (Residence) request.getAttribute("residence");
            String assignedRoomNum = (String) request.getAttribute("assignedRoomNum");
            String message = (String) request.getAttribute("message");
        %>

        <% if (message != null) { %>
            <p class="text-gray-700 mb-4">
                <strong>Student:</strong> <%= student.getName() %><br/>
                <strong>Residence:</strong> <%= residence.getResName() %><br/><br/>
                <span class="text-red-500 font-semibold"><%= message %></span>
            </p>
        <% } else { %>
            <p class="text-gray-700 mb-2">
                <strong>Student:</strong> <%= student.getName() %>
            </p>
            <p class="text-gray-700 mb-2">
                <strong>Residence:</strong> <%= residence.getResName() %>
            </p>
            <p class="text-gray-700 mb-6">
                <strong>Room Number Assigned:</strong>
                <span class="text-indigo-500 font-semibold text-lg">
                    <%= assignedRoomNum %>
                </span>
            </p>
        <% } %>

        <a href="landingPage.jsp" class="inline-block mt-4 bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">
            Go Back to Dashboard
        </a>
    </div>
</body>
</html>
