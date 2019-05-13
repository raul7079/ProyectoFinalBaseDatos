<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="mipk.Sesionok"%><html>
<head>
<% 
//aquí pongo todo el código java que quiera que mi servidor ejecute.
String usuario=request.getParameter("usuario");
String pass=request.getParameter("pass");
if (usuario == null) usuario="";
if (pass == null) pass="";
boolean ok=false;
try {
	String aux=session.getAttribute("usuario").toString();
	ok=true;
} catch (Exception e) {
	ok=false;
}
if (!ok)
	if (usuario.equals("admin") && pass.equals("1357")) {
		//usuario correcto - Tengo que crearle un handler de sesion
		session.setAttribute("usuario",usuario);
		ok=true;
	}

%><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bienvenido</title>
<style type="text/css">
	body{
		margin: 0;
		padding: 0;
	}
	h1{
		text-align: center;		
	}
	h2{
		margin-left: 5%;
	}
	a{
		display: inline;
	}
	div{
		margin-left: 5%;
	}
	header{
		margin-top: 3%;
	}
	#centrar{
		text-align: center;
		margin-bottom: 5%;
	}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<% if (ok) { %>
<header></header>
<h1>Bienvenido <%=session.getAttribute("usuario") %></h1>
</header>
<h2>Sesión iniciada</h2>
<hr/>
<div>
<a class="btn btn-primary" type="button" href="verdatos.jsp">Acceder a los Datos</a>
<a class="btn btn-danger" type="button" href="cerrarsesion.jsp">Salir</a>
</div>
<% } else { 
	//AHORA PONGO EL HTML DE SESION INCORRECTA %>
<header><h1>Usuario y/o contraseña incorrectos.</h1></header>
<h2 id="centrar">Por favor, inténtelo de nuevo.</h2>
<div><a class="btn btn-danger" type="button" href="index.jsp">Volver</a></div>
<% } %>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>