<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Requirements Page</title>
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
            padding: 0;
            box-sizing: border-box;
            position: relative;
            overflow: hidden;
        }

        #full-screen-bg {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url('pic.jpg');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            z-index: -2;
        }

        #partial-blur-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            opacity: 0;
            transition: opacity 1.5s ease-in;
            z-index: -1;
        }

        #partial-blur-overlay.show {
            opacity: 1;
        }

        .theme-container {
            max-width: 500px;
            width: 90%;
            padding: 2.5rem;
            background-color: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
            border-radius: 1.5rem;
            box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.15);
            text-align: left;
            border: 1px solid rgba(255, 255, 255, 0.3);
            z-index: 1;
            opacity: 0;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%) translateX(-50px);
            transition: opacity 1s ease-out, transform 1s ease-out;
        }

        .theme-container.show {
            opacity: 1;
            transform: translate(-50%, -50%) translateX(0);
        }

        .heading {
            font-size: 2.2rem;
            font-weight: 700;
            color: #4f46e5;
            margin-bottom: 1.5rem;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.05);
            text-align: center;
        }

        .requirements-list {
            list-style: none;
            padding: 0;
            margin-bottom: 2rem;
        }

        .requirements-list li {
            font-size: 1.05rem;
            color: #374151;
            margin-bottom: 0.75rem;
            position: relative;
            padding-left: 1.5rem;
        }

        .requirements-list li::before {
            content: '✅';
            position: absolute;
            left: 0;
            color: #10b981;
            font-size: 1.1em;
            line-height: 1;
        }

        .continue-text {
            font-size: 1.15rem;
            color: #4b5563;
            margin-top: 2rem;
            text-align: center;
        }

        .continue-link {
            display: inline-block;
            background-color: #4f46e5;
            color: white;
            padding: 0.75rem 2rem;
            border-radius: 0.5rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s ease, transform 0.2s ease;
            border: none;
            text-decoration: none;
            margin-top: 1rem;
        }

        .continue-link:hover {
            background-color: #6366f1;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .theme-container {
                width: 95%;
                left: 50%;
                transform: translateY(-50%) translateX(-50%);
                padding: 2rem;
                max-width: 90%;
            }
            .heading {
                font-size: 2rem;
            }
            .requirements-list li {
                font-size: 1rem;
            }
            .continue-text {
                font-size: 1rem;
            }
            #partial-blur-overlay {
                width: 100%;
                backdrop-filter: blur(5px);
            }
        }
    </style>
</head>
<body>
    <div id="full-screen-bg"></div>
    <div id="partial-blur-overlay"></div>

    <div class="theme-container">
        <h1 class="heading">Registration Requirements</h1>
        <ul class="requirements-list">
            <li>Residence Manager Details (Names, Surname, ID)</li>
            <li>Certified copy of residence manager's ID</li>
            <li>Lease Agreement</li>
            <li>Business License</li>
        </ul>
        <p class="continue-text">You have all documents <a href="AdminSignUp.jsp" class="continue-link">continue</a></p>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const blurOverlay = document.getElementById('partial-blur-overlay');
            const contentContainer = document.querySelector('.theme-container');

            setTimeout(() => {
                blurOverlay.classList.add('show');
            }, 500);

            setTimeout(() => {
                contentContainer.classList.add('show');
            }, 1000);
        });
    </script>
</body>
</html>