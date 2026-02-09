<%-- 
    Document   : programming
    Created on : 25-Aug-2025, 1:07:40 am
    Author     : ALPANA KUMARI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Programming Languages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(120deg, #74ebd5, #9face6);
        }
        .hero {
            background: url('https://cdn.pixabay.com/photo/2017/08/30/01/05/code-2693599_1280.jpg') no-repeat center center/cover;
            height: 50vh;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            text-shadow: 2px 2px 8px #000;
        }
        .card {
            border-radius: 15px;
            transition: transform 0.3s;
        }
        .card:hover {
            transform: translateY(-10px);
        }
    </style>
</head>
<body>
    <!-- Hero Section -->
    <section class="hero">
        <div class="text-center">
            <h1 class="display-4 fw-bold">Explore Programming Languages</h1>
            <p class="lead">Learn the most popular languages with real-world examples</p>
        </div>
    </section>

    <!-- Languages Section -->
    <div class="container my-5">
        <div class="row g-4">
            <!-- Java Card -->
            <div class="col-md-4">
                <div class="card shadow-lg">
                    <img src="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg" class="card-img-top" alt="Java">
                    <div class="card-body">
                        <h5 class="card-title">Java</h5>
                        <p class="card-text">Robust, secure, and platform-independent. Perfect for enterprise applications.</p>
                        <a href="java.jsp" class="btn btn-primary">Start Learning</a>
                    </div>
                </div>
            </div>
            <!-- Python Card -->
            <div class="col-md-4">
                <div class="card shadow-lg">
                    <img src="https://cdn.pixabay.com/photo/2017/01/31/20/52/python-2028152_1280.png" class="card-img-top" alt="Python">
                    <div class="card-body">
                        <h5 class="card-title">Python</h5>
                        <p class="card-text">Easy to learn, powerful, and widely used in AI, Data Science, and Web Development.</p>
                        <a href="python.jsp" class="btn btn-success">Start Learning</a>
                    </div>
                </div>
            </div>
            <!-- C++ Card -->
            <div class="col-md-4">
                <div class="card shadow-lg">
                    <img src="https://cdn.pixabay.com/photo/2013/07/13/12/46/c-160361_1280.png" class="card-img-top" alt="C++">
                    <div class="card-body">
                        <h5 class="card-title">C++</h5>
                        <p class="card-text">Powerful language for system programming, gaming, and performance-critical apps.</p>
                        <a href="cplus.jsp" class="btn btn-danger">Start Learning</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-light text-center p-3">
        <p>&copy; 2025 Learn Hub | All Rights Reserved</p>
    </footer>

</body>
</html>
