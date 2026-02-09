//function doLike(pid, uid) {
//    const d = {
//        uid: uid,
//        pid: pid,
//        operation: 'like'
//    };
//
//    $.ajax({
//        url: "LikeServlet",
//        data: d,
//        success: function (data) {
//            console.log("Server Response: " + data);
//              if(data.trim()=='true')
//              {
//                  let c=$(".Like-counter").html();
//                  c++;
//                  $('.Like-counter').html(c);
//              }    
//            
//        },
//        error: function (jqXHR, textStatus, errorThrown) {
//            console.log("Error occurred: " + textStatus);
//        }
//    });
//}
// myjs.js
//$(document).ready(function() {
//    $(document).on("click", ".like-btn", function () {
//        let pid = $(this).data("postid");
//        let uid = $(this).data("uid");
//
//        const button = $(this);
//        const counterSpan = button.find(".Like-counter");
//
//        $.ajax({
//            url: "LikeServlet",
//            type: "POST",
//            data: { uid: uid, pid: pid, operation: 'like' },
//            success: function (data) {
//                let response = data.trim();
//                let count = parseInt(counterSpan.text()) || 0;
//
//                if (response === "liked") {
//                    count++;
//                    button.addClass("liked");
//                    button.find("i").removeClass("fa-thumbs-o-up").addClass("fa-thumbs-up");
//                } else if (response === "disliked") {
//                    count = count > 0 ? count - 1 : 0;
//                    button.removeClass("liked");
//                    button.find("i").removeClass("fa-thumbs-up").addClass("fa-thumbs-o-up");
//                }
//
//                counterSpan.text(count);
//            },
//            error: function () {
//                console.log("Error in like/dislike AJAX");
//            }
//        });
//    });
//});
$(document).ready(function() {

    // =================== LIKE BUTTON ===================
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

    // =================== STAR RATING ===================
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

                    // Update average rating
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
