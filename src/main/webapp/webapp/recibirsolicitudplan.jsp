<%-- 
    Document   : recibirsolicitudplan
    Created on : 17/05/2022, 08:28:40 PM
    Author     : Roberd
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href=''>
        <title>SOLICITUDES DE PLAN DE ENTRENAMIENTO</title>
    </head>
    <body>
        <h1 align ="center">Soporte Tecnico</h1>
        <table border ="1" width="600" align="center">
            <th colspan="13">Usuarios</th>
            
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Correo</th>
                <th>Descripcion</th>
                
                
                
            </tr>
        
        
        <%
            
            Connection con = null;
            Statement sta = null;
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                rs = sta.executeQuery("select usuario.idusuario, usuario.nombre, usuario.correo, solicitudsoporte.descripcion, solicitudsoporte.idsolsoporte, relsolsopousu.idsolsopousu "
                                    + "from usuario, solicitudsoporte, relsolsopousu "
                                    + "where solicitudsoporte.idsolsoporte = relsolsopousu.idsolsoporte and relsolsopousu.idusuario = usuario.idusuario; ");//*/*/*/
                                            /*QUITAR SOPORTERESPUESRA*/ /*QUITAR LO DEL NULL*/
                while(rs.next()){
                %>
                
                <tr>
                <form action="responder-soporte.jsp" method="post">
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    
                    <th><textarea autofocus="" name="respuesta" id="respuesta"></textarea></th>
                    
                    <td><input type="hidden" name="responder" id="responder" value="<%=rs.getInt(1)%>"></td>
                    <input type="hidden" name="respondiendo" id="respondiendo" value="<%=rs.getInt(5)%>">
                    <%
                    /*String responder = request.getParameter("textarea");*/
                    String respondido = rs.getString(4);
                    
                    %>
                    <input type="hidden" name="respondido" id="respondido" value="<%=respondido%>">
                    <td><input type="submit" class="button"  value="iniciar" name="iniciar"></td>
                </form>
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
        <a href="indexadmin.html">REGRESAR</a>
        </table>
    </body>
</html>
