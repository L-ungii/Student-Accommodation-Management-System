<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Res Manager Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <style>
            body {
                font-family: 'Inter', sans-serif;
            }
            .sidebar-link.active {
                background-color: #e0e7ff; /* A lighter indigo for active state */
                color: #4f46e5; /* Darker indigo text for active state */
                font-weight: 600;
            }
            /* Ensure iframe content stretches */
            iframe {
                border: none; /* Remove default iframe border */
            }
        </style>
    </head>
    <body class="flex h-screen bg-gray-100">

        <div class="w-64 bg-white shadow-lg p-4 space-y-4">
            <h2 class="text-2xl font-bold text-indigo-600">Res Manager Panel</h2>
            <nav class="space-y-2" id="sidebar">
                <a href="landingPage.jsp" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Statistics</a>
                <a href="ViewReservedStudentServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Reserved Students</a>
                <a href="ViewApplicationServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Verify Applications</a>
                <a href="ViewApprovedServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Approved Students</a>
                <a href="StudentListServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Chat With Students</a>
                <a href="LogoutServlet.do" class="block px-3 py-2 rounded text-red-600 hover:bg-red-100">Logout</a>
            </nav>
        </div>

        <main class="flex-1">
            <iframe name="contentFrame" id="contentFrame" class="w-full h-full" frameborder="0" src="landingPage.jsp"></iframe>
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

            // Set initial active link based on iframe src
            document.addEventListener('DOMContentLoaded', () => {
                const iframe = document.getElementById('contentFrame');
                const initialSrc = iframe.getAttribute('src');
                links.forEach(link => {
                    if (link.getAttribute('href') === initialSrc) {
                        link.classList.add('active');
                    }
                });
            });
        </script>

    </body>
</html>
