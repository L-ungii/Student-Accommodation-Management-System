<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Residence Manager Application Outcome</title>
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
            max-width: 1000px;
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
            color: #10b981;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.05);
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
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
            transition: color 0.2s ease, text-decoration 0.2s ease;
            margin-top: 1rem;
        }

        .logout-link:hover {
            color: #dc2626;
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .theme-container {
                padding: 2rem;
                width: 90%;
            }
            .heading {
                font-size: 2rem;
                white-space: normal;
            }
            .description {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="theme-container">
        <h1 class="heading">Thank you for your application.</h1>

        <p class="description">
            Your application has been successfully received and is now pending review by our administration team.<br>
            We will notify you via email regarding the status of your application once it has been processed.
        </p>

        <a href="index.html" class="logout-link">Logout</a>
    </div>
</body>
</html>