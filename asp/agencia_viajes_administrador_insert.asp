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
	
	
<br><br>AÑADIR CIUDADES<br>

		<%
			'calculamos el ultimo ID de Ciudad introducido
			Set consulta = conexion.Execute("select max(IDCIUDAD) as ultimo_id from CIUDAD")
			sig_id = consulta("ultimo_id") + 1
		%>

	<form name="anadir_ciudad" action="agencia_viajes_administrador_insert_exito.asp" method="post">

		<table>
			<tr><td> Codigo Ciudad: </td><td> <input type="text" name="idciudad" readonly value= <% response.write(sig_id) %> ></td></tr>
			<tr><td> Ciudad: </td><td> <input type="text" name="ciudad"></td></tr>
			<tr><td> Tasa Aeropuerto: </td><td> <input type="text" name="tasa_aeropuerto"></td></tr>

			<tr><td colspan=2><center><input type="submit" id="introducir_ciudad" value="Introducir Ciudad"/></center></td></tr>
		</table>
	</form>
	</main>
</body>
</html>