<%-- 
    Document   : show_blog_page
    Created on : 04-Jul-2025, 11:05:26 pm
    Author     : ALPANA KUMARI
--%>

<%@page import="com.tech.blog.entties.User"%>
<%@page errorPage="error_page.jsp"%>    User user = (User) session.getAttribute("currentUser");

<%@page import="com.tech.blog.dao.PostDao"%>
<%@ page import="com.tech.blog.dao.UserDao" %>
<%@page import="com.tech.blog.entties.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entties.Category"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>


<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return; // Important: iske bina aage ka HTML bhi render ho sakta hai
    }
%>


<%
    
    
int postId=Integer.parseInt(request.getParameter("post_id"));
PostDao d=new PostDao(ConnectionProvider.getConnection());
Post p=d.getPostByPostId(postId);



%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getPtitle()%>!|| Techblog by Alpana</title>


        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 1%, 99% 98%, 66% 92%, 29% 90%, 1% 100%, 0 0);
            }
            .post-title{
                font-weight:100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;

            }
            .post-user-info{
                font-size:20px;
                font-weight:150;
            }
            body{
                background:url(image/show.jpg) ;
                background-size:cover;
                background-attachment: fixed;

            }
        </style>

     <div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v24.0&appId=APP_ID"></script>


    </head>
    <body>
        <!<!-- navbarstart -->


        <nav class="navbar navbar-expand-lg bg-dark  navbar-dark  primary-background">

            <div class="container-fluid">
                <a class="navbar-brand" href="index.jsp"> <span class="fa fa-asterisk" ></span>    Tech Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="profile_page.jsp"> <span class="fa fa-bell-o"  ></span>  Alpana</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span  class="fa fa-check-square-o" ></span> Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Programing Language</a></li>
                                <li><a class="dropdown-item" href="#">Project Implementation</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="#">Data structure</a></li>
                            </ul>
                        </li>


                        <li class="nav-item">
                            <a class="nav-link" href="#">  <span class="fa fa-address-card-o" ></span>  Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal">
                                <span class="fa fa-asterisk"></span> Do Post
                            </a>
                        </li>



                    </ul>
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#!"data-bs-toggle="modal" data-bs-target="#profile-model"   >  <span class="fa fa-user-circle " ></span> <%=user.getName()   %></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet">  <span class="fa fa-user-plus " ></span> logout</a>
                        </li>


                    </ul>
                </div>
            </div>
        </nav>


        <!<!-- navbar end -->


        <!<!--start  main content of body  -->

        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%=p.getPtitle()%> <h4>

                                    </div>
                                    <div class="card-body">


                                        <%
        String image = p.getPpic();
        if (image == null || image.trim().equals("")) {
            image = "default.png";  // agar image nahi hai to default use karo
        }
                                        %>


                                        <img class="card-img-top my-2" src="blog_pics/<%= image %>" alt="card img cap"
                                             style="width: 100%; height: 500px; object-fit: cover;">


                                        <div class="row">
                                            <div class="col-md-8">
                                                <%  UserDao dao= new UserDao(ConnectionProvider.getConnection());%>

                                                <p class="post-user-info"><a href="#!"> <%=dao.getUserByUserId(p.getUserId()).getName()%></a>has posted </p>
                                            </div>
                                            <div class="col-md-4">
                                                <p class="post-date"> <%=p.getPdate().toLocaleString()%> </p>
                                            </div>


                                        </div>

                                    </div>


                                    <p class="post-content"><%=p.getPcontent()%></p>
                                    <br>
                                    <br>
                                    <div class="post-code">
                                        <pre> <%= p.getPcod()%> </pre>
                                    </div>

                                    </div>
                                    <!--             <div class="card-footer primary-background ">
                                                                     
                                                        <a href="#!"  class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="Like-counter">10 </span> </a>
                                                            <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
                                                </div>-->


                                    <%
    LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
    boolean userLiked = likeDao.isLikedByuser(p.getPid(), user.getId());
    int totalLikes = likeDao.countLikeOnPost(p.getPid());
                                    %>

                                    <a href="#!"  
                                       class="btn btn-outline-light btn-sm like-btn <%= userLiked ? "liked" : "" %>" 
                                       data-postid="<%= p.getPid() %>" 
                                       data-uid="<%= user.getId() %>">
                                        <i class="fa <%= userLiked ? "fa-thumbs-up" : "fa-thumbs-o-up" %>"></i> 
                                        <span class="Like-counter"><%= totalLikes %></span>
                                    </a>



                                    </div>
                                    <div class="card-footer">
                                        <div class="fb-comments" data-href="http://localhost:8080/TechBloge/show_blog_page.jsp?post_id=<%= p.getPid() %>" data-width="" data-numposts="5"></div>
                                        
                                    </div>

                                    </div>
                                    </div>
                                    </div>

                                    <!<!-- end  main content of body -->


                                    <h1>going to  show single blog</h1>
                                    <h1>post_id: <%= postId %>   </h1>
                                    <!-- Modal -->
                                    <div class="modal fade" id="profile-model" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header  primary-background text-white text-center  ">
                                                    <h5 class="modal-title" id="staticBackdropLabel">TechBlog</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <div class="container text- center" >
                                                        <img src="<%= request.getContextPath() %>/pics/<%= user.getProfile() %>" 
                                                             class=" rounded-circle  mx-auto d-block  "
                                                             style="width: 120px; height: 120px; " 
                                                             alt="Profile Image">

                                                        <br>
                                                        <h5 class="modal-title text-center" id="staticBackdropLabel"><%= user.getName()%></h5>
                                                        <!<!-- deatils -->
                                                        <div  id="profile-details">
                                                            <table class="table">

                                                                <tbody>
                                                                    <tr>
                                                                        <th scope="row">ID:</th>
                                                                        <td><%= user.getId()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Email:</th>
                                                                        <td><%=user.getEmail() %></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Gender:</th>
                                                                        <td><%=user.getGender() %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Status:</th>
                                                                        <td><%=user.getAbout() %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th scope="row">Registered On:</th>
                                                                        <td><%=user.getDateTime().toString() %></td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <!<!-- profile Edite -->


                                                        <div id="profile-edit" style="display: none;">
                                                            <h1 class="mt-2">Please Edit Carefully..</h1>
                                                            <form action="EditServlet" method="post" enctype="multipart/form-data">
                                                                <table class="table">
                                                                    <tr>
                                                                        <td>ID:</td>
                                                                        <td><%= user.getId() %></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Email:</td>
                                                                        <td>
                                                                            <input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Name:</td>
                                                                        <td>
                                                                            <input type="text" class="form-control" name="user_name" value="<%= user.getName() %>">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Password:</td>
                                                                        <td>
                                                                            <input type="password" class="form-control" name="user_password" value="<%= user.getPassword() %>">
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Gender:</td>
                                                                        <td>  <%=user.getGender()%> </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>About:</td>
                                                                        <td><textarea  row="5" class="from-control" name="user_about"> <%=user.getAbout()%>  </textarea></td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td>New Profile:</td>
                                                                        <td> <input type="file" name="image" class="from-control"> </td>

                                                                    </tr>
                                                                </table>
                                                                <div class="container text-center">
                                                                    <button type="submit" class="btn btn-outline-primary" >Save</button>
                                                                </div>   



                                                            </form>
                                                        </div>


                                                    </div>  

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button id="edit-profile-button"  type="button" class="btn btn-primary">EDIT</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <!<!-- profile model end -->
                                    <!<!-- add post model -->

                                    <!-- Modal -->
                                    <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel">Provide The Post Details</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">

                                                    <form id="add-post-form"   action="PostServlet" method="post" enctype="multipart/form-data" >
                                                        <div class=" form-group">
                                                            <select class="form-control" name="cid">
                                                                <option selected disabled>..select category..</option>
                                                                <%
                                                                    PostDao post = new PostDao(ConnectionProvider.getConnection());
                                                                    ArrayList<Category> list = post.getAllCategories();

                                                                    for (Category c : list) {
                                                                %>
                                                                <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                                                                <%
                                                                    }
                                                                %>
                                                            </select>

                                                        </div>
                                                        <div class="form-group">
                                                            <input type ="text" name="ptitle" placeholder="Enter post title" class="form-control">
                                                        </div>
                                                        <div class="form-group">
                                                            <textarea class="form-control" name="pcontent" style="height:150px"  placeholder="Enter your Content"></textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <textarea class="form-control" name="pcode" style="height:150px"  placeholder="Enter your Progrma(if any)"></textarea>
                                                        </div>
                                                        <div class="form-group">
                                                            <label> Select your pic</label>
                                                            <br><!-- comment -->
                                                            <input type="file" name="pic">
                                                        </div>

                                                        <div class="container text-center">

                                                            <button type="submit" class="btn btn-outline-primary">post</button

                                                        </div>

                                                    </form> 


                                                </div>

                                            </div>
                                        </div>
                                    </div>





                                    <!<!-- end post model -->

                                    <!-- JavaScript -->

                                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                                            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                                    crossorigin="anonymous"></script>
                                    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                                    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


                                    <!--                 <script src="js/myjs.js"></script>-->
                                    <!-- bottom of showblog.jsp, before </body> -->
                                    <script src="<%=request.getContextPath()%>/js/myjs.js"></script>



                                    <script>

                                        $(document).ready(function () {
                                            let editStatus = false;
                                            $('#edit-profile-button').click(function () {
                                                //alert('button click');
                                                if (editStatus === false)
                                                {
                                                    $('#profile-details').hide();
                                                    $('#profile-edit').show();
                                                    editStatus = true;
                                                    $(this).text("Back");
                                                } else {
                                                    $('#profile-details').show();
                                                    $('#profile-edit').hide();
                                                    editStatus = false;
                                                    $(this).text("Edit");
                                                }
                                            });

                                        });
                                    </script>
                                    <!<!-- post js -->
                                    <script>

                                        $(document).ready(function () {
                                            // alert("loaded");

                                            $("#add-post-form").on("submit", function (event) {
                                                // This code gets called when form is submitted
                                                event.preventDefault();
                                                console.log("You have clicked the submit button");

                                                let form = new FormData(this);

                                                // Now requesting to servlet
                                                $.ajax({
                                                    url: "PostServlet",
                                                    type: "POST",
                                                    data: form,
                                                    success: function (data, textStatus, jqXHR) {
                                                        // success
                                                        console.log("Post submitted successfully:");
                                                        console.log(data);
                                                        if (data.toLowerCase().includes("done")) {
                                                            swal("Good job!", "saved succesfully", "success");
                                                        } else {
                                                            swal("Error", "somthing went wrong try again..", "error");
                                                        }
                                                    },
                                                    error: function (jqXHR, textStatus, errorThrown) {
                                                        // error
                                                        console.error("Error submitting post:", errorThrown);
                                                        swal("Error", "somthing went wrong try again...", "error");
                                                    },
                                                    processData: false,
                                                    contentType: false
                                                });
                                            });
                                        });
                                    </script>
                                    </body>
                                    </html>
