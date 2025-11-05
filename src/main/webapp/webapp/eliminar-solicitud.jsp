
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <%
            Connection cnx = null;
            Statement sta = null;
            ResultSet rs = null;
            ResultSet rs2 = null;
            Connection cn = null;
            Statement st = null;
            
            String nombre = "", apellidos="", correo="", sexo="", usuario="", contraseña="";
            int peso= 0, altura= 0, experienciaentrenando= 0, experienciaasesorando= 0,edad= 0;
            
            String eliminar = request.getParameter("eliminar");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from entrenadortemporal where identrenadortemp='"+eliminar+"';");
                rs.next();
                sta.executeUpdate("delete from entrenadortemporal where identrenadortemp='"+eliminar+"';");
                rs.close();
                cnx.close();
                sta.close();
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            %>