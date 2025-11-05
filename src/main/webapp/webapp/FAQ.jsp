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
                
                int asignar = Integer.parseInt(request.getParameter("asignar"));
                
                    res = sta.executeQuery("select * from posiblefaq where idposiblefaq = '"+asignar+"';");
                    if(res.next()){
                    sta.execute("insert into faqs (pregunta, respuesta) values ('"+res.getString(2) +"','"+res.getString(3)+"');");
                    sta.execute("delete from posiblefaq where idposiblefaq = '"+asignar+"';");
                    }
                
                
                sta.close();
                con.close();
                res.close();
                response.sendRedirect("asignarfaqs.jsp");
           }
            catch(SQLException error){
                out.print(error.toString());
            }
%>