<%-- 
    Document   : solicitudplanentrenamiento
    Created on : 17/05/2022, 08:16:22 PM
    Author     : Roberd
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="solicitud-entrenamiento.jsp" class="sign">
            
            
        <select name="grupomuscular" id="grupomuscular">
            <option value="">Seleccione el grupo muscular</option>
            <option value="alta">Pecho, hombros y tríceps. </option>
            <option value="media">Espalda, bíceps y abdominales. </option>
            <option value="baja">Isquiotibiales, cuádriceps, glúteos y cuádriceps. </option>
        </select>
            
        <select name="dias" id="dias">
            <option value="">Seleccione el numero de dias a la semana</option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
            
        <select name="objetivos" id="objetivos">
            <option value="">Objetivos</option>
            <option value="subir">Subir de peso</option>
            <option value="bajar">Bajar de peso</option>
            <option value="mantener">Mantener peso</option>
        </select>
            
        <select name="actividad" id="actividad">
            <option value="">Nivel de actividad</option>
            <option value="alto">Alto</option>
            <option value="medio">Medio</option>
            <option value="bajo">Bajo</option>
        </select>    
            
        <h1>Ingrese su peso
        <input type="number" name="peso" id="peso">  
        
        <h1>Ingrese su altura
        <input type="number" name="altura" id="altura">

        <h1>Ingrese alguna aclaración que considere necesaria
        <input type="text" name="comentario" id="comentario">
        
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("id").toString();
        %>
        <input type="hidden" name="idusuario" id="idusuario" value="<%=usuario%>">
        </h1>
        
        <input type="submit" class="button"  value="iniciar" name="iniciar">
        </form>
        
        
        <h1 align ="center"></h1>
        <table border ="1" width="600" align="center">
            <th colspan="13">Planes de entrenamiento asignados</th>
            
            <tr>
                <th>Entrenador</th>
                <th>Plan</th>
            </tr>
        
        
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
        <a href="conocenos2.html">REGRESAR</a>
        </table>
        
    </body>
</html>
