
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            String eliminar = request.getParameter("eliminarentusu");
            String entrenador = request.getParameter("entrenador");
            int idrel =Integer.parseInt(request.getParameter("id"));
            
            String id;
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = cnx.createStatement();
               
                rs = sta.executeQuery("select identusu from relentusu where identusu='"+idrel+"' ;");
                if(rs.next()){
                sta.executeUpdate("delete from relentusu where identusu = '"+idrel+"';");
                }
                rs.close();
                cnx.close();
                sta.close();
                
                
                response.sendRedirect("CRUDentrenadores.jsp");
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            %>