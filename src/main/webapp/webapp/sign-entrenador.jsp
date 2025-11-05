
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
        if(request.getParameter("registrar") != null){
        
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String usuariotemp = request.getParameter("usuario");
        String contratemp = request.getParameter("contra");
        int edad = Integer.parseInt(request.getParameter("edad"));
        int peso = Integer.parseInt(request.getParameter("edad"));
        int expasesor = Integer.parseInt(request.getParameter("expasesor"));
        int expentrenando = Integer.parseInt(request.getParameter("expentrenando"));
        int altura = Integer.parseInt(request.getParameter("altura"));
        String correo = request.getParameter("correo");
        String sexo = request.getParameter("sexo");
        
        
        Connection conectar = null;
        Statement est = null;
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conectar = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
        est = conectar.createStatement();
            }catch(SQLException error){
                out.println(error.toString());
            }
            
        try{
          est.executeUpdate("insert into entrenadortemporal(nombre,apellidos,peso,altura,experienciaentrenando,experienciaasesorando, edad, correo, sexo, usuariotemp, contraseñatemp) values('"+nombre+"','"+apellido+"','"+peso+"','"+altura+"','"+expentrenando+"','"+expasesor+"','"+edad+"','"+correo+"','"+sexo+"','"+usuariotemp+"','"+contratemp+"');");
            
            out.println("<script>swal('Bien','Registro Exitoso');</script>");
            conectar.close();
            est.close();
            response.sendRedirect("index.html");
            }catch(SQLException error){
                out.print(error.toString());
            }
        }
        %>
