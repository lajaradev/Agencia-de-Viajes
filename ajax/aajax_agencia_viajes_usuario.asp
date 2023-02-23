 <!-- #include file=conexion.asp -->

<!DOCTYPE html>
<html>

<head>
	<title> Agencia de Viajes </title>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/style.css">
	
	<script type="text/javascript">

// FUNCIONES JAVASCRIPT

	function AJAXCrearObjeto(){
		var obj;
			if (window.XMLHttpRequest) { 
				obj = new XMLHttpRequest();
			}
			else { 
				try {
					obj = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch (e) {
				}
			}
		return obj;
	}
	
	

	function leerDatosDestino(){
		if (oXML.readyState == 4) {
				var xml = oXML.responseXML.documentElement;
				var select = document.getElementById('select_destino');
				var definicion_select = new String("");
				definicion_select ='<option>Ciudades de Destino';
				var v;
				var item;
				for (i = 0; i < xml.getElementsByTagName('vuelo').length; i++){
					item = xml.getElementsByTagName('vuelo')[i];
					v = item.getElementsByTagName('ciudad_destino')[0].firstChild.data;
					definicion_select= definicion_select+'<option>' + v ;
				}				
				select.innerHTML = definicion_select;
			}
	}

	
	
		
	function mostrar_destinos(){ 
		var valor_aaax=document.getElementById("origen").value;
		oXML = AJAXCrearObjeto();
		oXML.open('POST', 'aajax_consulta_serv_destinos.asp');
		oXML.onreadystatechange = leerDatosDestino;
		oXML.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		oXML.send('origen='+valor_aaax);
		
		
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

	<main>
		<h2> BÚSQUEDA DE VUELOS </h2> <br><br>
		
		Seleccione una Ciudad Destino: 

		<select name="origen" id="origen" onChange="return mostrar_destinos()">
			
			
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
			
			<br><br>Seleccione una Ciudad Destino: 
			
		<select name="select_destino" id="select_destino">
			

	
	</main>

</body>
</html>
