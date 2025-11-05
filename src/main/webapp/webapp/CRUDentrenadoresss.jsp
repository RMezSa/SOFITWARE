<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" type="text/css" media="screen" href="" />
		<title>USUARIOS</title>
        <link rel="stylesheet" href="index.css">
        <link rel="stylesheet" href="tabla.css">
	</head>
	<body>
		<nav class="nav">
            <div class="logo">
                <img src="./IMG/Logo.jpg" alt="" class="logo">
            </div>
 
             <ul class="menu">
                 <li><a href="#">Incio</a></li>
                 <li><a href="#">Con�cenos</a></li>
                 <li><a href="#">DM</a></li>
                 <li><a href="#">Principal</a></li>
                 <li><a href="#">Log-in</a></li>
                 <li><a href="#">Sign-in</a></li>
             </ul>
 
         </nav>
        
        <h1 align="center">Entrenadores</h1>
        <div class="button__regresar">
            <a class="link__button" href="indexadmin.html">REGRESAR</a>
        </div>
		<div class="container__table">
            <table class="table__content" border="1">
                <tr>
                    <th class="style__table-head" colspan="6">Entrenador</th>
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
                rs = sta.executeQuery("select * from entrenador");
                while(rs.next()){
                %>
                
                <tr>
                    <th class="style__table-head" colspan="6">Datos Biometricos</th>
                </tr>
                <tr>
                    <th class="style__table">Id</th>
                    <th class="style__table">Nombre</th>
                    <th class="style__table">Apellidos</th>
                    <th class="style__table">Edad</th>
                    <th class="style__table">Correo</th>
                    <th class="style__table">Sexo</th>
                </tr>
    
                <tr>
                    <form action="" method="post">
                        <tr>
                            <td class="style__table-data"><%=rs.getString(1)%></td>
                            <td class="style__table-data"><%=rs.getString(2)%></td>
                            <td class="style__table-data"><%=rs.getString(3)%></td>
                            <td class="style__table-data"><%=rs.getInt(4)%></td>
                            <td class="style__table-data"><%=rs.getInt(5)%></td>
                            <td class="style__table-data"><%=rs.getInt(6)%></td>
                        </tr>
                    </form>
                </tr>
                    
                <tr>
                    <th class="style__table-head" colspan="6">Datos Generales</th>
                </tr>
                <tr>
                    <th class="style__table">Peso</th>
                    <th class="style__table">Altura</th>
                    <th class="style__table">Experiencia entrenando</th>
                    <th class="style__table">Asesoramiento</th>
                    <th class="style__table">Usuario</th>
                    <th class="style__table">Contrase�a</th>
                </tr>
    
                <tr>
                    <form action="" method="post">
                        <tr>
                            <td class="style__table-data"><%=rs.getInt(7)%></td>
                            <td class="style__table-data"><%=rs.getInt(8)%></td>
                            <td class="style__table-data"><%=rs.getString(9)%></td>
                            <td class="style__table-data"><%=rs.getString(10)%></td>
                            <td class="style__table-data"><%=rs.getString(11)%></td>
                            <td class="style__table-data"><%=rs.getString(12)%></td>
                        </tr>
                    </form>
                </tr>
    
            </table>
        </div>
            <div class="buttons">
                <div class="buttons__action"><a class="link__button" href="edit-entrenador.jsp?editarentrenador=<%=rs.getInt(1)%>">Editar</a></div>
                <div class="buttons__action"><a class="link__button" href="eliminar-entrenador.jsp?eliminar=<%=rs.getString(1)%>">Eliminar</a></div>
                <div class="buttons__action"><a class="link__button" href="usuarios-entrenador.jsp?consultar=<%=rs.getString(1)%>">Consultar</a></div>    
            </div>
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
	</body>
</html>