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
		<h2> VUELOS DISPONIBLES </h2> <br><br>

		
		<%
	<!--	response.write(request.form("origen"))
	<!--	response.write(" ------ " & request.form("destino")) 
		
		id_recibido_origen=request.form("origen")
		id_recibido_destino=request.form("destino")
		%>
		
	
		
		
		
		
		<table border = 1>

		<tr><td> RESERVAR </td><td> IDVUELO </td><td> CIUDAD_ORIGEN </td><td> CIUDAD_DESTINO </td><td> FECHA </td><td> COMPANIA </td><td> IDAVION </td><td> AVION </td><td> N_PLAZAS </td><td> N_PLAZAS_DISPONIBLES </td><td> DURACION </td><td> PRECIO </td></tr>
		
<%	
	
		' COMPARAMOS LOS DATOS RECIBIDOS
		
		SentenciaSQL= "select * from LISTA_VUELOS_PRECIO2 where COMPANIA = 'Iberia' "  
		
		
		SQLTODO = "select * from LISTA_VUELOS_PRECIO where N_PLAZAS_DISPONIBLES > 0"
		<!-- where N_PLAZAS_DISPONIBLES > 0
		
		SQLPRUEBAA = "select CIUDAD from CIUDAD where IDCIUDAD = " & id_recibido_destino  <!--fUNCIONA-->
		SQLPRUEBAB = "select CIUDAD from CIUDAD where IDCIUDAD = 4"   <!--fUNCIONA-->
		SQLPRUEBAC = "select CIUDAD from CIUDAD where IDCIUDAD = 4 or IDCIUDAD = 1"  <!--fUNCIONA-->
		SQLPRUEBAD = "select CIUDAD from CIUDAD where IDCIUDAD = " & id_recibido_origen & "or IDCIUDAD = " & id_recibido_destino <!--fUNCIONA-->
		
		SQLPRUEBAORIGEN  = "select * from LISTA_VUELOS_PRECIO where N_PLAZAS_DISPONIBLES > 0 AND CIUDAD_ORIGEN  = (select CIUDAD from CIUDAD where IDCIUDAD = 2)" <!-- FUNCIONA
		
		SQLORIGEN  = "select * from LISTA_VUELOS_PRECIO where  N_PLAZAS_DISPONIBLES > 0 AND	CIUDAD_ORIGEN  = (select CIUDAD from CIUDAD where IDCIUDAD = " & id_recibido_origen & ")"
		SQLDESTINO  = "select * from LISTA_VUELOS_PRECIO where N_PLAZAS_DISPONIBLES > 0 AND	CIUDAD_DESTINO  = (select CIUDAD from CIUDAD where IDCIUDAD = " & id_recibido_destino & ")"
		
		SQLORIGENDESTINO  =  "select * from LISTA_VUELOS_PRECIO where N_PLAZAS_DISPONIBLES > 0 AND CIUDAD_ORIGEN  = (select CIUDAD from CIUDAD where IDCIUDAD = " & id_recibido_origen & ") and CIUDAD_DESTINO = (select CIUDAD from CIUDAD where IDCIUDAD = " &  id_recibido_destino & ")"
		
		If request.form("origen") = 0 and request.form("destino") = 0 then

				Set origen = Conexion.Execute(SQLTODO)
					'Recorremos el Recordset
				do while not origen.EOF
					Response.Write("<tr><td> <a href=reservar_vuelos.asp?idvuelo=" & origen("IDVUELO") & " > <b><font color=green> Yes </font></b> </a> </td><td>" & origen("IDVUELO") & "</td><td> " & origen("CIUDAD_ORIGEN") & "</td><td> " & origen("CIUDAD_DESTINO") & "</td><td> " & origen("FECHA") & "</td><td> " & origen("COMPANIA") & "</td><td> " & origen("IDAVION") & "</td><td> " & origen("AVION") & "</td><td> " & origen("N_PLAZAS") & "</td><td> " & origen("N_PLAZAS_DISPONIBLES") & "</td><td> " & origen("DURACION") & "</td><td> " & origen("PRECIO") & "</td></tr> ")
					'Nos desplazamos al siguiente registro del Recordset
					origen.MoveNext
				loop
					
		else if request.form("origen") <> 0 and request.form("destino") = 0 then
					
					Set origen = Conexion.Execute(SQLORIGEN)
						'Recorremos el Recordset
					do while not origen.EOF
						
						Response.Write("<tr><td> <a href=reservar_vuelos.asp?idvuelo=" & origen("IDVUELO") & " > <b><font color=green> Yes </font></b> </a> </td><td>" & origen("IDVUELO") & "</td><td> " & origen("CIUDAD_ORIGEN") & "</td><td> " & origen("CIUDAD_DESTINO") & "</td><td> " & origen("FECHA") & "</td><td> " & origen("COMPANIA") & "</td><td> " & origen("IDAVION") & "</td><td> " & origen("AVION") & "</td><td> " & origen("N_PLAZAS") & "</td><td> " & origen("N_PLAZAS_DISPONIBLES") & "</td><td> " & origen("DURACION") & "</td><td> " & origen("PRECIO") & "</td></tr> ")
					
						'Nos desplazamos al siguiente registro del Recordset
						origen.MoveNext
					loop
				
				<!-- 	Response.Write ("<tr><td>" & origen("CIUDAD") & "</td></tr> ")-->
						
		else if request.form("origen") = 0 and request.form("destino") <> 0 then
				
				Set origen = Conexion.Execute(SQLDESTINO)
					'Recorremos el Recordset
				do while not origen.EOF
					Response.Write("<tr><td> <a href=reservar_vuelos.asp?idvuelo=" & origen("IDVUELO") & " > <b><font color=green> Yes </font></b> </a> </td><td>" & origen("IDVUELO") & "</td><td> " & origen("CIUDAD_ORIGEN") & "</td><td> " & origen("CIUDAD_DESTINO") & "</td><td> " & origen("FECHA") & "</td><td> " & origen("COMPANIA") & "</td><td> " & origen("IDAVION") & "</td><td> " & origen("AVION") & "</td><td> " & origen("N_PLAZAS") & "</td><td> " & origen("N_PLAZAS_DISPONIBLES") & "</td><td> " & origen("DURACION") & "</td><td> " & origen("PRECIO") & "</td></tr> ")
					
					'Nos desplazamos al siguiente registro del Recordset
					origen.MoveNext
				loop
			
		
		else if request.form("origen") <> 0 and request.form("destino") <> 0 then

				Set origen = Conexion.Execute(SQLORIGENDESTINO)
					'Recorremos el Recordset
				do while not origen.EOF
					Response.Write("<tr><td> <a href=reservar_vuelos.asp?idvuelo=" & origen("IDVUELO") & " > <b><font color=green> Yes </font></b> </a> </td><td>" & origen("IDVUELO") & "</td><td> " & origen("CIUDAD_ORIGEN") & "</td><td> " & origen("CIUDAD_DESTINO") & "</td><td> " & origen("FECHA") & "</td><td> " & origen("COMPANIA") & "</td><td> " & origen("IDAVION") & "</td><td> " & origen("AVION") & "</td><td> " & origen("N_PLAZAS") & "</td><td> " & origen("N_PLAZAS_DISPONIBLES") & "</td><td> " & origen("DURACION") & "</td><td> " & origen("PRECIO") & "</td></tr> ")
					
				<!--	Response.Write ("<tr><td>" & origen("CIUDAD") & "</td></tr> ")
					'Nos desplazamos al siguiente registro del Recordset
					origen.MoveNext
				loop

		end if
		end if
		end if
		end if
		
			%>
				
				
			</table>
		
			
	
	</main>

</body>
</html>
