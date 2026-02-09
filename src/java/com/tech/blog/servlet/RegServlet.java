/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;


import com.tech.blog.dao.UserDao;
import com.tech.blog.entties.User;
import com.tech.blog.helper.ConnectionProvider;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "RegServlet", urlPatterns = {"/RegServlet"})
@MultipartConfig
public class RegServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            // fetch all form data
            String check=request.getParameter("check");
            //out.println(check);
            if(check==null)
            {
                out.println("box not cheched");
            } 
            else{
                // other data  get
                String name=request.getParameter("user-name");
                String email=request.getParameter("user_email");
                String password=request.getParameter("user_password");
                String gender=request.getParameter("gender");
                String about=request.getParameter("about");
                //creat user object set all data to tha object
                User user=new User(name,email,password,gender,about);
                
                
                
                // creat userDao object
                UserDao dao=new UserDao(ConnectionProvider.getConnection());
                //save....
                 if(dao.saveUser(user))
                 {  
                     out.println("don");
                  }
                 else{
                     out.println("error");
                 }
                
            }
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
