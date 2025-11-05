<%-- 
    Document   : agre-resp
    Created on : 19/11/2021, 09:45:46 PM
    Author     : Roberd
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession();
    int id = Integer.parseInt(sesion.getAttribute("id").toString());
    
    String comentario = request.getParameter("dato");
    String contenido = request.getParameter("contenido");
    String submit = request.getParameter("submit");
    
    if(submit != null){
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
//            java.util.Date date=new java.util.Date();
//            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        stat.executeUpdate("insert into respuesta(descripcionres) values('"+contenido+"');");
        
        res = stat.executeQuery("select idrespuesta as id2 from respuesta where respuesta.descripcionres = '"+contenido+"';");
        
        
        if(res.next()){
            int id2 = res.getInt("id2");
                System.out.println(contenido + "SDFSDFSD");
                System.out.println(id2);
                
                stat.executeUpdate("insert into relresusu (idusuario, idrespuesta) values('"+id+"','"+id2+"');");
                
                stat.executeUpdate("insert into relcomres (idcomentario, idrespuesta) values('"+comentario+"','"+id2+"');");
                
                
                
                stat.close();
                res.close();
                con.close();
                response.sendRedirect("foro.jsp");        
        }else
            System.out.println(contenido + "NOOOO");
        
            }catch(SQLException error){
                out.print(error.toString());
            }
    }
    else{
    response.sendRedirect("foro.jsp");
    }
    
%>
