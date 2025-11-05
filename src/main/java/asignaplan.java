/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static java.io.FileDescriptor.out;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Roberd
 */
@WebServlet(urlPatterns = {"/asignaplan"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 10,      // 10 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)
public class asignaplan extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        Part filePart = request.getPart("respuesta");
        String nombrearchivo = filePart.getSubmittedFileName();
        for (Part part : request.getParts()) {
        part.write("C:\\CECyT 9\\5TO SEMESTRE\\Proyectos\\SOFITWARE5TO\\src\\main\\webapp\\files\\" + nombrearchivo);
        
         Connection con = null;
            Statement sta = null;
            ResultSet res = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
           }
           catch(SQLException e){
                e.printStackTrace();
            }
             catch (ClassNotFoundException ex) {   
                Logger.getLogger(asignaplan.class.getName()).log(Level.SEVERE, null, ex);
            }
         try{
        FileInputStream is = new FileInputStream("../files/nombrearchivo");
        PreparedStatement st = con.prepareStatement("insert into fotos plan(nombre, imagen)");
        st.setString(1, nombrearchivo);
        st.setBlob(2, is);
        st.execute();
        is.close();
        st.close();
         }catch(SQLException e){
                e.printStackTrace();
            }
        
    }
 
       response.getWriter().print("The file uploaded sucessfully.");
       response.sendRedirect("planentrenamientosolicitado.jsp");
}
}
