<%-- 
    Document   : soporteusuario
    Created on : 24/04/2022, 08:02:08 PM
    Author     : Roberd
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/soport.css">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: white;">
        <div class="formulario-comment">
        <form action="agregar-solicitud.jsp" class="sign">
            
            <h1 style="color: white">INGRESE EL PROBLEMA
            <br>
            <input type="text" class="comment" name="comentario" id="comentario">
        
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("id").toString();
        %>
        <input type="hidden" name="idusuario" id="idusuario" value="<%=usuario%>">
        </h1>
        
        <input type="submit" class="button"  value="iniciar" name="iniciar">
        </form>
        </div>
        
        <h1 align ="center" style="color: white">RESPUESTAS RECIBIDAS</h1>
        <div class="">
            <table  width="600" align="center" class="table"> 
            
                <thead>
            <tr>
                <th>COMENTARIO</th>
                <th>RESPUESTA</th>
            </tr>
                </thead>
        
        <%
            
            
            Connection con = null;
            Statement sta = null;
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                rs = sta.executeQuery("select usuario.idusuario, usuario.nombre, soporterespuesta.descripcionrespondida, soporterespuesta.descripcion, soporterespuesta.idusuario "
                                    + "from usuario, soporterespuesta "
                                    + "where soporterespuesta.idusuario = usuario.idusuario and usuario.idusuario = '"+usuario+"'; ");//*/*/*/
                                            /*QUITAR SOPORTERESPUESRA*/ /*QUITAR LO DEL NULL*/
                while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                </tr>
                
                <%
                }
                sta.close();
                rs.close();
                con.close();
            }
            catch(SQLException error){
                out.print(error.toString());
            }
        %>
        
        </table>
        </div>
        <div class"regresar" style="align-items: center;text-align: center; margin-top: 20px;">
        <a href="conocenos2.html" style="color: white">REGRESAR</a>
        </div>
    </body>
</html>

