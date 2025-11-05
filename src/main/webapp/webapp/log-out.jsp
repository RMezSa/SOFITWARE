<%-- 
    Document   : log-out
    Created on : 19/11/2021, 08:05:28 PM
    Author     : Roberd
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate();
    String error = "Haz cerrado sesion";
    response.sendRedirect("conocenos.html");
%>
