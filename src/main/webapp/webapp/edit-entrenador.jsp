<%-- 
    Document   : edit-entrenador
    Created on : 14/05/2022, 09:05:32 PM
    Author     : Roberd
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/tablas.css">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border ="1" width="600" align="center" class="table">
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
                <th></th>
                <th></th>
                
                
            </tr>
        <%
            String entrenador = request.getParameter("editarentrenador");
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                rs = sta.executeQuery("select * "
                                    + "from entrenador "
                                    + "where entrenador.identrenador = '"+entrenador+"';");
                while(rs.next()){
                %>
                <form action="" method="post">
                
                    
                    <td><%=rs.getString(1)%></td>
                    <td><input type="text" style="width: 100px" class="inputtype" id="nombre" name="nombre" value="<%=rs.getString(2)%>" required maxlength="10"></td>
                    <td><input type="text" style="width: 100px" class="inputtype" id="apellidos" name="apellidos" value="<%=rs.getString(3)%>" required maxlength="10"></td>
                    
                    <td><input type="number" style="width: 100px" class="inputtype" id="peso" name="peso" value="<%=rs.getInt(4)%>" required maxlength="10"></td>
                    <td><input type="number" style="width: 100px" class="inputtype" id="altura" name="altura" value="<%=rs.getInt(5)%>" required maxlength="10"></td>
                    <td><input type="number" style="width: 100px" class="inputtype" id="expentrenando" name="expentrenando" value="<%=rs.getInt(6)%>" required maxlength="10"></td>
                    <td><input type="number" style="width: 100px" class="inputtype" id="expasesorando" name="expasesorando" value="<%=rs.getInt(7)%>" required maxlength="10"></td>
                    <td><input type="number" style="width: 100px" class="inputtype" id="edad" name="edad" value="<%=rs.getInt(8)%>" required maxlength="10"></td>
                    
                    <td><input type="text" style="width: auto" class="inputtype" id="correo" name="correo" value="<%=rs.getString(9)%>" required maxlength="10"></td>
                    <td><input type="text" style="width: 100px" class="inputtype" id="sexo" name="sexo" value="<%=rs.getString(10)%>" required maxlength="10"></td>
                    <td><%=rs.getString(11)%></td>
                    <td><%=rs.getString(12)%></td>
                    
                     <td><input type="submit" name="enviar" class="button"  value="editar"></td>
                    
                
                </form>
                    
                <%
                    
                    if(request.getParameter("enviar") != null){
                        String id =  rs.getString(1);
                        String nombre = request.getParameter("nombre");
                        String apellidos = request.getParameter("apellidos");
                        String peso = request.getParameter("peso");
                        String altura = request.getParameter("altura");
                        String expentrenando = request.getParameter("expentrenando");
                        String expasesorando = request.getParameter("expasesorando");
                        String edad = request.getParameter("edad");
                        String correo = request.getParameter("correo");
                        String sexo = request.getParameter("sexo");
                        
                        sta.execute("update entrenador set nombre='"+nombre+"', entrenador.apellidos='"+apellidos+"',  "
                                    + "peso='"+peso+"', altura='"+altura+"', experienciaentrenando='"+expentrenando+"', experienciaasesorando='"+expasesorando+"', "
                                    + "edad='"+edad+"', correo='"+correo+"', sexo='"+sexo+"' "
                                    + "where identrenador = '"+id+"'; ");
                        
                        response.sendRedirect("CRUDentrenadores.jsp");
        
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
    </body>
</html>
