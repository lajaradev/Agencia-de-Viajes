<%
auten=session("autentificacion")
if (auten = 0) then
		response.redirect("http://localhost/practica1_asp/iniciar_sesion.asp")
end if
%>