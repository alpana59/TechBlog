<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <!-- CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .banner-background{
          clip-path: polygon(30% 0%, 70% 0%, 100% 1%, 99% 98%, 66% 92%, 29% 90%, 1% 100%, 0 0);  
        }
    </style>
    
    
    
</head>
<body>
    <!<!-- navbar -->
    
    <%@include file="normal_navbar.jsp"  %>
    
   <!-- banner -->
<div class="container-fluid p-0 m-0 banner-background     ">
    <div class="p-5 mb-4 bg-light rounded-3 primary-background text-white">
        <div class="container py-5">
            <h1 class="display-3">Welcome to Techblog</h1>
            <p class="lead">
                Welcome to technical blog, world of technology.<br>
                Programming languages differ from natural languages in that natural languages are used for interaction between people, 
                while programming languages are designed to allow humans to communicate instructions to machines.
            </p>
          
            <p>  The term computer language is sometimes used interchangeably with "programming language".[2] However, usage of these terms varies among authors.</p>
            <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"  ></span>    Start it! Free</button>
            <a  href="Login.html" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin "> </span>   Login</a>

        
        </div>
    </div>
</div>
   
   <!<!-- cars -->
   <div  class="container">
       <div class="row mb-2">

           <div class="col-md-4">
               
               
            <div class="card" >
    
         <div class="card-body">
          <h5 class="card-title">java programing</h5>
       <p class="card-text">Java is a platform-independent, object-oriented programming language."

"Java is a simple, secure, and portable programming language used to develop applications. </p>
        <a href=" java.jsp"class="btn primary-background text-white">red more</a>
      </div>
       </div>               
               
                          
           </div> 
           
           
           <div class="col-md-4">
               
               
            <div class="card" >
    
         <div class="card-body">
          <h5 class="card-title">javascript</h5>
       <p class="card-text">JavaScript is a lightweight scripting language used to make web pages interactive and dynamic."

"It mainly runs on browsers and is also used on servers with Node.js." </p>
        <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript" target="_blank" class="btn primary-background text-white">red more</a>
      </div>
       </div>               
               
                          
           </div> 
           
           
           <div class="col-md-4">
               
               
            <div class="card" >
    
         <div class="card-body">
          <h5 class="card-title">c programing</h5>
       <p class="card-text">"C is a general-purpose, procedural programming language."

"It is mainly used for system software like operating systems and embedded systems

 </p>
        <a href="https://www.geeksforgeeks.org/c-programming-language/" target="_blank" class="btn primary-background text-white">red more</a>
      </div>
       </div>               
               
                          
           </div> 
           
                
           
                    
           
           
       </div>
       <div class="row">
           <div class="col-md-4">
               
               
            <div class="card" >
    
         <div class="card-body">
          <h5 class="card-title">c++ programing</h5>
       <p class="card-text">C++ is an object-oriented programming language, developed as an extension of C."

"It is widely used for system software, games, and applications requiring high performance. </p>
        <a href="cplus.jsp"class="btn primary-background text-white">red more</a>
      </div>
       </div>               
               
                          
           </div> 
           
           
           <div class="col-md-4">
               
               
            <div class="card" >
    
         <div class="card-body">
          <h5 class="card-title">python programing</h5>
       <p class="card-text">"Python is a high-level, interpreted programming language with simple syntax."

"It is widely used in web development, data science, AI, and automation." </p>
        <a href="python.jsp" class="btn primary-background text-white">red more</a>
      </div>
       </div>               
               
                          
           </div> 
           
           
           <div class="col-md-4">
               
               
            <div class="card" >
    
         <div class="card-body">
          <h5 class="card-title">Flutter programing</h5>
       <p class="card-text"> Flutter is an open-source UI toolkit developed by Google."

"It is used to build cross-platform apps for mobile, web, and desktop from a single codebase."  </p>
        <a href="https://flutter.dev/" target="_blank " class="btn primary-background text-white">red more</a>
      </div>
       </div>               
               
                          
           </div> 
           
           
           
           
           
           
           
           
       </div>
       
       
       
       
       
       
       
   </div>

    
    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    
</body>
</html>
