<!-- #include file=conexion.asp -->
<!-- #include file=seguridad.asp -->

<!DOCTYPE html>
<html>

<head>
	<title> Agencia de Viajes </title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
	<header>
		<section class="cabecera">
			<img class="logo" src="img/avion.png">
			<h1> AGENCIA DE VIAJES LAJARA </h1>
			<a class="admin" href="agencia_viajes_usuario.asp"> INICIO </a>
			<a class="admin" href="iniciar_sesion.asp"> ADMINISTRADOR </a>
		</section>
			
	</header>

	<main>
		<section>
				<h2> PÁGINA DE INICIO ADMINISTRADOR </h2> <br>
				<nav>
					<ul>
						<li><a href="agencia_viajes_administrador.asp"> LISTA </a></li>
						<li><a href="agencia_viajes_administrador_insert.asp"> AÑADIR  </a></li>
						<li><a href="agencia_viajes_administrador_update.asp"> EDITAR  </a></li>
						<li><a href="agencia_viajes_administrador_delete.asp"> ELIMINAR  </a></li>
					</ul>
				</nav>
			</section>
		<br>
	<section>
	
	<%
id_recibido=request.querystring("id")
'Eliminamos la Ciudad'
Set consulta = Conexion.Execute ("delete from CIUDAD where IDCIUDAD=" & id_recibido)

		response.write("La Ciudad se ha eliminado con exito")
		
		Conexion.Close
		Set Conexion = nothing
%>

</section>
</main>
</body>
</html>