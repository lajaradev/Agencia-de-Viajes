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
	
		<h2> CONSULTAR RESERVAS </h2>
		
		<table border = 1>

		<tr><td> CANCELAR </td><td> IDRESERVA </td><td> APELLIDOS </td><td> NOMBRE </td><td> NIF </td><td> IDVUELO </td><td> N_ASIENTOS </td></tr>
		<%

		id_reserva=request.form("idreserva")
		dni=request.form("dni")
			
		SQLRESERVA = "select * from RESERVA where NIF = " & dni & " AND IDRESERVA = " & id_reserva
		
			Set origen = Conexion.Execute(SQLRESERVA)
					'Recorremos el Recordset
				do while not origen.EOF
					Response.Write("<tr><td><a href=consultar_reservas_cancelar.asp?id=" & origen("IDRESERVA") & " > <b><font color=red> X </font></b> </a></td><td>" & origen("IDRESERVA") & "</td><td> " & origen("APELLIDOS") & "</td><td> " & origen("NOMBRE") & "</td><td> " & origen("NIF") & "</td><td> " & origen("IDVUELO") & "</td><td> " & origen("N_ASIENTOS") & "</td></tr> ")
					'Nos desplazamos al siguiente registro del Recordset
					origen.MoveNext
				loop
					
		
		%>
	
	</section>
	
	</main>

</body>
</html>
