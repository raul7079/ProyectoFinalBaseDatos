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
	form{
		margin-left: 5%;
	}
</style>
<script type="text/javascript">
function mostrar(id) {
    if (id == "parrafo") {
        $("#parrafo").show();
        $("#uno").hide();
    }

    if (id == "6" || id == "61" || id == "67" || id == "22") {
        $("#parrafo").hide();
        $("#uno").show();

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
<form action="verdatos.jsp" onChange="mostrar(this.value);">
Seleccione una opcion: 
<select name="nombre">
  <option value="6">Mara Boyle</option>
  <option value="61">Zira Stout</option>
  <option value="67">Chester Daniels</option>
  <option value="22">Darius Mccoy</option>
</select>
<input type="submit">
</form>
<br/>
<%

String idPaciente = request.getParameter("nombre");
String query="select idVisita, medicos.nombre, fechaVisita from visitaMedica join medicos on (visitaMedica.idMedico=medicos.idMedico) where idPaciente=" + idPaciente;
beanDB basededatos = new beanDB();
String [][] tablares = basededatos.resConsultaSelectA3(query);

%>
<p id="parrafo">Eliga una opcion</p>
<table id="uno" class="table">
<%
	%>
	  <thead class="thead-dark">
		<tr>
	 		<th scope="col">idVisita</th>
			<th scope="col">Nombre medico</th>
	 		<th scope="col">fechaVisita</th>
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