<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="mipk.beanDB"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insertar Datos</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style type="text/css">
	a{
		display: inline;
	}
	div{
		margin-left: 5%;
		margin-top: 1%;
	}
	h1{
		text-align: center;		
	}
	form{
		margin-left: 5%;
		margin-top: 2%;
	}

</style>
<script type="text/javascript">
function ocultar(){
	document.getElementById('primera').style.display = 'table';
	}
</script>
</head>
<body>
<h1><%=session.getAttribute("usuario") %>: Aqui puede insertar Datos</h1>
<hr/>
<div>
<a class="btn btn-primary" type="button" href="bienvenido.jsp">P�gina principal</a>
<a class="btn btn-primary" type="button" href="verdatos.jsp">Ver datos</a>
<a class="btn btn-danger" type="button" href="cerrarsesion.jsp">Salir</a>
</div>
<form action="insertdatos.jsp">
  Id:
  <input type="number" name="id">
  
  Nombre:
  <input type="text" name="nombre">
  
  Apellidos:
  <input type="text" name="apellido">
  <br>
  <div>
  	<a type="button" class="btn btn-success">Enviar</a>
  	<a type="button" class="btn btn-success" onclick="ocultar()">Mostrar</a>
  </div>
</form>
<br>
<%
String query="select idMedico, nombre, apellidos from medicos";
String insert = "INSERT INTO medicos VALUES ("+request.getParameter("id")+","+request.getParameter("nombre")+","+request.getParameter("apellido")+")";
beanDB basededatos = new beanDB();
basededatos.insert(insert);
String [][] tablares = basededatos.resConsultaSelectA3(query);

%>
<table id="primera" style="display: none" class="table">
<%
	%>
	  <thead class="thead-dark">
		<tr>
	 		<th scope="col">idMedico</th>
			<th scope="col">Nombre</th>
	 		<th scope="col">Apellidos</th>
		</tr>
	</thead>
	<%
	for(int i = 0; i < tablares.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares[i][0] %> </td>
	 		<td> <%= tablares[i][1] %> </td>
	 		<td> <%= tablares[i][2] %> </td>
	 	</tr> <% 	 
	}
%>
</table>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>