
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            
            String agregar = request.getParameter("agregar");
            String entrenador = request.getParameter("entrenador");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = cnx.createStatement();
                sta.executeUpdate("insert into relentusu (idusuario, identrenador) values ('"+agregar+"', '"+entrenador+"'); ");
               
                
                cnx.close();
                sta.close();
                
                response.sendRedirect("CRUDentrenadores.jsp");
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            
        %>
