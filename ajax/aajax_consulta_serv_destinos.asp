<!-- #include file=conexion.asp -->
	<%
	
	origen=request.form("origen")
	'origen=2
	
	' El contenido a devolver es XML
	response.ContentType="text/xml"
	response.CacheControl="no-cache, must-revalidate"
	

	SentenciaSQL = "select IDCIUDADDESTINO from VUELO where IDCIUDADORIGEN=" & origen 
	SentenciaA ="select CIUDAD from CIUDAD where IDCIUDAD =2" 
	SentenciaDEST = "select CIUDAD from CIUDAD where IDCIUDAD = (select IDCIUDADDESTINO from VUELO where IDCIUDADORIGEN=1)" 
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
		
		
		