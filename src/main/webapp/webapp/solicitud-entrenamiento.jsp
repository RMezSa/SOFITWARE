<%-- 
    Document   : solicitud-entrenamiento
    Created on : 17/05/2022, 08:30:26 PM
    Author     : Roberd
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
        String comentario = request.getParameter("comentario");
        String grupomuscular = request.getParameter("grupomuscular");
        String dias = request.getParameter("dias");
        String objetivos = request.getParameter("objetivos");
        String actividad = request.getParameter("actividad");
        String altura = request.getParameter("altura");
        String peso = request.getParameter("peso");
        
        String idusuario = request.getParameter("idusuario");
        
        
        Connection conectar = null;
        Statement est = null;
        ResultSet res = null;
            
        int iddetalles = 0;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conectar = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
            est = conectar.createStatement();
            
            est.execute("START TRANSACTION;");
            est.executeUpdate("insert into detalles(grupomuscular, dias, objetivos, actividad, altura, peso, comentario) "
                            + "values('"+grupomuscular+"', '"+dias+"', '"+objetivos+"', '"+actividad+"', '"+altura+"', '"+peso+"' "
                                    + ", '"+comentario+"');");
            res = est.executeQuery("SELECT LAST_INSERT_ID() as iddetalles;");
            if(res.next()){
            iddetalles = res.getInt("iddetalles");
            }
            est.execute("COMMIT;");
            
            est.execute("insert into reldetusu(idusuario, iddetalles) values('"+idusuario+"','"+iddetalles+"');");
            est.close();
            
            
            response.sendRedirect("soporteusuario.jsp");
            }catch(SQLException error){
                out.print(error.toString());
            }
        

%>