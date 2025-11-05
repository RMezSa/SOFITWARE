
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
        <h1 align ="center">FAQS</h1>
        <table border ="1" width="600" align="center"  class="table">            
            <tr>
                <th>Pregunta</th>
                <th>Respuesta</th>
            </tr>
        
            <tr>
                <td><p>¿De qué trata la aplicación?</p></td>
                <td><p>La función de este software es proporcionar ayuda mediante
planes alimenticios, planes de entrenamiento, proporcionados por
profesionistas especializados en el tema, para que las personas
puedan alcanzar sus objetivos y estar saludables.</p></td>
            </tr>
            
            <tr>
                <td><p>¿Qué diferencia hay de esta página a otras fitness?</p></td>
                <td><p>A comparación de otras páginas fitness, nosotros contamos con
una amplia comunidad, y planes no sólo para la estética humana,
sino para otro tipos de enfoques dentro del deporte de fuerza</p></td>
            </tr>
            
            <tr>
                <td><p>¿Qué hago si no me han asignado un entrenador?</p></td>
                <td><p>Si llevas menos de 24 hrs registrado en la aplicación es posible
que no se te haya asignado algún entrenador todavía, es por eso
que lo primero que debes de hacer es esperar a que se te asigne
uno, si después de un lapso de tiempo mayor a 48 horas no se te
ha asignado un entrenador es necesario mandar una solicitud de
soporte explicando la situación para que el responsable de la
asignación de entrenadores te asigne uno.</p></td>
            </tr>
            
            <tr>
                <td><p>¿Cómo puedo pedir ayuda a soporte técnico?</p></td>
                <td><p>En la parte de abajo de la página se encuentra “soporte técnico”,
la cual te llevará al módulo, en donde podrás presentar tu
problema y será atendido lo más pronto posible por el ingeniero de
soporte.</p></td>
            </tr>
            
            <tr>
                <td><p>¿Qué hago si no puedo registrarme?</p></td>
                <td><p>El problema más común en cuanto a no poder registrarse es que
alguno de los datos ingresados no es válido, por lo que si se tiene
éste problema lo más conveniente es intentar ingresar con datos
diferentes.</p></td>
            </tr>
            
            <tr>
                <td><p>¿Cómo subo un comentario al foro?</p></td>
                <td><p>Para comentar en el foro es necesario que tengas registrados tus
datos en la aplicación y que inicies sesión, posteriormente te
deberás dirigir al módulo “foro” en el cual estará habilitado un
espacio en el que puedes escribir el comentario y publicarlo en la
aplicación.</p></td>
            </tr><!-- comment -->
            
            <tr>
                <td><p>¿Se necesita mucho dinero para los planes alimenticios?</p></td>
                <td><p>La ventaja de nuestros planes, es que no es necesario una
cantidad exagerada de dinero para poder llevar a cabo tu
nutrición, nuestros profesionales adaptarán los planes acorde a
tus necesidades y posibilidades</p></td>
            </tr>
            
            <tr>
                <td><p>¿Qué métodos de pago existen?</p></td>
                <td><p>Por el momento sólo mediante una transacción al número de
cuenta que le es proporcionado una vez contrate su plan</p></td>
            </tr>
            <tr>
                <td><p>¿Es confiable la información que proporcionan los entrenadores?</p></td>
                <td><p>Buscamos lo mejor para nuestros usuarios, por lo tanto, todos los
entrenadores están certificados en el área la cual se han
especializado</p></td>
            </tr>
            <tr>
                <td><p>¿Existe alguna garantía al adquirir un plan?</p></td>
                <td><p>Si el trato con el entrenador o el plan no fue de tu agrado, puedes
solicitar una devolución en el módulo de soporte, la cual será
revisada y verificada para que en menos de 72 horas tengas
respuesta, en caso de ser aprobada, devolverá el 50% de tu
dinero</p></td>
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
                rs = sta.executeQuery("select * from faqs");
                while(rs.next()){
                %>
                <tr>
                     <form action="" method="post">
                    <td><p><%=rs.getString(2)%></p></td>
                    <td><p><%=rs.getString(3)%></p></td>
                
                    <td>
                        <a href="editar-faq.jsp?editar=<%=rs.getInt(1)%>">Editar</a>
                            <br>
                        <a href="eliminar-faq.jsp?eliminar=<%=rs.getString(1)%>">Eliminar</a>
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
            <a href="indexeditor.html">REGRESAR</a>
            <br>
            <a href="asignarfaqs.jsp">AGREGAR FAQ</a>
            <br>
            <a href="creafaqs.jsp">CREAR FAQ</a>
            
        </div>
    </body>
</html>
