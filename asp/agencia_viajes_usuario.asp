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
		<h2> BÚSQUEDA DE VUELOS </h2> <br><br>

		Origen <br>
		<form name="vuelos" action="buscar_vuelos.asp" method="post">
			<select name="origen">
				<option value="0"> Todos los orienes </option>
					<%
						Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
						'Recorremos el Recordset
						do while not origen.EOF
							Response.write("<option value='" & origen("IDCIUDAD") & "'>" & origen("CIUDAD") & "</option>")
								'Nos desplazamos por el Recorset
						origen.MoveNext
						loop	
					%>
			</select>
			
		<br><br>
		Destino <br>
		
			<select name="destino">
				<option value="0"> Todos los destinos </option>
					<%
						Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
						'Recorremos el Recordset
						do while not destino.EOF
							Response.write("<option value='" & destino("IDCIUDAD") & "'>" & destino("CIUDAD") & "</option>")
								'Nos desplazamos por el Recorset
						destino.MoveNext
						loop	
					%>
			</select>
			<br><br><input type="submit" id="buscar" value="Buscar">
		</form>

		
	<section>
	
		<h2> CONSULTAR RESERVAS </h2>
		
		
			<form method = "post" action = "consultar_reservas.asp">

			ID de la Reserva: <input type = "text" name = "idreserva"><br>
			DNI: <input type ="text" name = "dni"><br><br>

			<input type = "submit" value = "Buscar"> <br><br>


		
	
	</section>
	
	</main>

</body>
</html>
