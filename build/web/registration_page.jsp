

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registration_page</title>
        <!<!-- css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css">
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
  .banner-background {
    clip-path: polygon(30% 0%, 70% 0%, 100% 1%, 99% 100%, 66% 97%, 29% 96%, 1% 100%, 0 0);  
  }
</style>

    
        
    </head>
    <body> 
     <%@include file="normal_navbar.jsp" %>
     <main class="primary-background banner-background no-top-padding" style="min-height: 100vh;">
         <!<!--  <main class="primary-background p-5 pb-5 banner-background" style="min-height: 80vh;"> -->
           <div class="container-fluid px-0">
                <div class="col-md-4 offset-md-4 mt-5">

                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class=" fa fa-3x fa-user-circle"></span>
                            <br>
                            Register here
                            </div>
                        <div class="card-body">
                  <form id="reg-form"  action="RegServlet" method="post">
                      <div class="mb-3">
                          <label for="user_name" class="form-label">User Name</label>
                         <input   name="user-name"  type="text" class="form-control" id="user-name" aria-describedby="emailHelp" placeholder="Enter name">
                        
                       </div>
                      
                      <div class="mb-3">
                          <label for="exampleInputEmail1" class="form-label">Email address</label>
                         <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                       </div>
                      
                      
                      
                      
                      <div class="mb-3">
                       <label for="gender" >Select Gender</label>
                       <br>
                       <input type="radio" id="gender " name="gender" value="male">Male
                       <input type="radio" id="gender" name="gender" value="female">Female
                        </div>
                      
                      <div class="form-group">
                          <textarea  id="id" name="about"  class="form-control"  rows="5"  placeholder="Enter somthing about yourelf"></textarea>
                      </div>
                      
                      
                    <div class="mb-3">
                       <label for="exampleInputPassword1" class="form-label">Password</label>
                       <input  name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Enter password">
                      </div>
                      
                    <div class="mb-3 form-check">
                    <input   name="check"type="checkbox" class="form-check-input" id="exampleCheck1">
                          <label class="form-check-label" for="exampleCheck1">agree term and condition</label>
                       </div>
                      <br>
                      <div class="container text-center" id="loader" style="display:none;">
                          <span class="fa fa-refresh fa-spin fa-4x"> </span>
                          <h1> please wait..</h1>
                          
                      </div>
                      
                     <button id="subimt-btn" type="submit" class="btn btn-primary">Submit</button>
                     </form>
                            
                        </div>
                        <div class=" card-footer">
                            
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
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


            
    <script>
  $(document).ready(function () {
    console.log("loaded");

    $('#reg-form').on('submit', function (event) {
      event.preventDefault(); // ✅ spelling "event", not "evenet"

      let form = new FormData(this); // 
       $("#subimt-btn").hide();
       $("#loader").show();

      // Send data to RegServlet
      $.ajax({
        url: "RegServlet",
        type: "POST",
        data: form,
        processData: false,
        contentType: false,
        success: function (data, textStatus, jqXHR) {
          console.log(data);
          $("#subimt-btn").show();
       $("#loader").hide();
       if (data.trim() === 'don') {
    swal("Registered successfully! We are going to redirect you to the login page.")
        .then((value) => {
            window.location = "login.jsp";
        });
} else {
    swal(data);
}



       
       
          
        },
        error: function (jqXHR, textStatus, errorThrown) {
            $("#subimt-btn").show();
       $("#loader").hide();
             swal("somthing went wrong..try again");
              

          
        }
      });
    });
  });
</script>
        
    </body>
</html>
