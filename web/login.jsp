<%-- 
    Document   : login
    Created on : 17-Jun-2025, 7:20:41 pm
    Author     : ALPANA KUMARI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entties.Massage" %> <!-- ✅ Import fixed -->
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login page</title>
        
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
        
        <%@include file="normal_navbar.jsp"  %>

        <main class="primary-background banner-background no-top-padding" style="min-height: 100vh;">
            <div class="container" >
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center ">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <p>Login here</p>
                            </div>

                            <!-- ✅ Fixed error handling block -->
                            <%
                                Massage m = (Massage) session.getAttribute("msg");
                                if (m != null) {
                            %>
                                <div class="alert <%= m.getCssClass() %>" role="alert">
                                    <%= m.getContent() %>
                                </div>
                            <%
                                    session.removeAttribute("msg");
                                }
                            %>

                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" required="" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" required="" type="password" class="form-control" id="exampleInputPassword1">
                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>   
                                </form>
                            </div>
                        </div>
                    </div>  
                </div>   
            </div> 
        </main>

        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </body>
</html>
