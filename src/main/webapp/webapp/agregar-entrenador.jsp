
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
            
            String agregar = request.getParameter("agregar");
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cnx = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                sta = cnx.createStatement();
                rs = sta.executeQuery("select * from entrenadortemporal where identrenadortemp='"+agregar+"';");
                rs.next();
                
                nombre = rs.getString(2);
                apellidos = rs.getString(3);
                peso = Integer.parseInt(rs.getString(4));
                altura = Integer.parseInt(rs.getString(5));
                experienciaentrenando= Integer.parseInt(rs.getString(6));
                experienciaasesorando = Integer.parseInt(rs.getString(7));
                edad = Integer.parseInt(rs.getString(8));
                correo = rs.getString(9);
                sexo = rs.getString(10);
                usuario = rs.getString(11);
                contraseña = rs.getString(12);
                
                
                sta.executeUpdate("delete from entrenadortemporal where identrenadortemp='"+agregar+"';");
                rs.close();
                cnx.close();
                sta.close();
                
                
            }
                catch(SQLException error){
                out.print(error.toString());
            }
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                
                cn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                st = cn.createStatement();
                st.executeUpdate("insert into entrenador(nombre,apellidos,peso,altura,experienciaentrenando,experienciaasesorando, edad, correo, sexo, usuarioentrenador, contraseñaentrenador) values('"+nombre+"','"+apellidos+"','"+peso+"','"+altura+"','"+experienciaentrenando+"','"+experienciaasesorando+"','"+edad+"','"+correo+"','"+sexo+"','"+usuario+"','"+contraseña+"');");
            
                cn.close();
                st.close();
                response.sendRedirect("solicitudentrenador.jsp");
                
            }catch(SQLException error){
                out.print(error.toString());
            }
        %>
