<!DOCTYPE html>
<html>
<body>

<%

'CREAMOS UN USUARIO Y CONTRASEÑA PREDETEREMINADOS

session("usuario") = "admin"
session("contrasena") = "1234"

' COMPARAMOS LOS DATOS RECIBIDOS DEL USUARIO

If request.form("usuario") = session("usuario") and request.form("contrasena") = session("contrasena") then
	
	session("autentificacion") = 1
	
	auten=session("autentificacion")
	
	
else

	response.redirect("http://localhost/practica1_asp/iniciar_sesion.asp")

end if


if (auten = 1) then
	
	response.redirect("http://localhost/practica1_asp/agencia_viajes_administrador.asp")
end if
%>



</body>
</html>