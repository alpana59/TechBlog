<%-- 
    Document   : contact
    Created on : 25-Aug-2025, 12:34:36 am
    Author     : ALPANA KUMARI
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7f8;
            margin: 0;
            padding: 0;
        }
        .contact-container {
            width: 400px;
            margin: 30px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            font-weight: bold;
            color: #555;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
        }
        input:focus, textarea:focus {
            border-color: #007BFF;
        }
        .btn {
            background: #007BFF;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .btn:hover {
            background: #0056b3;
        }
        .info {
            margin-top: 20px;
            font-size: 14px;
            color: #444;
            text-align: center;
        }
        .map-container {
            margin: 30px auto;
            width: 90%;
            max-width: 600px;
        }
        iframe {
            width: 100%;
            height: 300px;
            border: 0;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>
    <div class="contact-container">
        <h2>Contact Us</h2>
        <form>
            <label for="name">Name</label>
            <input type="text" id="name" placeholder="Enter your name">

            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Enter your email">

            <label for="message">Message</label>
            <textarea id="message" rows="5" placeholder="Type your message"></textarea>

            <button type="submit" class="btn">Send Message</button>
        </form>

        <div class="info">
            📧 support@techblog.com <br>
            📞 +91 98765 43210 <br>
            📍 Patna, Bihar, India
        </div>
    </div>

    <!-- Google Map -->
    <div class="map-container">
        <iframe 
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3666.692874303138!2d85.1376!3d25.5941!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ed5856c04cfed1%3A0xb2fbb4c3c9b5f3a1!2sPatna%2C%20Bihar%2C%20India!5e0!3m2!1sen!2sin!4v1700000000000"
            allowfullscreen="" loading="lazy">
        </iframe>
    </div>
</body>
</html>

