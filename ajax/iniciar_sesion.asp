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
	
		<h2> INICIAR SESION ADMINISTRADOR </h2> <br>

		<form method = "post" action = "autentificacion.asp">

		Usuario: <input type = "text" name = "usuario"><br>
		Contraseña: <input type ="text" name = "contrasena"><br><br>

		<input type = "submit" value = "Iniciar Sesión"> <br><br>
		
	
	</main>

</body>
</html>
