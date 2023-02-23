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
	
	<section>
<%
	idreserva=request.form("idreserva")
	apellido=request.form("apellido")
	nombre=request.form("nombre")
	dni=request.form("dni")
	idvuelo=request.form("idvuelo")
	num_asientos=request.form("num_asientos")
	cancelar=request.form("cancelar")
	
		
	
	SentenciaSQL = "insert into RESERVA values ("&idreserva&", '"&apellido&"', '"&nombre&"', "&dni&", "&idvuelo&", "&num_asientos&", "&cancelar&" )"
	
	SQL_PRECIO = "select PRECIO as precio_vuelo from LISTA_VUELOS_PRECIO where IDVUELO = " &idvuelo
	
	Set origen = Conexion.Execute(SentenciaSQL)
	
	Set origen = Conexion.Execute(SQL_PRECIO)
	precio_final = origen("precio_vuelo") * num_asientos
	
		
	
		response.write("<br> Se ha generado la reserva con exito")
		response.write("<br> Guarde su número de reserva: " & idreserva)
		response.write("<br> El precio total es: " & precio_final)
	
%>
	</section>
	
	
	<h2> VUELOS DE VUELTA </h2>
	
	
	<section>
	<table border = 1>

		<tr><td> RESERVAR </td><td> IDVUELO </td><td> CIUDAD_ORIGEN </td><td> CIUDAD_DESTINO </td><td> FECHA </td><td> COMPANIA </td><td> IDAVION </td><td> AVION </td><td> N_PLAZAS </td><td> N_PLAZAS_DISPONIBLES </td><td> DURACION </td><td> PRECIO </td></tr>
		
<%			
		
		SQLTODO = "select * from LISTA_VUELOS_PRECIO where N_PLAZAS_DISPONIBLES > 0"
		
		
		
		SQL_ID_ORIGEN ="select IDCIUDADORIGEN from VUELO where IDVUELO = " &idvuelo
		
		SQLORIGEN  = "select * from LISTA_VUELOS_PRECIO where CIUDAD_ORIGEN  = (select CIUDAD from CIUDAD where IDCIUDAD = (select IDCIUDADDESTINO from VUELO where IDVUELO =  " & idvuelo & " ))"
				
				Set origen = Conexion.Execute(SQLORIGEN)
					'Recorremos el Recordset
				do while not origen.EOF
					Response.Write("<tr><td> <a href=reservar_vuelos.asp?idvuelo=" & origen("IDVUELO") & " > <b><font color=green> Yes </font></b> </a> </td><td>" & origen("IDVUELO") & "</td><td> " & origen("CIUDAD_ORIGEN") & "</td><td> " & origen("CIUDAD_DESTINO") & "</td><td> " & origen("FECHA") & "</td><td> " & origen("COMPANIA") & "</td><td> " & origen("IDAVION") & "</td><td> " & origen("AVION") & "</td><td> " & origen("N_PLAZAS") & "</td><td> " & origen("N_PLAZAS_DISPONIBLES") & "</td><td> " & origen("DURACION") & "</td><td> " & origen("PRECIO") & "</td></tr> ")
					'Nos desplazamos al siguiente registro del Recordset
					origen.MoveNext
				loop
					
		
		
			%>
				
				
			</table>

				
				
	</section>
					
				
			
	
	</main>

</body>
</html>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</main>
</body>
</html>