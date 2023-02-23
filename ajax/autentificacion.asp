<!DOCTYPE html>
<html>
<body>

<%

'CREAMOS UN USUARIO Y CONTRASEÑA PREDETEREMINADOS

session("usuario") = "admin"
session("contrasena") = "1234"

' COMPARAMOS LOS DATOS RECIBIDOS DEL USUARIO

If request.form("usuario") = session("usuario") and request.form("contrasena") = session("contrasena") then

	response.redirect("http://localhost/practica1_asp/agencia_viajes_administrador.asp")

else

	response.write("Usuario Incorrecto <br>")

end if


%>



</body>
</html>