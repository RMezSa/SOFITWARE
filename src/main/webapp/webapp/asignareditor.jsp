<%-- 
    Document   : asignareditor
    Created on : 6/06/2022, 08:43:04 PM
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
        <h1 align ="center">SOLICITUDES</h1>
        <table border ="1" width="600" align="center" class="table">
            <th colspan="13">Entrenador</th>
            
            <tr>
                <th>Id</th>
                <th>Usuario</th>
                <th>Contraseña</th>
                <th>Tipo</th>
                
                
            </tr>
        
        
        <%
            
            Connection con = null;
            Statement sta = null;
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                String tipo = "ingeniero";
                rs = sta.executeQuery("select * from personalsoporte where personalsoporte.tipo = '"+tipo+"';");
                while(rs.next()){
                %>
                <tr>
                    <td><%= rs.getString(1)%></td>
                    <td><%= rs.getString(2)%></td>
                    <td><%= rs.getString(3)%></td>
                    <td><%= rs.getString(4)%></td>
                    
                    <td>
                        <a href="volvereditor.jsp?agregar=<%=rs.getString(1)%>">VOlVER EDITOR</a>
                    </td>
                    
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
            <a href="indexadmin.html">REGRESAR</a>
        </div>
    </body>
    
</html>
