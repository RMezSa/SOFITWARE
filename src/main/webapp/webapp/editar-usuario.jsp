
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tablas.css">
        <title>JSP Page</title>
    </head>
    <body>
        <table border ="1" width="600" align="center" class="table">
            <th colspan="13">Entrenador</th>
            
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
            String usuario = request.getParameter("editarusuario");
            Connection con = null;
            Statement sta = null;
            
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                rs = sta.executeQuery("select * "
                                    + "from usuario "
                                    + "where usuario.idusuario= '"+usuario+"';");
                while(rs.next()){
                %>
                <form action="" method="post">
                
                    
                    <td><%=rs.getString(1)%></td>
                    <td><input type="text" style="width: 100px" class="inputtype" id="nombre" name="nombre" value="<%=rs.getString(2)%>" required maxlength="10"></td>
                    <td><%=rs.getString(3)%>
                    <td><%=rs.getString(4)%>
                    <td><input type="number" style="width: 100px" class="inputtype" id="edad" name="edad" value="<%=rs.getInt(5)%>" required maxlength="10"></td>
                    <td><input type="text" style="width: auto" class="inputtype" id="correo" name="correo" value="<%=rs.getString(6)%>" required maxlength="10"></td>
                    <td><input type="text" style="width: 100px" class="inputtype" id="sexo" name="sexo" value="<%=rs.getString(7)%>" required maxlength="10"></td>
                    
                    <div class="enviar">
                        <td><input type="submit" name="enviar" class="button"  value="editar"></td>
                    </div>
                
                </form>
                    
                <%
                    
                    if(request.getParameter("enviar") != null){
                        String id =  rs.getString(1);
                        String nombre = request.getParameter("nombre");
                        String edad = request.getParameter("edad");
                        String correo = request.getParameter("correo");
                        String sexo = request.getParameter("sexo");
                        
                        sta.execute("update usuario set nombre='"+nombre+"',  "
                                    + "edad='"+edad+"', correo='"+correo+"', sexo='"+sexo+"' "
                                    + "where idusuario = '"+id+"'; ");
                        
                        response.sendRedirect("CRUDusuarios.jsp");
        
                    }
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
