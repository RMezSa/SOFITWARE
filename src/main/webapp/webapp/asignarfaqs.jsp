
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tablas.css">
        <title>FAQS</title>
    </head>
    <body>
        <h1 align ="center">POSIBLES FAQS</h1>
        <table border ="1" width="600" align="center"  class="table">            
            <tr>
                <th>Pregunta</th>
                <th>Respuesta</th>
            </tr>

            
        <%
            
            Connection con = null;
            Statement sta = null;
            Statement sta2 = null;
            
            ResultSet rs = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = con.createStatement();
                sta2 = con.createStatement();
                rs = sta.executeQuery("select * from posiblefaq");
                while(rs.next()){
                %>
                <tr>
                     <form action="" method="post">
                    <td><p><%=rs.getString(2)%></p></td>
                    <td><p><%=rs.getString(3)%></p></td>
                
                    <td>
                        <a href="FAQ.jsp?asignar=<%=rs.getInt(1)%>">FAQ</a>
                    </td> 
                     </form>
                </tr>
                
                
                <%
                }
                
                sta.close();
                sta2.close();
                rs.close();
                con.close();
}
            catch(SQLException error){
                out.print(error.toString());
            }
        %>
        
        </table>
         <div class="regresar"  style="align-items: center;text-align: center; margin-top: 20px;">
            <a href="JSPeditor.jsp">REGRESAR</a>
        </div>
    </body>
</html>
