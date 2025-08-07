<%-- 
    Document   : landingPage
    Created on : 30 May 2025, 21:33:18
    Author     : sambo
--%>

<%@page import="za.ac.tut.enetities.Application"%>
<%@page import="java.util.List"%>
<%@page import="za.ac.tut.enetities.Residence"%>
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
            List<Residence> resses = (List<Residence>)session.getAttribute("resses");
            Integer resNumber = (Integer)session.getAttribute("resNumber");
            Integer appTotal = (Integer)session.getAttribute("appTotal");
            Integer approve = (Integer) session.getAttribute("approve");
        %>
        <!-- You can place dashboard widgets/cards here later -->
        <div class="mt-10 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <div class="bg-white p-6 rounded-lg shadow text-center">
                <h3 class="text-xl font-semibold text-indigo-600">Total Residence</h3>
                <p class="text-3xl font-bold text-gray-700 mt-2"><%=resNumber%></p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow text-center">
                <h3 class="text-xl font-semibold text-indigo-600">Total Applications</h3>
                <p class="text-3xl font-bold text-gray-700 mt-2"><%=appTotal%></p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow text-center">
                <h3 class="text-xl font-semibold text-indigo-600">Approved</h3>
                <p class="text-3xl font-bold text-gray-700 mt-2"><%=approve%></p>
            </div>
        </div>
            <div class="mt-10 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
            <%
                for (Residence res : resses) {
            %>
            <div class="bg-white p-6 rounded-lg shadow text-center">
                <h3 class="text-xl font-semibold text-indigo-600">Rooms Available</h3>
                <p class="text-3xl font-bold text-gray-700 mt-2"><%=res.getCapacity()%></p>
                <p class="text-3xl font-bold text-gray-700 mt-2"><%=res.getResName()%></p>
            </div>
            <%
                }
            %>
        </div>
        <button class="print-button no-print" onclick="window.print()">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
            <path fill-rule="evenodd" d="M5 4V2a2 2 0 012-2h6a2 2 0 012 2v2h2a2 2 0 012 2v10a2 2 0 01-2 2H3a2 2 0 01-2-2V6a2 2 0 012-2h2zm0 2h10v8H5V6zm5 2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 01-1 1h-2a1 1 0 01-1-1V8z" clip-rule="evenodd" />
        </svg>
        Download as PDF
    </button>
        </main>
    </body>
</html>
