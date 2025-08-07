<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="za.ac.tut.enetities.Room" %>
<%@ page import="za.ac.tut.enetities.Student" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Room</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
    <div class="bg-white p-8 shadow-lg rounded-lg max-w-md w-full text-center">
        <h2 class="text-2xl font-bold text-indigo-600 mb-4">My Room</h2>
        <%
            Room room = (Room) request.getAttribute("room");
            Student student = (Student) request.getAttribute("student");
            String noRoomMessage = (String) request.getAttribute("noRoomMessage");
        %>

        <% if (room != null) { %>
            <p class="text-gray-700 mb-2"><strong>Student Name:</strong> <%= student.getName() %></p>
            <p class="text-gray-700 mb-2"><strong>Room Number:</strong> <%= room.getRoom_Num() %></p>
            <p class="text-gray-700 mb-2"><strong>Room Type:</strong> <%= room.getRoomType() %></p>
            <p class="text-gray-700 mb-4"><strong>Status:</strong> <%= room.getStatus() %></p>
        <% } else { %>
            <p class="text-red-500 font-semibold text-lg"><%= noRoomMessage %></p>
        <% } %>

        <a href="landingPage.jsp" class="mt-4 inline-block px-4 py-2 bg-indigo-600 text-white rounded hover:bg-indigo-700">
            Back to Dashboard
        </a>
    </div>
</body>
</html>
