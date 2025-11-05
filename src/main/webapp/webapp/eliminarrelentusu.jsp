
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            String id = request.getParameter("id").toString();
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = cnx.createStatement();
               
                rs = sta.executeQuery("select * from relentusu where identusu='"+id+"';");
                if(rs.next()){
                    
                    sta.executeUpdate("delete from relentusu where identusu='"+id+"';");
                }else
                %><p>No fue posible eliminar el registro</p>
                <%
                rs.close();
                cnx.close();
                sta.close();
                
                response.sendRedirect("CRUDentrenadores.jsp");
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            %>

