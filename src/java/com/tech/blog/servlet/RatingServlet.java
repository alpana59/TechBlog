package com.tech.blog.servlet;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RatingServlet")
public class RatingServlet extends HttpServlet {

    // ================== POST ========== (Save/Update rating) ==================
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            int pid = Integer.parseInt(request.getParameter("pid"));
            int uid = Integer.parseInt(request.getParameter("uid"));
            int rating = Integer.parseInt(request.getParameter("rating"));

            LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
            boolean success = ldao.saveOrUpdateRating(pid, uid, rating);

            out.println(success ? "success" : "error");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================== GET ========== (Fetch average rating) ==================
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            int pid = Integer.parseInt(request.getParameter("pid"));

            LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
            double avg = ldao.getAverageRating(pid); // post_rating table se fetch

            // NaN check
            if (Double.isNaN(avg)) {
                avg = 0.0;
            }

            out.println(avg);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(0.0);
        }
    }
}
