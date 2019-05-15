<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="objetoscrm.*"%>
<%
try {
	String aux=session.getAttribute("usuario").toString();
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}
%>
<html>
<head>
<title>Ver Datos</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style type="text/css">
	a{
		display: inline;
	}
	div{
		margin-left: 5%;
	}
	h1{
		text-align: center;		
	}
	select{
		dispay: inline;
		margin-top: 1%;
	}
</style>
<script type="text/javascript">
function mostrar(id) {
	
    if (id == "primera") {
        $("#primera").show();
        $("#segunda").hide();
        $("#tercera").hide();
        $("#cuarta").hide();
    }

    if (id == "segunda") {
        $("#primera").hide();
        $("#segunda").show();
        $("#tercera").hide();
        $("#cuarta").hide();
    }

    if (id == "tercera") {
        $("#primera").hide();
        $("#segunda").hide();
        $("#tercera").show();
        $("#cuarta").hide();
    }

    if (id == "cuarta") {
        $("#primera").hide();
        $("#segunda").hide();
        $("#tercera").hide();
        $("#cuarta").show();
    }
}
</script>
</head>
<body>
<h1><%=session.getAttribute("usuario") %>: Estos son los datos</h1>
<hr/>
<div>
<a class="btn btn-primary" type="button" href="bienvenido.jsp">Página principal</a>
<a class="btn btn-primary" type="button" href="insertdatos.jsp">Insertar Datos</a>
<a class="btn btn-danger" type="button" href="cerrarsesion.jsp">Salir</a>
</div>
<div>
<select id="status" name="status" onChange="mostrar(this.value);">
  <option>Seleccione una opcion</option>
  <option value="primera">Listado de todos los medicos</option>
  <option value="segunda">Listado de todas las habitaciones que estan en la primera planta</option>
  <option value="tercera">Listado de todos los pacientes</option>
  <option value="cuarta">Nombre y apellidos de los pacientes que visitaron al medico el dia 25 del mes de Mayo</option>
</select>
</div>
<br/>
<%

String query="select idMedico, nombre, apellidos from medicos";
beanDB basededatos = new beanDB();
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

<%

String query1="select numHabitacion, idPlanta from habitaciones where idPlanta = 1";
String [][] tablares1 = basededatos.resConsultaSelectA3(query1);

%>
<table id="segunda" style="display: none" class="table">
<%
	%>
	  <thead class="thead-dark">
		<tr>
			<th scope="col">numHabitacion</th>
	 		<th scope="col">idPlanta</th>
		</tr>
	</thead>
	<%
	for(int i = 0; i < tablares1.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares1[i][0] %> </td>
	 		<td> <%= tablares1[i][1] %> </td>
	 	</tr> <% 	 
	}
%>
</table>

<%

String query2="select idPaciente, nombre, apellidos, fechaNacimiento from pacientes";
String [][] tablares2 = basededatos.resConsultaSelectA3(query2);

%>

</table>

<table id="tercera" style="display: none" class="table">
<%
	%>
	  <thead class="thead-dark">
		<tr>
	 		<th scope="col">idPaciente</th>
			<th scope="col">nombre</th>
	 		<th scope="col">apellidos</th>
	 		<th scope="col">fechaNacimiento</th>
		</tr>
	</thead>
	<%
	for(int i = 0; i < tablares2.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares2[i][0] %> </td>
	 		<td> <%= tablares2[i][1] %> </td>
	 		<td> <%= tablares2[i][2] %> </td>
	 		<td> <%= tablares2[i][3] %> </td>
	 	</tr> <% 	 
	}
%>
</table>

<%

String query3="select nombre, apellidos from pacientes join visitaMedica on (pacientes.idPaciente=visitaMedica.idPaciente) where DAY(fechaVisita)=25";
String [][] tablares3 = basededatos.resConsultaSelectA3(query3);

%>

</table>

<table id="cuarta" style="display: none" class="table">
<%
	%>
	  <thead class="thead-dark">
		<tr>
			<th scope="col">nombre</th>
	 		<th scope="col">apellidos</th>
		</tr>
	</thead>
	<%
	for(int i = 0; i < tablares3.length; i++) {
		%>
		<tr>
	 		<td> <%= tablares2[i][1] %> </td>
	 		<td> <%= tablares2[i][2] %> </td>
	 	</tr> <% 	 
	}
%>
</table>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>