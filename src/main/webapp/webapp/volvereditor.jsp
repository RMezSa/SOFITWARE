<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;
            String tipo = "editor";
            
            String agregar = request.getParameter("agregar");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from personalsoporte where idpersonalsoporte='"+agregar+"';");
                if(rs.next()){
                sta.execute("update personalsoporte set tipo = '"+tipo+"' where idpersonalsoporte='"+agregar+"';");
                }
                rs.close();
                cnx.close();
                sta.close();
                response.sendRedirect("asignareditor.jsp");
                
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            
        %>
