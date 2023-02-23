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
		<h2> RESERVAR VUELO </h2> <br><br>
		
		<%
			'calculamos el ultimo IDRESERVA introducido
			Set consulta = conexion.Execute("select max(IDRESERVA) as ultimo_id from RESERVA")
			sig_id = consulta("ultimo_id") + 1
		%>
		
		<%
			id_vuelo_recibido=request.querystring("idvuelo")
		%>

	<form name="hacer_reserva" action="reservar_vuelos_exito.asp" method="post">

		<table>
			<tr><td> ID Reserva: </td><td> <input type="text" name="idreserva" readonly value= <% response.write(sig_id) %> ></td></tr>
			<tr><td> Apellido: </td><td> <input type="text" name="apellido"></td></tr>
			<tr><td> Nombre: </td><td> <input type="text" name="nombre"></td></tr>
			<tr><td> DNI: </td><td> <input type="text" name="dni"></td></tr>
			<tr><td> ID Vuelo: </td><td> <input type="text" name="idvuelo" readonly value= <% response.write(id_vuelo_recibido) %>></td></tr>
			<tr><td> Num. asientos: </td><td> <input type="text" name="num_asientos"></td></tr>
			<tr><td> Cancelar: </td><td> <input type="text" name="cancelar" readonly value= 0 ></td></tr>
	

			<tr><td colspan=2><center><input type="submit" id="reservas" value="Confirmar Reserva"/></center></td></tr>
		</table>
	</form>
	</main>
</body>
</html>