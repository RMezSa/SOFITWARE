
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/tablas.css">
        <title>JSP Page</title>
    </head>
    <body>
        <table border ="1" width="600" align="center" class="table">
            <th colspan="13">Entrenador</th>
            
            <tr>
                <th>Pregunta</th>
                <th>Respuesta</th>
                <th></th>
                
                
            </tr>
        <%
            String editar = request.getParameter("editar");
            
            Connection cn = null;
            Statement est = null;
            ResultSet res = null;
            
           try{
                Class.forName("com.mysql.jdbc.Driver");
                cn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                est = cn.createStatement();
                res = est.executeQuery("select * from faqs "
                                    + "where faqs.idfaqs= '"+editar+"';");
                while(res.next()){
                %>
                <form action="" method="post">
                
                    
                    <td><%=res.getString(1)%></td>
                    <td><input type="text" style="width: 400px" class="inputtype" id="pregunta" name="pregunta" value="<%=res.getString(2)%>" required maxlength="200"></td>
                    <td><input type="text" style="width: 400px" class="inputtype" id="respuesta" name="respuesta" value="<%=res.getString(3)%>" required maxlength="200"></td>
  }                  
                    <div class="enviar">
                        <td><input type="submit" name="enviar" class="button"  value="editar"></td>
                    </div>
                
                </form>
                    
                <%
                    
                    if(request.getParameter("enviar") != null){
                        String pregunta = request.getParameter("pregunta");
                        String respuesta = request.getParameter("respuesta");
                        
                        est.execute("update faqs set pregunta='"+pregunta+"', respuesta='"+respuesta+"' "
                                    + "where idfaqs = '"+editar+"'; ");
                        
                        response.sendRedirect("JSPeditor.jsp");
        
                    }
                    }
                
                est.close();
                res.close();
                cn.close();
                
}
            catch(SQLException error){
                out.print(error.toString());
            }
        %>
        </table>
        <div class="regresar"  style="align-items: center;text-align: center; margin-top: 20px;">
            <a href="indexadmin.html">REGRESAR</a>
        </div>
    </body>
</html>
