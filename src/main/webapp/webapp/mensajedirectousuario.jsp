<%-- 
    Document   : mensajedirectousuario
    Created on : 22/05/2022, 04:22:34 PM
    Author     : Roberd
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/chats.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario = sesion.getAttribute("id").toString();
        %>
        
        <%
            
            Connection con = null;
            Statement sta = null;
            ResultSet rs = null;
            String entrenador = "";
            String entrenadorusuario = "";
            
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                
                rs = sta.executeQuery("select usuario.idusuario, entrenador.identrenador, relentusu.idusuario, relentusu.identrenador as entrenador, entrenador.usuarioentrenador "
                                    + "from usuario, entrenador, relentusu "
                                    + "where relentusu.idusuario = usuario.idusuario and usuario.idusuario = '"+usuario+"' "
                                    + "having relentusu.identrenador = entrenador.identrenador ; ");
                if(rs.next()){
                %>
                <div class="remit">
                    <h1>Entrenador: 
                    <%= rs.getString(5)%></h1>
                </div>    
                <div class="mensajes">
                <%
                    entrenador = rs.getString(4);
                    entrenadorusuario = rs.getString(5);
                    
                    }
                else{
                    out.println("<script>");
                    out.println("alert('Entrenador no asignado');"); 
                    out.println("</script>");
                    response.sendRedirect("conocenos2.html");
                    }       

                    rs = sta.executeQuery("select usuario.idusuario, entrenador.identrenador, mensaje.descripcion, mensaje.fecha, mensaje.envia, entrenador.usuarioentrenador "
                                    + "from usuario, entrenador, mensaje "
                                    + "where mensaje.idusuario = usuario.idusuario and usuario.idusuario = '"+usuario+"' and mensaje.identrenador = entrenador.identrenador "
                                    + "and entrenador.identrenador = '"+entrenador+"'; ");
                while(rs.next()){
                    String envia = rs.getString(5);
                    if(envia.equals("entrenador")){                
                        %>
                        <p><%= entrenadorusuario %>:</p>
                        <p>    <%= rs.getString(3)%></p>
                            <br>
                            
                        <%
                    }else{
                        if(envia.equals("usuario")){                
                        %>
                        <p> Tu:</p>
                        <p>    <%= rs.getString(3)%> </p>
                            <br>
                            
                        <%
                        }
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
                </div>
        
        <div class="formulario-comment">
            
            <form action="agregarmensaje.jsp" class="sign"method="post">
            
            <h1>INGRESE EL MENSAJE
            <br>
            <input type="text" class="comment" name="comentario" id="comentario" required="">
        
        <input type="hidden" name="idusuario" id="idusuario" value="<%=usuario%>">
        <input type="hidden" name="identrenador" id="identrenador" value="<%=entrenador%>">
        
        </h1>
        
        <input type="submit" class="button"  value="iniciar" name="iniciar">
        </form>
        </div>
    </body>
</html>