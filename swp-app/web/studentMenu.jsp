<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Dashboard</title>
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
            iframe {
                border: none;
            }
        </style>
    </head>
    <body class="flex h-screen bg-gray-100">
        <!-- Sidebar -->
        <div class="w-64 bg-white shadow-lg p-4 space-y-4">
            <h2 class="text-2xl font-bold text-indigo-600">Student Panel</h2>
            <nav class="space-y-2" id="sidebar-nav">
                <a href="ManagerListServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Chat With Us</a>
                <a href="ViewResServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">View Residence</a>
                <a href="ReserveRoomServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Reserve Accommodation</a>
                <a href="ViewReserveServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">View Reservation</a>
                <a href="CheckSpaceServlet.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Check Space</a>
                <a href="ApplyResidence1.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">Register For Residence</a>
                <a href="ViewApplicationStudent.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">View Registration</a>
                <a href="ViewRoomStudent.do" target="contentFrame" class="sidebar-link block px-3 py-2 rounded hover:bg-indigo-100">View Room</a>
                <a href="index.html" class="block px-3 py-2 rounded text-red-600 hover:bg-red-100">Logout</a>
            </nav>
        </div>

        <!-- Main Content -->
        <main class="flex-1">
            <iframe name="contentFrame" id="contentFrame" src="ViewResServlet.do" class="w-full h-full"></iframe>
        </main>

        <!-- Script to manage active link -->
        <script>
            const links = document.querySelectorAll('.sidebar-link');
            links.forEach(link => {
                link.addEventListener('click', () => {
                    links.forEach(l => l.classList.remove('active'));
                    link.classList.add('active');
                });
            });

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
