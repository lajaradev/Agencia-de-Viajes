
<%
Set Conexion = server.CreateObject("ADODB.Connection")
Conexion.ConnectionString = "Data Source=agencia; USER=SYSDBA; PASSWORD=masterkey"
Conexion.Mode = 1
Conexion.Open


if Conexion.Errors.Count>0 then
	for each error in Conexion.Errors
	'response.write(Error.Number & " = " & Error.Description)
	next
else	
	'response.write("Conexion realizada con exito.")
end if
%>
