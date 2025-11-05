<%-- 
    Document   : asignar-entrenamiento
    Created on : 18/05/2022, 09:23:21 PM
    Author     : Roberd
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
            Part archivo = request.getPart("respuesta");
            String nombrearchivo = filePart.getSubmittedFileName();
            
            Connection con = null;
            Statement sta = null;
            ResultSet res = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
           }
            catch(SQLException error){
                out.print(error.toString());
            }
%>