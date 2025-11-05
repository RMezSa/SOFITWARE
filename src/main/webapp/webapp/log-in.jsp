
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <script>
    function miFuncion(){
               // document.getElementById("parrafo").innerHTML=
                        swal("Intenta de nuevo");
            }
            
            Swal.fire({
               icon: warning,
               background: '#000',
            });
    </script>    
    <%
            String clav;
            String contr;
            int menu = 0;
            
            clav = request.getParameter("user");
            contr = request.getParameter("contr");
            
        Connection con = null;
        Statement stat = null;
        ResultSet res = null;
        
        
        
        if(request.getParameter("iniciar") != null){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
            stat = con.createStatement();
            }catch(SQLException error){
            out.print(error.toString());
        }
        try{
        
        res = stat.executeQuery("select * from usuario where usuario='"+clav+"' and contraseña='"+contr+"';");
        
        if(res.next()){
            ////////////////////////a
           HttpSession sesion = request.getSession();
           sesion.setAttribute("usuario", clav);
            sesion.setAttribute("contra", contr);
            int sumas = 0;
            int pagar = 0;
            menu = 1;
            sesion.setAttribute("suma", sumas);
            sesion.setAttribute("spagar", pagar);
            sesion.setAttribute("men", menu);
                }
            else
                out.println("<script>miFuncion()</script>");
            }catch(SQLException error){
                out.print(error.toString());
            }
        
        try{
                 HttpSession sesion = request.getSession();
                res = stat.executeQuery("select usuario.idusuario from usuario where usuario.usuario = '"+clav+"' and contraseña = '"+contr+"';");
                if(res.next()){
                    int id = res.getInt("idusuario");
                    //Sesion para el id del usuario
                    sesion.setAttribute("id", id);
                  con.close();
                  stat.close();
                  res.close();
                  response.sendRedirect("conocenos2.html");
                  
                }
                else{
                    if(clav.equals("administrador") && contr.equals("administrador")){  
                        response.sendRedirect("indexadmin.html");
                    }else{
                    out.println("<script>");
                    out.println("alert('DATOS INCORRECTOS');"); 
                    out.println("</script>");
                    }
                }
            }catch(SQLException error){
            out.println(error.toString());
            }
        
        }
    %>
