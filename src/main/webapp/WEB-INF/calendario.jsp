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
<div class="container-fluid">
	<div class="d-flex justify-content-center">
		<button class="btn btn-outline-dark btn-floating prev"><i class="fas fa-arrow-left"></i></button><h3 class="semana"></h3><button class="btn btn-outline-dark btn-floating next"><i class="fas fa-arrow-right"></i></button>
	</div>
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
	semanaSiguiente.setDate(hoy.getDate() - hoy.getDay() + i);
	let semanaSiguienteFormateado = semanaSiguiente.toLocaleDateString("es-ES", options);
	
	let ultimoDiaSiguiente = new Date();
	ultimoDiaSiguiente.setDate(hoy.getDate() - hoy.getDay() + (i+6));
	let ultimoDiaSiguienteFormateado = ultimoDiaSiguiente.toLocaleDateString("es-ES", options);
	
	return semanaSiguienteFormateado + " - " + ultimoDiaSiguienteFormateado;
}

function semanaAnterior(){
	i-=7
	let semanaAnterior = new Date();
	semanaAnterior.setDate(hoy.getDate() - hoy.getDay() + i);
	let semanaAnteriorFormateado = semanaAnterior.toLocaleDateString("es-ES", options);
	
	let ultimoDiaAnterior = new Date();
	ultimoDiaAnterior.setDate(hoy.getDate() - hoy.getDay() + (i+6));
	let ultimoDiaAnteriorFormateado = ultimoDiaAnterior.toLocaleDateString("es-ES", options);
	
	return semanaAnteriorFormateado + " - " + ultimoDiaAnteriorFormateado;
}

let semanaActual = document.querySelector('.semana');
let primerDiaFormateado = primerDia.toLocaleDateString("es-ES", options);
let ultimoDiaFormateado = ultimoDia.toLocaleDateString("es-ES", options);


semanaActual.innerHTML = primerDiaFormateado + " - "+ ultimoDiaFormateado;

document.querySelector(".next").addEventListener("click", function(){
	semanaActual.innerHTML = semanaSiguiente();
});

document.querySelector(".prev").addEventListener("click", function(){
	semanaActual.innerHTML = semanaAnterior();
});

</script>


</body>
</html>