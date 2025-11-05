
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
        <h1 align ="center">Clientes</h1>
        <table border ="1" width="600" align="center" class="table">
            <th colspan="13">Clientes</th>
            
            <tr>
                
                <th>Id</th>
                <th>Nombre</th>
                <th>Usuario</th>
                <th>
                    
                </th>
                
            </tr>
        
        
        <%
            HttpSession sesion = request.getSession();
            String identrenador = session.getAttribute("identrenador").toString();
            
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                sta2 = con.createStatement();
                rs = sta.executeQuery("select usuario.idusuario, usuario.nombre, usuario.usuario, relentusu.idusuario, entrenador.identrenador "
                                    + "from usuario, entrenador, relentusu "
                                    + "where usuario.idusuario = relentusu.idusuario and relentusu.identrenador = entrenador.identrenador and entrenador.identrenador= '"+identrenador+"';");
                while(rs.next()){
                %>
                <tr>
                    
                    <td><%=rs.getString(1)%>
                    <td><%=rs.getString(2)%>
                    <td><%=rs.getString(3)%>
                    
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
            <a href="entrenadorprincipal.html">REGRESAR</a>
        </div>
    </body>
</html>
