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
		
	
	<%
	
id_recibido=request.querystring("id")

			'Eliminamos la reserva'
		<!--	Set consulta = Conexion.Execute ("delete from RESERVA where IDRESERVA=" & id_recibido)
		<!--	response.write("La Reserva se ha eliminado con exito")
		<!--	Conexion.Close
		<!--	Set Conexion = nothing
		
			'Actualizamos la reserva'
			
					
		'seleccionamos la reserva que tiene dicho id'
		Set consulta = Conexion.Execute("select * from RESERVA where IDRESERVA=" & id_recibido)
		
		id=consulta("IDRESERVA")
		apellido=consulta("APELLIDOS")
		nombre=consulta("NOMBRE")
		nif=consulta("NIF")
		idvuelo=consulta("IDVUELO")
		n_asientos=consulta("N_ASIENTOS")
		cancelado=consulta("CANCELADO")
		
		SQL_ACTUALIZAR = "Update RESERVA set CANCELADO = 1 where IDRESERVA=" & id
		
		Set consulta = Conexion.Execute (SQL_ACTUALIZAR)
		response.write("La Reserva se ha eliminado con exito")
		Conexion.Close
		Set Conexion = nothing
		
		
		
		
%>

</section>
</main>
</body>
</html>