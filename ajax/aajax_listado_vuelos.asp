 <!-- #include file=conexion.asp -->

<!DOCTYPE html>
<html>

<head>
	<title> Agencia de Viajes </title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
<script type="text/javascript">

// FUNCIONES JAVASCRIPT
// Creamos el objeto AJAX httprequest
	function AJAXCrearObjeto(){
		var obj;
		if (window.XMLHttpRequest) { // no es IE
			obj = new XMLHttpRequest();
			//alert('El navegador no es IE');
		}
		else { // Es IE o no tiene el objeto
			try {
			obj = new ActiveXObject("Microsoft.XMLHTTP");
			// alert('El navegador utilizado es IE');
			}
			catch (e) {
			// alert('El navegador utilizado no está soportado');
			}
		}
		//alert('realizado');
	return obj;
	}
	
	
	// Recibe y muestra los vuelos que pertenecen al vuelo seleccionado
	function leerDatos(){
		// Comprobamos que se han recibido los datos
		if (oXMLorig.readyState == 4)  {
		// Accedemos al XML recibido

		var xml = oXMLorig.responseXML.documentElement;
		// Accedemos al componente html correspondiente a la tabla
		var tabla = document.getElementById('tabla_vuelos');
		// Vaciamos el DIV
		var definicion_tabla = new String("");
		// cadena con los datos para crear la tabla
		definicion_tabla ='<th>Id Vuelo</th><th>ID Ciudad Origen</th><th>ID Ciudad Destino</th><th>Fecha</th><th>Compa&ntilde;&iacute;a</th><th>Plazas Disponibles</th><th>Duraci&oacute;n</th><th>ID Avi&oacute;n</th><tr>';
		// Iteramos cada vuelo
		var v;
		var item;
		for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++){
			// Accedemos al objeto XML
			item = xml.getElementsByTagName('vuelo')[i];
			// Recuperamos el identificador de vuelo
			v = item.getElementsByTagName('idvuelo')[0].firstChild.data;
			// Añadimos el campo a la tabla
			definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';
			// Recuperamos el id de la ciudad de origen
			v = item.getElementsByTagName('ciudad_origen')[0].firstChild.data;
			// Añadimos el campo a la tabla
			definicion_tabla =definicion_tabla+'<td>'+ v +'</td>';
			// Recuperamos el id de la ciudad destino
			v = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;
			// Añadimos el campo a la tabla
			definicion_tabla= definicion_tabla+'<td>' + v +'</td>';
			// Recuperamos la fecha
			v = item.getElementsByTagName('fecha')[0].firstChild.data;
			// Añadimos el campo a la tabla
			definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
			// Recuperamos la compania
			v = item.getElementsByTagName('compania')[0].firstChild.data;
			// Añadimos el campo a la tabla
			definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
			// Recuperamos el numero de planzas disponibles
			v = item.getElementsByTagName('n_plazas_disponibles')[0].firstChild.data;
			// Añadimos el campo a la tabla
			definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
			// Recuperamos la duracion del vuelo
			v = item.getElementsByTagName('duracion')[0].firstChild.data;
			// Añadimos el campo a la tabla
			definicion_tabla= definicion_tabla+'<td>' + v + '</td>';
			// Recuperamos el id de avion
			v = item.getElementsByTagName('avion')[0].firstChild.data;
			// añadimo el campo a la tabla
			definicion_tabla= definicion_tabla+'<td>' + v + '</td></tr>';
		}
	// rellenamos el objeto html tabla con la definicion construida
	tabla.innerHTML = definicion_tabla;
	}
	}
	
		
	
	
	function mostrar_vuelos(){
		// recupera el objeto html desplegable de vuelos
		var valorx=document.getElementById("origen").value;
		var valory=document.getElementById("destino").value;
		// crea el objeto httprequest
		oXMLorig = AJAXCrearObjeto();
		oXMLdest = AJAXCrearObjeto();
		//Conecta con el servidor
		oXMLorig.open('POST', 'aajax_consulta_serv_vuelos.asp');
		oXMLdest.open('POST', 'aajax_consulta_serv_vuelos.asp');
		// llama a la funcion
		oXMLorig.onreadystatechange = leerDatos;
		oXMLdest.onreadystatechange = leerDatos;
		//cabeceras para que funcione ajax
		oXMLorig.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		oXMLdest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		// lanza la peticion enviando los parametros
		oXMLorig.send('origen='+valorx);
		oXMLdest.send('destino='+valory);
		
	}
	
	
	
	</script>
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

<h2>EJEMPLO LISTAR VUELOS POR CIUDAD</h2>

		<select name="origen" id="origen" onChange="return mostrar_vuelos()">
			Origen <br>
		
				<option value="0"> Todos los orienes </option>
					<%
						Set origen = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
						'Recorremos el Recordset
						do while not origen.EOF
							Response.write("<option value='" & origen("IDCIUDAD") & "'>" & origen("CIUDAD") & "</option>")
								'Nos desplazamos por el Recorset
						origen.MoveNext
						loop	
					%>
		</select>
		<br><br>

		
		Seleccione una Ciudad Destino: 
		<select name="destino" id="destino" onChange="return mostrar_vuelos()">
							
				<option value="0"> Todos los destinos </option>
				<%
					Set destino = Conexion.Execute("select IDCIUDAD, CIUDAD from CIUDAD order by CIUDAD")
					'Recorremos el Recordset
					do while not destino.EOF
						Response.write("<option value='" & destino("IDCIUDAD") & "'>" & destino("CIUDAD") & "</option>")
						'Nos desplazamos por el Recorset
					destino.MoveNext
					loop	
				%>
		</select>

				
			<table id="tabla_vuelos" name="tabla_vuelos" border=1>
</table>

<br><br><section>
	
		<h2> CONSULTAR RESERVAS </h2>
		
		
			<form method = "post" action = "consultar_reservas.asp">

			ID de la Reserva: <input type = "text" name = "idreserva"><br>
			DNI: <input type ="text" name = "dni"><br><br>

			<input type = "submit" value = "Buscar"> <br><br>


		
	
	</section>
	
</body>
</html>




		