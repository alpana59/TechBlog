

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! somthing well wrong....</title>
        
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
        <div class="container text-center">
            <img src="image/error.png" class="img-fluid w-25">

            <h1 class="display-3">Sorry! Something went wrong </h2>
              <%= exception%>
            <a    href="index.jsp" class="btn primary-background btn-lg text-white mt-3"  >Home</a>
            
            
        </div>
    </body>
</html>
