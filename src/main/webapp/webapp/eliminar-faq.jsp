
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
                
                rs = sta.executeQuery("select * from faqs where idfaqs='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from faqs where idfaqs='"+eliminar+"';");
                
                rs.close();
                cnx.close();
                sta.close();
                
                response.sendRedirect("JSPeditor.jsp");
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            %>