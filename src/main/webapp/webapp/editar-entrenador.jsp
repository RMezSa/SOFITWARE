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
            
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                
                int editar = Integer.parseInt(request.getParameter("editarentrenador"));
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                int peso = Integer.parseInt(request.getParameter("peso"));
                int altura = Integer.parseInt(request.getParameter("altura"));
                int exp1 = Integer.parseInt(request.getParameter("expentrenando"));
                int exp2 = Integer.parseInt(request.getParameter("expasesorando"));
                int edad = Integer.parseInt(request.getParameter("edad"));
                String correo = request.getParameter("correo");
                String sexo = request.getParameter("sexo");             

                sta.execute("update entrenador set nombre='"+nombre+"', apellidos='"+apellidos+"',  "
+ "peso='"+peso+"', altura='"+altura+"', experienciaentrenando='"+exp1+"', experienciaasesorando='"+exp2+"', edad='"+edad+"', correo='"+correo+"', "
+ "sexo='"+sexo+"' where entrenador.identrenador= '"+editar+"'");
            
                sta.close();
                
                con.close();
                
                response.sendRedirect("CRUDentrenadores.jsp");
           }
            catch(SQLException error){
                out.print(error.toString());
            }
%>