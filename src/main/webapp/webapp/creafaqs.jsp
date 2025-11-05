<%-- 
    Document   : soporteusuario
    Created on : 24/04/2022, 08:02:08 PM
    Author     : Roberd
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/soport.css">

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: white;">
        <div class="formulario-comment">
        <form action="inventafaq.jsp" class="sign">
            
            <h1 style="color: white">PREGUNTA
            <br>
            <input type="text" class="comment" name="comentario" id="comentario">
            
        
            <h1 style="color: white">RESPUESTA
            <br>
            <input type="text" class="comment" name="respuesta" id="respuesta">
            <br>
        <input type="submit" class="button"  value="iniciar" name="iniciar">
        </form>
        </div>

        
        </div>
        <div class"regresar" style="align-items: center;text-align: center; margin-top: 20px;">
        <a href="indexeditor.html" style="color: white">REGRESAR</a>
        </div>
    </body>
</html>

