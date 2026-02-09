<%-- 
    Document   : datastructure
    Created on : 25-Aug-2025, 1:29:27 am
    Author     : ALPANA KUMARI
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Data Structures</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f5f7fa;
            color: #333;
        }
        header {
            background: #3a7bd5;
            color: white;
            padding: 20px;
            text-align: center;
        }
        h1 {
            margin: 10px 0;
            font-size: 36px;
        }
        h2 {
            color: #3a7bd5;
        }
        .container {
            width: 80%;
            margin: 30px auto;
            line-height: 1.8;
        }
        .card {
            background: white;
            margin: 20px 0;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        ul {
            margin-left: 20px;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 15px 0;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th {
            background: #3a7bd5;
            color: white;
            padding: 10px;
        }
        td {
            padding: 10px;
            text-align: center;
        }
        footer {
            background: #3a7bd5;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 40px;
        }
    </style>
</head>
<body>

<header>
    <h1>Data Structures</h1>
    <p>Understanding the backbone of efficient programming</p>
</header>

<div class="container">
    
    <div class="card">
        <h2>📌 Introduction</h2>
        <p>
            A <b>Data Structure</b> is a way of organizing and storing data so that it can be accessed and worked with efficiently. 
            It plays a very important role in computer science because the choice of a data structure directly affects the 
            <i>performance, memory usage, and execution speed</i> of programs.
        </p>
    </div>

    <div class="card">
        <h2>🔹 Types of Data Structures</h2>
        <ul>
            <li><b>Linear Data Structures</b> – Elements are arranged sequentially.
                <ul>
                    <li>Array</li>
                    <li>Linked List</li>
                    <li>Stack</li>
                    <li>Queue</li>
                </ul>
            </li>
            <li><b>Non-Linear Data Structures</b> – Elements are connected in a hierarchy or graph.
                <ul>
                    <li>Tree</li>
                    <li>Graph</li>
                    <li>Heap</li>
                </ul>
            </li>
        </ul>
    </div>

    <div class="card">
        <h2>📊 Comparison of Linear Structures</h2>
        <table>
            <tr>
                <th>Structure</th>
                <th>Access Time</th>
                <th>Insertion</th>
                <th>Deletion</th>
                <th>Use Case</th>
            </tr>
            <tr>
                <td>Array</td>
                <td>O(1)</td>
                <td>O(n)</td>
                <td>O(n)</td>
                <td>Static Data Storage</td>
            </tr>
            <tr>
                <td>Linked List</td>
                <td>O(n)</td>
                <td>O(1)</td>
                <td>O(1)</td>
                <td>Dynamic Memory Allocation</td>
            </tr>
            <tr>
                <td>Stack</td>
                <td>O(n)</td>
                <td>O(1)</td>
                <td>O(1)</td>
                <td>Function Calls, Undo Mechanism</td>
            </tr>
            <tr>
                <td>Queue</td>
                <td>O(n)</td>
                <td>O(1)</td>
                <td>O(1)</td>
                <td>Scheduling, Order Processing</td>
            </tr>
        </table>
    </div>

    <div class="card">
        <h2>🌳 Trees & Graphs</h2>
        <p>
            <b>Trees</b> are hierarchical structures where one node is the root, and others are connected as children.
            They are widely used in databases, file systems, and hierarchical data representation.
        </p>
        <p>
            <b>Graphs</b> consist of vertices (nodes) and edges (connections). They are useful in networking, 
            social media connections, and pathfinding algorithms.
        </p>
    </div>

    <div class="card">
        <h2>🚀 Why Learn Data Structures?</h2>
        <ul>
            <li>Helps in writing optimized code</li>
            <li>Improves problem-solving ability</li>
            <li>Forms the foundation of algorithms</li>
            <li>Essential for technical interviews</li>
        </ul>
    </div>

</div>

<footer>
    <p>© 2025 Data Structures Learning | Designed for Students</p>
</footer>

</body>
</html>
