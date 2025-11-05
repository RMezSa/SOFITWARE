<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            Connection con = null;
            Statement sta = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                
                String pregunta = request.getParameter("comentario");
                String respuesta = request.getParameter("respuesta");
                
                    sta.execute("insert into faqs (pregunta, respuesta) values ('"+pregunta+"','"+respuesta+"');");
                
                sta.close();
                con.close();
                
                response.sendRedirect("creafaqs.jsp");
           }
            catch(SQLException error){
                out.print(error.toString());
            }
%>