/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entties.Massage;
import com.tech.blog.entties.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;

@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            // featch all data 
            String userEmail=request.getParameter("user_email");
            String  userName =request.getParameter("user_name");
            String userPassword=request.getParameter("user_password");
            String userAbout=request.getParameter("user_about");
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            // get the user from the session
            HttpSession  s=request.getSession();
            
            User user=(User)s.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);
            user.setProfile(imageName);
            // update
            UserDao userDao= new UserDao(ConnectionProvider.getConnection() );
            boolean ans=userDao.updateUser(user);
            if(ans){
                
                out.println("update to db");
                String path = getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
                    
                Helper.deleteFile(path);
                if(Helper.saveFile(part.getInputStream() ,path)){
                    out.println("profile updated");
                    
                     Massage msg=new Massage( "Profile Details  Updated....","success","alert-success");
                
                     s.setAttribute("msg", msg);
                 
               
                    
                }else{
                    Massage msg=new Massage( "Somthing went ","error","alert-error");
                
                     s.setAttribute("msg", msg);
                    
                }
                
                
            }
            else{
                out.println("not update to db");
                Massage msg=new Massage( "Somthing went wrong","error","alert-error");
                
                     s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile_page.jsp");
            
            
            
            
            out.println("</body>");
            out.println("</html>");
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
