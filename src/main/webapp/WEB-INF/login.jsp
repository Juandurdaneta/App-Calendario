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
<style type="text/css">
	
	h1, h3{
		margin: 2% 0%;
	}
	
	#main-section{
		padding: 5%;
	}
	
	@media (max-width: 992px){
		#main-section{
			margin-top: 15%;
		}
	}
	
</style>
</head>
<body style="font-family: 'Open Sans', sans-serif;">

<section id="main-section">
	
		<div class="container">
		<div class="row d-flex justify-content-center">
	
			<div class="col-xl-12 col-md-8 text-center">
			<h1 style="color:#ce973e">Iniciar Sesion</h1>
			<br>
			</div>
			<div class="col-xl-5 col-md-8 text-center">
				<!-- Form en el centro -->
				<form class="bg-white rounded shadow-5-strong p-5 main-form" action="/" method="post">
						<p class="bg-warning text-white">${invalido}</p>
					<div class="form-outline mb-4">
						<input type="text" id="username" class="form-control" name="username"/>
						<label class="form-label" for="username"><i class="fas fa-user"></i> Nombre de Usuario</label>
					</div>
					<div class="form-outline mb-4">
						<input type="password" id="pass" class="form-control" name="pass"/>
						<label class="form-label" for="pass"><i class="fas fa-lock"></i> Contraseña</label>
					</div>
					<button type="submit" class="btn btn-primary btn-block">Iniciar Sesion</button>
				</form>
				<br>
				<div class="d-grip gap-2">
				<h3 style="color:#4a4a4a">Aun no tienes cuenta?</h3>
				<form action="/register">
				<button class="btn btn-outline-dark btn-lg" type="submit">Crear Cuenta</button></form>
				</div>
				
				
			</div>
		</div>
		</div>
		
	
</section>

 <!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.js"
></script>
</body>
</html>