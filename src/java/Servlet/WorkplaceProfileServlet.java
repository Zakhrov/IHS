/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Tanya
 */
@WebServlet(name = "WorkplaceProfileServlet", urlPatterns = {"/WorkplaceProfileServlet"})
public class WorkplaceProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
             Part filePart=request.getPart("file");
    //        String filename=filePart.getSubmittedFileName().substring(filePart.getSubmittedFileName().lastIndexOf("\\"), filePart.getSubmittedFileName().length());
            InputStream fileContent=filePart.getInputStream();
//            File upload_dir=new File("C:/Users/Tanya/Desktop/my project/uploads/");
//            File upload_file=new File(upload_dir,filename.substring(filename.lastIndexOf("\\"), filename.length()));
  //          File upload_file=new File(upload_dir,filename);
    //        Files.copy(fileContent, upload_file.toPath());
            try {
                HttpSession session=request.getSession();
                Class.forName("com.mysql.jdbc.Driver");
              Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/ihs", "root", "tanyabhardwaj");
      PreparedStatement AddPhoto=conn.prepareStatement("update workplace set workplace_photo=? where workplace_id=?");
      AddPhoto.setBlob(1, fileContent);
      AddPhoto.setInt(2, Integer.parseInt(session.getAttribute("workplace_id").toString()));
      AddPhoto.executeUpdate();
     
      
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(WorkplaceProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WorkplaceProfileServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WorkplaceProfileServlet at " + request.getContextPath() + "</h1>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(WorkplaceProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(WorkplaceProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
