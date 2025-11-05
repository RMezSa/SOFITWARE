
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
        <h1 align ="center">Usuarios</h1>
        <table border ="1" width="600" align="center" class="table">
            <th colspan="13">Usuario</th>
            
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>Usuario</th>
                <th>Contraseña</th>
                <th>Edad</th>
                <th>Correo</th>
                <th>Sexo</th>
                <th></th>
                
                
            </tr>
        
        
        <%
            String entrenador = request.getParameter("entrenador");
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                sta2 = con.createStatement();
                rs = sta.executeQuery("select usuario.idusuario, usuario.nombre, usuario.usuario, usuario.contraseña, usuario.edad, usuario.correo, usuario.sexo, relentusu.idusuario, "
                                    + "case when relentusu.idusuario is null then 0 else 1 end as flag "
                                    + "from usuario "
                                    + "left join relentusu on usuario.idusuario = relentusu.idusuario "
                                    + "having flag = 0;");
                while(rs.next()){
                %>
                <tr>
                    <form action="" method="post">
                    <td><%=rs.getString(1)%></td>
                    <td><%=rs.getString(2)%></td>
                    <td><%=rs.getString(3)%></td>
                    <td><%=rs.getString(4)%></td>
                    <td><%=rs.getString(5)%></td>
                    <td><%=rs.getString(6)%></td>
                    <td><%=rs.getString(7)%></td>
                    <td><%=rs.getString(9)%></td>
                    
                   
                    
                    <td>
                        <a href="agregar-usuario.jsp?agregar=<%=rs.getString(1)%>&entrenador=<%=entrenador%>">Agregar</a>
                    </td>
                    </form>
                    
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
