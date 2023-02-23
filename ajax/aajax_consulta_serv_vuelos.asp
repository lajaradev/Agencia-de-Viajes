<!-- #include file=conexion.asp -->
	<%
	' Script ASP programado con VBScript
	' Realiza consulta en la base de datos y genera como resultato una lista de vuelos en formato XML on Error Resume Next
	' Accedemos al compañía enviado desde la pagina principal
	
	origen=request.form("origen")
'	destino=request.form("destino")
'	origen=2
	destino=4
	
	' El contenido a devolver es XML
	response.ContentType="text/xml"
	response.CacheControl="no-cache, must-revalidate"
	
	' Consulta SQL de las ciudades que son origen de algun vuelo
		
	SentenciaSQL = "Select IDVUELO,IDCIUDADORIGEN,IDCIUDADDESTINO,FECHA,IDCOMPANIA,IDAVION,DURACION,N_PLAZAS_DISPONIBLES from VUELO where IDCIUDADORIGEN= " & origen & "and IDCIUDADDESTINO = " & destino 
	Set rs = Conexion.Execute(SentenciaSQL)
	
	<!--	If request.form("origen") = 0  and request.form("destino") = 0 then--!>
	<!--			SQLTODO = "Select IDVUELO,IDCIUDADORIGEN,IDCIUDADDESTINO,FECHA,IDCOMPANIA,IDAVION,DURACION,N_PLAZAS_DISPONIBLES from VUELO"--!>
	<!--			Set rs = Conexion.Execute(SQLTODO)--!>
								
	<!--	else if request.form("origen") <> 0 and request.form("destino") = 0 then--!>
	<!--			SQLORIGEN = "Select IDVUELO,IDCIUDADORIGEN,IDCIUDADDESTINO,FECHA,IDCOMPANIA,IDAVION,DURACION,N_PLAZAS_DISPONIBLES from VUELO where IDCIUDADORIGEN=" & origen	--!>
	<!--			Set rs = Conexion.Execute(SQLORIGEN)--!>
		
	<!--	else if request.form("origen") = 0 and request.form("destino") <> 0 then--!>
	<!--			SQLDESTINO = "Select IDVUELO,IDCIUDADORIGEN,IDCIUDADDESTINO,FECHA,IDCOMPANIA,IDAVION,DURACION,N_PLAZAS_DISPONIBLES from VUELO where IDCIUDADDESTINO=" & destino	--!>
	<!--			Set rs = Conexion.Execute(SQLDESTINO)--!>
		
	<!--	else if request.form("origen") <> 0 and request.form("destino") <> 0 then--!>
	<!--			SQLORIGENDESTINO = "Select IDVUELO,IDCIUDADORIGEN,IDCIUDADDESTINO,FECHA,IDCOMPANIA,IDAVION,DURACION,N_PLAZAS_DISPONIBLES from VUELO where IDCIUDADORIGEN= " & origen & "and IDCIUDADDESTINO = " & destino--!>
	<!--			Set rs = Conexion.Execute(SQLORIGENDESTINO)--!>
					
	<!--	end if--!>
	<!--	end if--!>
	<!--	end if--!>
	<!--	end if--!>
		
			
	
	
	
	
	
	
	' Se genera una salida XML con la lista de vuelos
	if (not(rs.Eof)) then
				
	%><?xml version="1.0" encoding="utf-8"?><XML><%
			
			'recorremos el recordset
			do until rs.Eof
			
			response.write("<vuelo>")
			
			response.write("<idvuelo>")
			response.write( rs ("IDVUELO"))
			response.write("</idvuelo>")
			
			response.write("<ciudad_origen>")
			response.write( rs ("IDCIUDADORIGEN"))
			response.write("</ciudad_origen>")
			
			response.write("<ciudad_destino>")
			response.write( rs ("IDCIUDADDESTINO"))
			response.write("</ciudad_destino>")
			
			response.write("<fecha>")
			response.write( rs ("FECHA"))
			response.write("</fecha>")
			
			response.write("<compania>")
			response.write( rs ("IDCOMPANIA"))
			response.write("</compania>")
			
			response.write("<n_plazas_disponibles>")
			response.write( rs ("N_PLAZAS_DISPONIBLES"))
			response.write("</n_plazas_disponibles>")
			
			response.write("<duracion>")
			response.write( rs ("DURACION"))
			response.write("</duracion>")
			
			response.write("<avion>")
			response.write( rs ("IDAVION"))
			response.write("</avion>")
			
			response.write("</vuelo>")
			
			rs.MoveNext
			loop
			
			response.write("</XML>")
			
		end if
		%>
		
		
		