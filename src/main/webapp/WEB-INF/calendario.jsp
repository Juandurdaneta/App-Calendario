<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calendario</title>

<!-- Font Awesome -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
  rel="stylesheet"
/>
<!-- Google Fonts -->
<link
  href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"
  rel="stylesheet"
/>
<!-- MDB -->
<link
  href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.css"
  rel="stylesheet"
/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap" rel="stylesheet">

</head>
<body>
<div class="container">
<button class="btn prev"><</button><h1 class="semana"></h1><button class="btn next">></button>
</div>





<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.js"
></script>

<script>
let i = 0
let j = i;
const hoy = new Date();
const primerDia = new Date();
primerDia.setDate(hoy.getDate() - hoy.getDay());
const ultimoDia = new Date();
ultimoDia.setDate(hoy.getDate() - hoy.getDay() + 6);

const options = {
	    weekday: "long",
	    month: "long",
	    day: "numeric",
	  };


function semanaSiguiente(){
	i += 7
	let semanaSiguiente = new Date();
	semanaSiguiente.setDate(primerDia.getDate() + i);
	let semanaSiguienteFormateado = semanaSiguiente.toLocaleDateString("es-ES", options);
	
	let ultimoDiaSiguiente = new Date();
	ultimoDiaSiguiente.setDate(primerDia.getDate() + (i+6));
	let ultimoDiaSiguienteFormateado = ultimoDiaSiguiente.toLocaleDateString("es-ES", options);
	
	return semanaSiguienteFormateado + " - " + ultimoDiaSiguienteFormateado;
}


let semanaActual = document.querySelector('.semana');
let primerDiaFormateado = primerDia.toLocaleDateString("es-ES", options);
let ultimoDiaFormateado = ultimoDia.toLocaleDateString("es-ES", options);


semanaActual.innerHTML = primerDiaFormateado + " - "+ ultimoDiaFormateado;

document.querySelector(".next").addEventListener("click", function(){
	semanaActual.innerHTML = semanaSiguiente();
});

</script>


</body>
</html>