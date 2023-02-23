<!-- #include file=conexion.asp -->

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
		LISTA DE CIUDADES<br>
		<table border = 1>
			<%
				Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD, TASA_AEROPUERTO from CIUDAD order by IDCIUDAD")
					'Recorremos el Recordset
				do while not origen.EOF
					Response.Write ("<tr><td> <a href=agencia_viajes_administrador_update_formulario.asp?id=" & origen("IDCIUDAD") & " >" & origen("IDCIUDAD") &   "</a> </td><td> " & origen("CIUDAD") & "</td><td> " & origen("TASA_AEROPUERTO") & "</td></tr> ")
					'Nos desplazamos al siguiente registro del Recordset
					origen.MoveNext
				loop
			%>
		</table>
	</section>
</main>
</body>
</html>