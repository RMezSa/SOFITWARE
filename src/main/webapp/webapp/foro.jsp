<%-- Document : foro Created on : 19/11/2021, 05:07:32 PM Author : Roberd ⚠️ ADVERTENCIA DE SEGURIDAD: Este código
    contiene credenciales hardcodeadas y es vulnerable a SQL Injection. Proyecto académico desarrollado en 2022
    (Preparatoria - CECyT 9 IPN). NO usar en producción. Solo para fines educativos y de portafolio. Para ejecutar:
    Reemplazar 'YOUR_PASSWORD_HERE' con tu contraseña de MySQL. --%>

    <%@page import="java.sql.ResultSet" %>
        <%@page import="java.sql.SQLException" %>
            <%@page import="java.sql.DriverManager" %>
                <%@page import="java.sql.Statement" %>
                    <%@page import="java.sql.Connection" %>
                        <%@page contentType="text/html" pageEncoding="UTF-8" %>
                            <!DOCTYPE html>
                            <html>

                            <head>
                                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                <title>JSP Page</title>
                                <link rel='stylesheet' type='text/css' media='screen' href='../css/for.css'>
                            </head>

                            <body>
                                <header>
                                    <div class="container">

                                        <nav class="nav-main">

                                            <p class="font-title" data-text="FITSOFT">
                                                <a href="">FITSOFT</a>
                                            </p>

                                            <ul class="nav-menu">
                                                <div class="icon cancel-btn">
                                                    <i class="fas fa-times-circle"></i>
                                                </div>
                                                <li>
                                                    <a href="conocenos2.html">Conocenos</a>
                                                </li>
                                                <li>
                                                    <a href="#">Foro</a>
                                                </li>
                                                <li>
                                                    <a href="soporteusuario.jsp">Soporte</a>
                                                </li>

                                                <li>
                                                    <a href="log-out.jsp">Log-out</a>
                                                </li>

                                            </ul>

                                            <div class="icon menu-btn">
                                                <i class="fas fa-bars" style="color: darkgoldenrod;"></i>
                                            </div>


                                        </nav>
                                    </div>
                                </header>

                                <div class="banner">
                                    <section id="secf">
                                        <f2></f2>

                                    </section>
                                </div>

                                <div class="banner-area" id="sectiono">
                                    <section id="sec1">
                                        <div class="foro">
                                            <form action="agre-com.jsp" method="post">
                                                <textarea id="comment" class="comentar" name="coment" rows="8"
                                                    maxlength="65525" required="required"
                                                    placeholder="Escribir un comentario"></textarea>
                                                <input type="submit" name="submit" value="PUBLICAR" class="boton">
                                                <br>
                                            </form>
                                        </div>
                                    </section>
                                </div>

                                <br><br>


                                <link rel="stylesheet"
                                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
                                    integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w=="
                                    crossorigin="anonymous" />

                                <script>
                                    const body = document.querySelector("body");
                                    const navbar = document.querySelector(".nav-menu");
                                    const menuBtn = document.querySelector(".menu-btn");
                                    const cancelBtn = document.querySelector(".cancel-btn");

                                    menuBtn.onclick = () => {
                                        navbar.classList.add("show");
                                        menuBtn.classList.add("hide");
                                        body.classList.add("disabled");
                                    }
                                    cancelBtn.onclick = () => {
                                        body.classList.remove("disabled");
                                        navbar.classList.remove("show");
                                        menuBtn.classList.remove("hide");
                                    }
                                    window.onscroll = () => {
                                        this.scrollY > 20 ? navbar.classList.add("sticky") : navbar.classList.remove("sticky");
                                    }
                                </script>

                                <% Connection con=null; Statement stat=null; ResultSet res=null; Statement stat2=null;
                                    ResultSet res2=null; try{ Class.forName("com.mysql.jdbc.Driver"); // ⚠️ CONFIGURAR:
                                    Reemplazar YOUR_PASSWORD_HERE con tu contraseña de MySQL
                                    con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/SOFITWARE?useTimeZone=true&serverTimeZone=UTC&autoReconnect=true&useSSL=false","root","YOUR_PASSWORD_HERE");
                                    stat=con.createStatement(); stat2=con.createStatement(); }catch(SQLException error){
                                    out.print(error.toString()); } try{ res=stat.executeQuery("select usuario.usuario,
                                    comentario.descripcion, relcomusu.idcomentario, comentario.fecha,
                                    comentario.idcomentario "
                + " from usuario, comentario, relcomusu "
                + " where usuario.idusuario=relcomusu.idusuario and comentario.idcomentario=relcomusu.idcomentario;");
                                    if(res.next()){ while(res.next()){ %>

                                    <div class="respuestas">
                                        <ul class="list">
                                            <li>
                                                <div class="section2">
                                                    <div class="datos">
                                                        <p>
                                                            <%=res.getString(1)%>
                                                        </p>
                                                        <p>
                                                            <%=res.getString(4)%>
                                                        </p>
                                                    </div>
                                                    <div class="contenido">
                                                        <p>
                                                            <%=res.getString(2)%>
                                                        </p>
                                                    </div>
                                                    <div class="answer">

                                                        <!--           <i class="fas fa-thumbs-up"></i>
           <i class="fas fa-thumbs-down"></i>-->
                                                    </div>
                                                </div>

                                                <div class="section3">
                                                    <form action="agre-resp.jsp" method="post">
                                                        <input type="text" class="answer-text" id="contenido"
                                                            name="contenido">
                                                        <input type="hidden" id="dato" name="dato"
                                                            value="<%=res.getString(5)%>">
                                                        <% System.out.println(res.getString(5)); %>
                                                            <input type="submit" class="answer-button2" value="ENVIAR"
                                                                name="submit">
                                                    </form>
                                                </div>
                                                <% int comentarioid=Integer.parseInt(res.getString(5));
                                                    res2=stat2.executeQuery("select usuario.usuario,
                                                    respuesta.descripcionres, comentario.idcomentario,
                                                    respuesta.idrespuesta, comentario.fecha "
                            + " from usuario, comentario, respuesta, relcomres, relresusu, relcomusu "
                            + " where relcomres.idcomentario=comentario.idcomentario "
                            + " and respuesta.idrespuesta=relcomres.idrespuesta "
                            + " and comentario.idcomentario="+comentarioid+ " "
                            + " and relcomres.idcomentario="+comentarioid+ " "
                                    + " and usuario.idusuario=relresusu.idusuario "
                                    + " and relcomusu.idcomentario=comentario.idcomentario "
                                    + " and relresusu.idrespuesta=respuesta.idrespuesta;"); if(res2.next()){
                                                    while(res2.next()){ %>
                                                    <ol>
                                                        <li>
                                                            <div class="section4">
                                                                <div class="datos">
                                                                    <p>
                                                                        <%=res2.getString(1)%>
                                                                    </p>
                                                                    <p>
                                                                        <%=res2.getString(5)%>
                                                                    </p>
                                                                </div>
                                                                <div class="contenido">
                                                                    <p>
                                                                        <%=res2.getString(2)%>
                                                                    </p>
                                                                </div>

                                                            </div>
                                                        </li>
                                                    </ol>
                                                    <% } %>
                                            </li>
                                        </ul>
                                    </div>
                                    <% } } stat.close(); stat2.close(); res.close(); //res2.close(); con.close(); }
                                        else{ out.println("<script>alert('no')</script>");
                                        out.println("no");
                                        }
                                        }
                                        catch(SQLException error){
                                        out.print(error.toString());
                                        }
                                        %>
                            </body>

                            </html>