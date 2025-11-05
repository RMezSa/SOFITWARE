
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tablas.css">
        <title>USUARIOS</title>
    </head>
    <body>
        <h1 align ="center">Entrenadores</h1>
        <table border ="1" width="700" align="center"  class="table">
            <th colspan="13">Entrenador</th>
            
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Peso</th>
                <th>Altura</th>
                <th>Experiencia
                    <br>
                    Entrenando</th>
                <th>Experiencia
                    <br>
                    Asesorando</th>
                <th>Edad</th>
                <th>Correo</th>
                <th>Sexo</th>
                <th>Usuario</th>
                <th>Contraseña</th>
                <th>Acciones </th>
                
                
            </tr>
        
        
        <%
            
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                sta2 = con.createStatement();
                rs = sta.executeQuery("select * from entrenador");
                while(rs.next()){
                %>
                
                <tr>
                    
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getInt(4)%></td>
                    <td><%=rs.getInt(5)%></td>
                    <td><%=rs.getInt(6)%></td>
                    <td><%=rs.getInt(7)%></td>
                    <td><%=rs.getInt(8)%></td>
                    <td><%=rs.getString(9)%></td>
                    <td><%=rs.getString(10)%></td>
                    <td><%=rs.getString(11)%>
                    <td><%=rs.getString(12)%>
                    
                    <td>
                        <a href="edit-entrenador.jsp?editarentrenador=<%=rs.getInt(1)%>">
                            Editar
                        </a>
                        <a href="eliminar-entrenador.jsp?eliminar=<%=rs.getString(1)%>">Eliminar</a>
                        <a href="usuarios-entrenador.jsp?consultar=<%=rs.getString(1)%>">Consultar</a>
                        
                    </td>
                    
                    
                </tr>
                
                
                <%
                }
                
                sta.close();
                sta2.close();
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
