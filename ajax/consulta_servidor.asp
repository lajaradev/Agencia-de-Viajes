<!-- #include file=conexion.asp -->
	<%
	' Script ASP programado con VBScript
	' Realiza consulta en la base de datos y genera como resultato una lista de vuelos en formato XML on Error Resume Next
	' Accedemos al compañía enviado desde la pagina principal
	
	
	'origen=request.form("origen")
	origen=2
	
	' El contenido a devolver es XML
	response.ContentType="text/xml"
	response.CacheControl="no-cache, must-revalidate"
	' Consulta SQL de las ciudades que son origen de algun vuelo
	
	SentenciaSQL = "Select IDCIUDADDESTINO from VUELO where IDCIUDADORIGEN=" & origen
	Set rs = Conexion.Execute(SentenciaSQL)
	
	' Se genera una salida XML con la lista de vuelos
	if (not(rs.Eof)) then
				
	%><?xml version="1.0" encoding="utf-8"?><XML><%
			
			'recorremos el recordset
			do until rs.Eof
			
			response.write("<vuelo>")
						
			response.write("<ciudad_destino>")
			response.write( rs ("IDCIUDADDESTINO"))
			response.write("</ciudad_destino>")
			
			response.write("</vuelo>")
			
			rs.MoveNext
			loop
			
			response.write("</XML>")
			
		end if
		%>
		
		
		