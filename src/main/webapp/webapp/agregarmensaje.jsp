<%-- 
    Document   : agregarmensaje
    Created on : 22/05/2022, 05:17:10 PM
    Author     : Roberd
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
            String identrenador = request.getParameter("identrenador");
            String comentario = request.getParameter("comentario");  
            String idusuario = request.getParameter("idusuario");
            String envia = "usuario";
            java.util.Date date=new java.util.Date();
            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
            
        
        Connection conectar = null;
        Statement est = null;
        ResultSet res = null;
            
            
            
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conectar = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
            est = conectar.createStatement();
            
            est.executeUpdate("insert into mensaje(descripcion, identrenador, idusuario, envia, fecha) values('"+comentario+"', "
                    + " '"+identrenador+"','"+idusuario+"','"+envia+"','"+sqlDate+"' );");
            
            response.sendRedirect("mensajedirectousuario.jsp");
            
            
            
            est.close();
            res.close();
            
            }catch(SQLException error){
                out.print(error.toString());
            }
            
%>