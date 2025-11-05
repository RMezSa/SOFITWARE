<%-- 
    Document   : planentrenamientosolicitado
    Created on : 18/05/2022, 08:06:34 PM
    Author     : Roberd
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/tablas.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href=''>
        <title>USUARIOS</title>
    </head>
    <body>
        <h1 align ="center">SOLICITUD DE PLANES DE ENTRENAMIENTO</h1>
        <table border ="1" width="600" align="center" class="table">
            <th colspan="13">Usuarios</th>
            
            <tr>
                <th>Id</th>
                <th>Usuario</th>
                <th>Grupo muscular</th>
                <th>Dias</th>
                <th>Objetivos</th>
                <th>Actividad</th>
                <th>Altura</th>
                <th>Peso</th>
                <th>Comentario</th>
                <th>Archivo</th>
                <th></th>
                <th></th>
                    
                
                
                
            </tr>
        
        
        <%
            HttpSession sesion = request.getSession();
            String identrenador = session.getAttribute("identrenador").toString();
            Connection con = null;
            Statement sta = null;
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                rs = sta.executeQuery("select usuario.idusuario, usuario.nombre,  detalles.grupomuscular, detalles.dias, detalles.objetivos, detalles.actividad, detalles.altura, detalles.peso, detalles.comentario, detalles.iddetalles, reldetusu.idreldetusu "
                                    + "from usuario, detalles, reldetusu, relentusu "
                                    + "where detalles.iddetalles= reldetusu.idreldetusu and reldetusu.idusuario = usuario.idusuario and relentusu.idusuario = usuario.idusuario and relentusu.identrenador= '"+identrenador+"'; ");//*/*/*/
                                            
                while(rs.next()){
                %>
                
                <tr>
                <form  enctype="multipart/form-data"  action="/nuevo" method="post">
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    <td><%= rs.getString(5)%></td>
                    <td><%= rs.getString(6)%></td>
                    <td><%= rs.getString(7)%></td>
                    <td><%= rs.getString(8)%></td>
                    <td><%= rs.getString(9)%></td>
                    <td><input type="file" name="respuesta" id="respuesta">
                    <input type="hidden" name="responder" id="responder" value="<%=rs.getInt(1)%>">
                    <input type="hidden" name="respondiendo" id="respondiendo" value="<%=rs.getInt(10)%>">
                    <%
                    String respondido = rs.getString(2);
                    %>
                    <input type="hidden" name="respondido" id="respondido" value="<%=respondido%>"></td>
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
        
        </table>
        <div class="regresar"  style="align-items: center;text-align: center; margin-top: 20px;">
            <a href="entrenadorprincipal.html">REGRESAR</a>
        </div>
    </body>
</html>
