<%-- 
    Document   : editar-entrenador
    Created on : 22/04/2022, 07:14:09 PM
    Author     : Roberd
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            Connection con = null;
            Statement sta = null;
            ResultSet res = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                
                int responder = Integer.parseInt(request.getParameter("responder"));
                String respuesta = request.getParameter("respuesta");  
                String respondido = request.getParameter("respondido");
                int respondiendo = Integer.parseInt(request.getParameter("respondiendo")); 
                
                
                
                
                /*sta.execute("insert into soporterespuesta (descripcion, idusuario) values('"+respuesta+"','"+responder+"','"+respondiendo+"');");*/
                sta.execute("delete from relsolsopousu where idsolsoporte = '"+respondiendo+"';");
                sta.execute("delete from solicitudsoporte where idsolsoporte = '"+respondiendo+"';");
                sta.execute("insert into soporterespuesta (descripcionrespondida, descripcion, idusuario) values ('"+respondido+"','"+respuesta+"','"+responder+"');");
                sta.execute("insert into posiblefaq (pregunta, respuesta) values ('"+respondido+"','"+respuesta+"');");

                /*
                if(request.getParameter("faqs") != null){
                    sta.execute("insert into faqs (pregunta, respuesta) values ('"+respondido+"','"+respuesta+"');");
                }
                */
                
                sta.close();
                con.close();
                
                response.sendRedirect("soportesoftware.jsp");
           }
            catch(SQLException error){
                out.print(error.toString());
            }
%>