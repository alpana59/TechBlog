<%@ page import="com.tech.blog.entties.Post" %>
<%@ page import="com.tech.blog.entties.User" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tech.blog.helper.ConnectionProvider" %>
<%@ page import="com.tech.blog.dao.PostDao" %>
<%@ page import="com.tech.blog.dao.LikeDao" %>

<%
    User uu = (User) session.getAttribute("currentUser");
    if(uu == null){
        response.sendRedirect("login.jsp");
        return;
    }
    LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
%>

<input type="hidden" id="currentUserId" value="<%= uu.getId() %>">

<div class="row">
<%
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = (cid == 0) ? d.getAllPost() : d.getPostByCatId(cid);

    if(posts.size() == 0){
%>
        <h3 class='display-3 text-center'>No post in this category</h3>
<%
        return;
    }

    for(Post p : posts){
        String image = p.getPpic();
        if(image == null || image.trim().equals("")) image = "default.png";

        boolean userLiked = ldao.isLikedByuser(p.getPid(), uu.getId());
        int totalLikes = ldao.countLikeOnPost(p.getPid());
        int userRating = ldao.getUserRating(p.getPid(), uu.getId());
        double avgRating = ldao.getAverageRating(p.getPid());
%>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top img-fluid" src="blog_pics/<%=image%>" alt="card img cap" style="max-height: 250px; object-fit: cover;">
            <div class="card-body">
                <b><%=p.getPtitle()%></b>
                <p><%=p.getPcontent()%></p>
                <pre><%=p.getPcod()%></pre>
            </div>
            <div class="card-footer primary-background text-center">

                <!-- Like Button -->
                <a href="#!" class="btn btn-outline-light btn-sm like-btn <%=userLiked ? "liked" : ""%>"
                   data-postid="<%=p.getPid()%>" data-uid="<%=uu.getId()%>">
                    <i class="fa <%=userLiked ? "fa-thumbs-up" : "fa-thumbs-o-up"%>"></i>
                    <span class="Like-counter"><%=totalLikes%></span>
                </a>

                <!-- User Star Rating -->
                <div class="star-rating" data-postid="<%=p.getPid()%>" data-rating="<%=userRating%>" style="display:inline-block; margin-left:10px;">
                    <% for(int i=1; i<=5; i++){ %>
                        <i class="fa <%= i <= userRating ? "fa-star" : "fa-star-o" %> star" data-value="<%=i%>" style="color:gold; cursor:pointer;"></i>
                    <% } %>
                </div>

                <!-- Average Rating Display -->
                <span style="color:white; margin-left:10px;">Avg: <%= String.format("%.1f", avgRating) %></span>

                <!-- Read More -->
                <a href="show_blog_page.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-light btn-sm">Read more..</a>

                <!-- Comment -->
                <a href="#!" class="btn btn-outline-light btn-sm">
                    <i class="fa fa-commenting-o"></i><span>20</span>
                </a>
            </div>
        </div>
    </div>
<%
    } // end for
%>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
$(document).ready(function(){

    // ========== LIKE BUTTON ==========
    $(document).on("click", ".like-btn", function () {
        let pid = $(this).data("postid");
        let uid = $(this).data("uid");
        const button = $(this);
        const counterSpan = button.find(".Like-counter");

        $.ajax({
            url: "LikeServlet",
            type: "POST",
            data: { uid: uid, pid: pid, operation: 'like' },
            success: function (data) {
                let response = data.trim();
                let count = parseInt(counterSpan.text()) || 0;

                if (response === "liked") {
                    count++;
                    button.addClass("liked");
                    button.find("i").removeClass("fa-thumbs-o-up").addClass("fa-thumbs-up");
                } else if (response === "disliked") {
                    count = count > 0 ? count - 1 : 0;
                    button.removeClass("liked");
                    button.find("i").removeClass("fa-thumbs-up").addClass("fa-thumbs-o-up");
                }
                counterSpan.text(count);
            },
            error: function () {
                console.log("Error in like/dislike AJAX");
            }
        });
    });

    // ========== STAR RATING ==========
    function updateStars(ratingDiv, rating){
        ratingDiv.find(".star").each(function(){
            let val = $(this).data("value");
            $(this).toggleClass("fa-star", val <= rating);
            $(this).toggleClass("fa-star-o", val > rating);
        });
    }

    // Hover effect
    $(document).on("mouseenter", ".star-rating .star", function(){
        const star = $(this);
        const ratingDiv = star.parent();
        const value = star.data("value");
        updateStars(ratingDiv, value);
    });

    $(document).on("mouseleave", ".star-rating", function(){
        const ratingDiv = $(this);
        const rating = ratingDiv.data("rating") || 0;
        updateStars(ratingDiv, rating);
    });

    // Click to rate
    $(document).on("click", ".star-rating .star", function(){
        const star = $(this);
        const ratingDiv = star.parent();
        const pid = ratingDiv.data("postid");
        const uid = $("#currentUserId").val();
        const rating = parseInt(star.data("value"));

        $.ajax({
            url: "RatingServlet",
            type: "POST",
            data: { pid: pid, uid: uid, rating: rating },
            success: function(res){
                res = res.trim();
                if(res === "success"){
                    ratingDiv.data("rating", rating);
                    updateStars(ratingDiv, rating);

                    // Update average rating display
                    $.ajax({
                        url: "RatingServlet",
                        type: "GET",
                        data: { pid: pid },
                        success: function(avg){
                            ratingDiv.next("span").text("Avg: " + parseFloat(avg).toFixed(1));
                        }
                    });
                } else {
                    console.log("Error saving rating");
                }
            },
            error: function(){
                console.log("Error in AJAX for rating");
            }
        });
    });

});
</script>
