<%-- 
    Document   : adminMenu
    Created on : 30 May 2025, 21:12:42
    Author     : sambo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="flex h-screen bg-gray-100">

        <!-- Sidebar -->
        <div class="w-64 bg-white shadow-lg p-4 space-y-4">
            <h2 class="text-2xl font-bold text-indigo-600">Admin Panel</h2>
            <nav class="space-y-2" id="sidebar">
                <a href="AdminReport.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100 active">Report</a>
                <a href="ViewResApplication.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100 active">Res Application</a>
                <a href="LogoutServlet.do" class="block px-3 py-2 rounded text-red-600 hover:bg-red-100">Logout</a>
            </nav>
        </div>

        <!-- Main Content Area -->
        <main class="flex-1 p-10">
            <iframe name="contentFrame" id="contentFrame" class="w-full h-full border rounded-lg" frameborder="0" src="AdminReport.do"></iframe>

        </main>

        <script>
            // Highlight the active sidebar link
            const links = document.querySelectorAll('.sidebar-link');
            links.forEach(link => {
                link.addEventListener('click', () => {
                    links.forEach(l => l.classList.remove('active'));
                    link.classList.add('active');
                });
            });
        </script>

    </body>
</html>
