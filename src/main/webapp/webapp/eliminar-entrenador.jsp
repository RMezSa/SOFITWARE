<%-- 
    Document   : eliminar-entrenador
    Created on : 16/05/2022, 07:32:47 PM
    Author     : Roberd
--%>
        
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            String eliminar = request.getParameter("eliminar");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = cnx.createStatement();
               
                rs = sta.executeQuery("select * from relentusu where identrenador='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from relentusu where identrenador='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from reldietaentr where identrenador='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from reldietaentr where identrenador='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from relplanentr where identrenador='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from relplanentr where identrenador='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from entrenador where identrenador='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from entrenador where identrenador='"+eliminar+"';");
                
                
                
                rs.close();
                cnx.close();
                sta.close();
                
                response.sendRedirect("CRUDentrenadores.jsp");
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            %>

