<%-- 
    Document   : agre-com
    Created on : 19/11/2021, 08:27:08 PM
    Author     : Roberd
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession();
    int id = Integer.parseInt(sesion.getAttribute("id").toString());
    
    String comentario = request.getParameter("coment");
        
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
            java.util.Date date=new java.util.Date();
            java.sql.Date sqlDate=new java.sql.Date(date.getTime());
        stat.executeUpdate("insert into comentario (fecha, descripcion) values('"+sqlDate+"', '"+comentario+"');");
        res = stat.executeQuery("select idcomentario as id2 from comentario where comentario.descripcion = '"+comentario+"';");
        
        
        if(res.next()){
                
                int id2 = res.getInt("id2");
                stat.executeUpdate("insert into relcomusu(idusuario, idcomentario) values('"+id+"','"+id2+"');");
                stat.close();
                res.close();
                con.close();
                response.sendRedirect("foro.jsp");
                }else{
                    System.out.println("Nooooo");
                }
            }catch(SQLException error){
                out.print(error.toString());
            }
        
    
%>
