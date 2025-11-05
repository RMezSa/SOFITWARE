
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;

            String eliminar = request.getParameter("eliminar");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = cnx.createStatement();
                
                rs = sta.executeQuery("select * from relcomusu where idusuario='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from relcomusu where idusuario='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from relresusu where idusuario='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from relresusu where idusuario='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from relentusu where idusuario='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from relentusu where idusuario='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from relplanusu where idusuario='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from relplanusu where idusuario='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from reldietausu where idusuario='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from reldietausu where idusuario='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from soporterespuesta where idusuario='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from soporterespuesta where idusuario='"+eliminar+"';");
                
                rs = sta.executeQuery("select * from usuario where idusuario='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from usuario where idusuario='"+eliminar+"';");
                
                rs.close();
                cnx.close();
                sta.close();
                
                response.sendRedirect("CRUDusuarios.jsp");
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            %>