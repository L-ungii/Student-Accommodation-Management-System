<%-- 
    Document   : landingPage
    Created on : 30 May 2025, 21:33:18
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="flex h-screen bg-gray-100">
        <main class="flex-1 p-10">
        <h2 class="text-3xl font-bold text-gray-800 mb-4">Welcome</h2>
        <p class="text-gray-600">Use the sidebar to navigate through system management tasks.</p>

        <%
            Integer capacity = (Integer) session.getAttribute("capacity");
            Integer applications = (Integer) session.getAttribute("applications");
            Integer approve = (Integer) session.getAttribute("approve");
        %>
        <!-- You can place dashboard widgets/cards here later -->
        <div class="mt-10 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="bg-white p-6 rounded-lg shadow text-center">
                <h3 class="text-xl font-semibold text-indigo-600">Total Applications</h3>
                <p class="text-3xl font-bold text-gray-700 mt-2"><%=applications%></p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow text-center">
                <h3 class="text-xl font-semibold text-indigo-600">Approved</h3>
                <p class="text-3xl font-bold text-gray-700 mt-2"><%=approve%></p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow text-center">
                <h3 class="text-xl font-semibold text-indigo-600">Rooms Available</h3>
                <p class="text-3xl font-bold text-gray-700 mt-2"><%=capacity%></p>
            </div>
        </div>
        </main>
    </body>
</html>
