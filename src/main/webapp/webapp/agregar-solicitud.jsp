
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
        String comentario = request.getParameter("comentario");  
        String idusuario = request.getParameter("idusuario");
        
        
        Connection conectar = null;
        Statement est = null;
        ResultSet res = null;
            
        int idsolicitud = 0;
        
        try{
            
            Class.forName("com.mysql.jdbc.Driver");
            conectar = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
            est = conectar.createStatement();
            
            est.execute("START TRANSACTION;");
            est.executeUpdate("insert into solicitudsoporte(descripcion) values('"+comentario+"');");
            res = est.executeQuery("SELECT LAST_INSERT_ID() as idsolicitud;");
            if(res.next()){
            idsolicitud = res.getInt("idsolicitud");
            }
            est.execute("COMMIT;");
            
            
            est.execute("insert into relsolsopousu(idusuario, idsolsoporte) values('"+idusuario+"','"+idsolicitud+"');");
            
            
            
            est.close();
            
            
            response.sendRedirect("soporteusuario.jsp");
            }catch(SQLException error){
                out.print(error.toString());
            }
        

%>