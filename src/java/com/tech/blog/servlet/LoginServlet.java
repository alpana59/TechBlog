





package com.tech.blog.servlet;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.tech.blog.dao.UserDao;
import com.tech.blog.entties.Massage;
import com.tech.blog.entties.User;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    // Apna Google Client ID yahan lagao
    private static final String CLIENT_ID = "510712017925-t2ptvhq0cktg8l1mlofcfrjrk8hge60m.apps.googleusercontent.com";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {

            // --------- Google Login Check ---------
            String idTokenString = request.getParameter("id_token");

            if (idTokenString != null && !idTokenString.isEmpty()) {
                try {
                    GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
                            new NetHttpTransport(),
                            JacksonFactory.getDefaultInstance())
                            .setAudience(Collections.singletonList(CLIENT_ID))
                            .build();

                    GoogleIdToken idToken = verifier.verify(idTokenString);

                    if (idToken != null) {
                        Payload payload = idToken.getPayload();
                        String name = (String) payload.get("name");
                        String googleEmail = payload.getEmail();

                        UserDao dao = new UserDao(ConnectionProvider.getConnection());
                        User user = dao.getUserByEmail(googleEmail);

                        if (user == null) {
                            // Google se new user, DB me insert karo
                            user = new User(name, googleEmail, "", "not-specified", "I am using TechBlog via Google Login", "default.png");
                            dao.saveUser(user);
                        }

                        HttpSession session = request.getSession();
                        session.setAttribute("currentUser", user);

                        response.sendRedirect("profile_page.jsp");
                        return;
                    } else {
                        Massage msg = new Massage("Invalid Google login token!", "error", "alert-danger");
                        HttpSession s = request.getSession();
                        s.setAttribute("msg", msg);
                        response.sendRedirect("login.html");
                        return;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    Massage msg = new Massage("Google Login Error: " + e.getMessage(), "error", "alert-danger");
                    HttpSession s = request.getSession();
                    s.setAttribute("msg", msg);
                    response.sendRedirect("login.jsp");
                    return;
                }
            }

            // --------- Normal Login ---------
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");

            UserDao userdao = new UserDao(ConnectionProvider.getConnection());
            User u = userdao.getUserBYEmailAnadPassword(userEmail, userPassword);

            if (u == null) {
                // login error
                Massage msg = new Massage("Invalid Details! Try with another", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", msg);
                response.sendRedirect("login.jsp");
            } else {
                HttpSession s = request.getSession();
                s.setAttribute("currentUser", u);
                response.sendRedirect("profile_page.jsp");
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}





//package com.tech.blog.servlet;
//
//
//import java.io.IOException;
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import java.sql.*;
//import com.tech.blog.helper.ConnectionProvider;
//
//
//import jakarta.servlet.annotation.WebServlet;
//
//// Google Login ke liye required imports
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
//import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier.Builder;
//import com.google.api.client.json.jackson2.JacksonFactory;
//import com.google.api.client.http.javanet.NetHttpTransport;
//
//import java.util.Collections;
//
//@WebServlet("/LoginServlet")
//public class LoginServlet extends HttpServlet {
//
//    private static final String CLIENT_ID = "510712017925-t2ptvhq0cktg8l1mlofcfrjrk8hge60m.apps.googleusercontent.com"; // <-- Yahan apna Google client ID paste karein
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//        throws ServletException, IOException {
//
//        String email = request.getParameter("email");
//        String password = request.getParameter("password");
//
//        // Agar request me "id_token" aata hai, to Google Login hua hai
//        String idTokenString = request.getParameter("id_token");
//
//        if (idTokenString != null && !idTokenString.isEmpty()) {
//            // Google Login ka process
//            try {
//                GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
//                        new NetHttpTransport(),
//                        JacksonFactory.getDefaultInstance())
//                        .setAudience(Collections.singletonList(CLIENT_ID))
//                        .build();
//
//                GoogleIdToken idToken = verifier.verify(idTokenString);
//
//                if (idToken != null) {
//                    Payload payload = idToken.getPayload();
//                    String name = (String) payload.get("name");
//                    String googleEmail = payload.getEmail();
//
//                    // Session me set karna
//                    HttpSession session = request.getSession();
//                    session.setAttribute("username", name);
//                    session.setAttribute("email", googleEmail);
//
//                    response.sendRedirect("ProfileServlet"); // Redirect after successful Google login
//                } else {
//                    // Invalid token
//                    response.sendRedirect("login.html?error=Invalid+Google+Login+Token");
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//                response.sendRedirect("login.html?error=Google+Login+Error");
//            }
//            return; // Google Login process complete, aage normal login process skip karein
//        }
//
//        // Normal email/password login ka process
//        try {
//            Connection con = ConnectionProvider.getConnection();
//
//            PreparedStatement pst = con.prepareStatement(
//                "SELECT * FROM users WHERE email = ? AND password = ?"
//            );
//            pst.setString(1, email);
//            pst.setString(2, password);
//
//            ResultSet rs = pst.executeQuery();
//
//            if (rs.next()) {
//                // Login successful
//                HttpSession session = request.getSession();
//                session.setAttribute("username", rs.getString("name")); // Optional
//                session.setAttribute("email", email);
//                response.sendRedirect("ProfileServlet");
//            } else {
//                // Login failed
//                response.sendRedirect("login.html?error=Invalid+email+or+password");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.sendRedirect("login.html?error=" + e.getMessage());
//        }
//    }
//}
//
//













///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package com.tech.blog.servlet;
//
//import com.tech.blog.dao.UserDao;
//import com.tech.blog.entties.Massage;
//import com.tech.blog.entties.User;
//import com.tech.blog.helper.ConnectionProvider;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
///**
// *
// * @author ALPANA KUMARI
// */
//public class LoginServlet extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet LoginServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            
//            // login 
//            //fatch  username and password from request
//            String userEmail=request.getParameter("email");
//            String userPassword=request.getParameter("password");
//            UserDao userdao=new UserDao(ConnectionProvider.getConnection());
//            User u=userdao.getUserBYEmailAnadPassword(userEmail,userPassword);
//            // login
//            if(u==null)
//            {
//                //login error
//                Massage msg=new Massage( "invalid Detail! try with another","error","alert-danger");
//                HttpSession s=request.getSession();
//                s.setAttribute("msg", msg);
//                 response.sendRedirect("login.jsp");
//                out.println("invalid deatail...");
//            }  
//            else{
//                HttpSession s=request.getSession();
//                s.setAttribute("currentUser", u);
//                response.sendRedirect("profile_page.jsp");
//                
//                
//            }
//            
//            
//            
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
