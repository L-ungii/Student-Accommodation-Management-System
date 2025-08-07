<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register Residence Page</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f3f4f6;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
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
                max-width: 600px;
                width: 90%;
                padding: 3rem;
                background-color: rgba(255, 255, 255, 0.5);
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
                border-radius: 1.5rem;
                box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.15);
                text-align: center;
                border: 1px solid rgba(255, 255, 255, 0.3);
                z-index: 1;
            }

            .heading {
                font-size: 2.5rem;
                font-weight: 700;
                color: #4f46e5;
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

            .form-group {
                margin-bottom: 1.5rem;
                text-align: left;
            }

            .form-group label {
                display: block;
                font-weight: 600;
                color: #4a5568;
                margin-bottom: 0.5rem;
                font-size: 0.95rem;
            }

            .text-input {
                width: 100%;
                padding: 0.75rem 1rem;
                border: 1px solid #d1d5db;
                border-radius: 0.5rem;
                background-color: #ffffff;
                font-size: 1rem;
                color: #374151;
                transition: border-color 0.2s ease, box-shadow 0.2s ease;
                box-sizing: border-box;
            }

            .text-input:focus {
                border-color: #6366f1;
                outline: none;
                box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.25);
            }

            .submit-btn {
                display: block;
                width: 100%;
                padding: 1rem 2rem;
                background-color: #4f46e5;
                color: white;
                font-size: 1.125rem;
                font-weight: 600;
                border: none;
                border-radius: 0.75rem;
                cursor: pointer;
                transition: background-color 0.2s ease, transform 0.1s ease;
                box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
                margin-top: 2rem;
            }

            .submit-btn:hover {
                background-color: #4338ca;
                transform: translateY(-2px);
            }

            .submit-btn:active {
                transform: translateY(0);
            }

            .logout-link {
                display: inline-block;
                color: #ef4444;
                font-weight: 600;
                text-decoration: none;
                transition: color 0.2s ease;
            }

            .logout-link:hover {
                color: #dc2626;
            }

            @media (max-width: 600px) {
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
                .form-group {
                    text-align: left;
                }
            }
        </style>
    </head>
    <body>
        <div class="theme-container">
            <h1 class="heading">Register Residence</h1>
            <p class="description">
                Enter the details of the new residence below:
            </p>
            <form action="RegisterResidenceServlet.do" method="POST" enctype="multipart/form-data" class="space-y-4">
                <div class="form-group">
                    <label for="resName">Name of Residence:</label>
                    <input type="text" id="resName" name="resName" required class="text-input"/>
                </div>

                <div class="form-group">
                    <label for="location">Location:</label>
                    <input type="text" id="location" name="location" required class="text-input"/>
                </div>

                <div class="form-group">
                    <label for="capacity">Capacity:</label>
                    <input type="text" id="capacity" name="capacity" required class="text-input"/>
                </div>

                <div class="form-group">
                    <label for="resPic">Upload Residence Picture:</label>
                    <input type="file" id="resPic" name="resPic" required class="text-input"/>
                </div>
                
                <div class="form-group">
                    <label for="intsa">Intsagram Res Username:</label>
                    <input type="text" id="insta" name="insta" placeholder="OPTIONAL" class="text-input"/>
                </div>
                
                <div class="form-group">
                    <label for="ticktok">TikTok Res Username:</label>
                    <input type="text" id="tiktok" name="tiktok" placeholder="OPTIONAL" class="text-input"/>
                </div>
                
                <input type="submit" value="Register Residence" class="submit-btn"/>
            </form>
        </div>
    </body>
</html>
