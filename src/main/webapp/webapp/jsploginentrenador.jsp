

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            String usuario;
            String contraseña;
            int menu = 0;
            
            usuario = request.getParameter("user");
            contraseña = request.getParameter("contr");
            
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
            stat = con.createStatement();
            }catch(SQLException error){
            out.print(error.toString());
        }
        try{
        
        res = stat.executeQuery("select * from entrenador where usuarioentrenador='"+usuario+"' and contraseñaentrenador='"+contraseña+"';");
        
        if(res.next()){
           HttpSession sesion = request.getSession();
           sesion.setAttribute("usuario", usuario);
           sesion.setAttribute("contra", contraseña);
           int identrenador = res.getInt(1);
           sesion.setAttribute("identrenador", identrenador);
           response.sendRedirect("entrenadorprincipal.html");
                }
            else{
            res = stat.executeQuery("select * from entrenadortemporal where usuariotemp='"+usuario+"' and contraseñatemp='"+contraseña+"';");
                if(res.next()){
                    response.sendRedirect("espera.html");
                }else
                {
                    response.sendRedirect("error.html");
                }
        }
            }catch(SQLException error){
                out.print(error.toString());
            }
        
    %>
