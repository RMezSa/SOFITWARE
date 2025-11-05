

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            String usuario;
            String contraseña;
            
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
        
        res = stat.executeQuery("select * from personalsoporte where personalsoporte.usuario='"+usuario+"' and personalsoporte.contraseña='"+contraseña+"';");
        
        if(res.next()){
           HttpSession sesion = request.getSession();
           sesion.setAttribute("usuario", usuario);
           sesion.setAttribute("contra", contraseña);
           int idpersonal = res.getInt(1);
           sesion.setAttribute("idpersonal", idpersonal);
           if(res.getString(4).equals("editor")){
           response.sendRedirect("indexeditor.html");
           }else
               response.sendRedirect("indexingeniero.html");
           
                }
            else{
            
                    response.sendRedirect("error.html");
                }
        
            }catch(SQLException error){
                out.print(error.toString());
            }
        
    %>
