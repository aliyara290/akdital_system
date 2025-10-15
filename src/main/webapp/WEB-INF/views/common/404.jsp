<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .glitch-text {
            animation: glitch-main 2s infinite;
        }

        .glitch-text-shadow {
            animation: glitch-shadow-1 2s infinite;
            clip-path: polygon(0 0, 100% 0, 100% 45%, 0 45%);
        }

        .glitch-text-shadow-2 {
            animation: glitch-shadow-2 2s infinite;
            clip-path: polygon(0 55%, 100% 55%, 100% 100%, 0 100%);
        }

        .glitch-message {
            animation: glitch-flicker 3s infinite;
        }

        .glitch-subtitle {
            animation: glitch-typing 4s infinite;
        }

        .glitch-line {
            position: absolute;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, #666, transparent);
            opacity: 0;
        }

        .glitch-line-1 {
            top: 20%;
            animation: glitch-scan-1 3s infinite;
        }

        .glitch-line-2 {
            top: 80%;
            animation: glitch-scan-3 3.5s infinite;
        }

        @keyframes glitch-main {
            0%, 100% { transform: translate(0); }
            10% { transform: translate(-2px, -1px); }
            20% { transform: translate(2px, 1px); }
            30% { transform: translate(-1px, 2px); }
            40% { transform: translate(1px, -2px); }
            50% { transform: translate(-2px, 1px); }
            60% { transform: translate(2px, -1px); }
            70% { transform: translate(-1px, -2px); }
            80% { transform: translate(1px, 2px); }
            90% { transform: translate(-2px, -1px); }
        }

        @keyframes glitch-shadow-1 {
            0%, 100% { transform: translate(0); }
            10% { transform: translate(-4px, -2px); }
            20% { transform: translate(4px, 2px); }
            30% { transform: translate(-2px, 4px); }
            40% { transform: translate(2px, -4px); }
            50% { transform: translate(-4px, 2px); }
            60% { transform: translate(4px, -2px); }
            70% { transform: translate(-2px, -4px); }
            80% { transform: translate(2px, 4px); }
            90% { transform: translate(-4px, -2px); }
        }

        @keyframes glitch-shadow-2 {
            0%, 100% { transform: translate(0); }
            10% { transform: translate(3px, 1px); }
            20% { transform: translate(-3px, -1px); }
            30% { transform: translate(1px, -3px); }
            40% { transform: translate(-1px, 3px); }
            50% { transform: translate(3px, -1px); }
            60% { transform: translate(-3px, 1px); }
            70% { transform: translate(1px, 3px); }
            80% { transform: translate(-1px, -3px); }
            90% { transform: translate(3px, 1px); }
        }

        @keyframes glitch-flicker {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.8; }
            51% { opacity: 1; }
            52% { opacity: 0.9; }
            53% { opacity: 1; }
            90% { opacity: 1; }
            91% { opacity: 0.7; }
            92% { opacity: 1; }
        }

        @keyframes glitch-typing {
            0%, 100% { opacity: 0.7; }
            50% { opacity: 1; }
        }

        @keyframes glitch-scan-1 {
            0%, 100% { opacity: 0; transform: translateY(0); }
            50% { opacity: 0.8; transform: translateY(20px); }
        }

        @keyframes glitch-scan-3 {
            0%, 100% { opacity: 0; transform: translateY(0); }
            50% { opacity: 0.4; transform: translateY(10px); }
        }
    </style>
</head>
<body class="bg-[#214BC3] text-white">
<div class="min-h-screen flex items-center justify-center p-4 overflow-hidden">
    <div class="text-center space-y-8 max-w-2xl mx-auto">
        <div class="relative">
            <h1 class="text-9xl md:text-[12rem] font-black glitch-text select-none text-transparent">404</h1>
            <h1 class="absolute inset-0 text-9xl md:text-[12rem] font-black glitch-text-shadow select-none text-slate-100">
                404
            </h1>
            <h1 class="absolute inset-0 text-9xl md:text-[12rem] font-black glitch-text-shadow-2 select-none text-slate-100">
                404
            </h1>
        </div>
    </div>
</div>
</body>
</html>
