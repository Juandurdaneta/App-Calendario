<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crear cuenta</title>
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

	#main-section{
		padding: 5%;
	}

</style>
</head>
<body style="font-family: 'Open Sans', sans-serif;">


<section id="main-section">

	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col-xl-12 col-md-8 text-center">
				<h1 style="color:#ce973e">Registrate</h1>
				<br>
			</div>
			<!-- FORM -->
			<div class="col-xl-5 col-md-8">
				<form class="bg-white rounded shadow-5-strong p-5 main-form" action="/register" method="post">
					${success}
					<div class="form-outline mb-4">
						<input type="text" class="form-control" name="username" id="username">
						<label for="username" class="form-label"><i class="fas fa-user"></i> Nombre de usuario</label>
					</div>
					<div class="form-outline mb-4">
						<input type="password" class="form-control" name="pass" id="pass">
						<label for="pass" class="form-label"><i class="fas fa-lock"></i> Contraseña</label>
					</div>
					<div class="form-outline mb-4">
						<input type="password" class="form-control" name="pass2" id="pass2">
						<label for="pass2" class="form-label"><i class="fas fa-lock"></i> Confirmar contraseña</label>
					</div>
					<button type="submit" class="btn btn-primary btn-block">Crear cuenta</button>
				</form>
				
				<br>
				<div class="d-grip gap-2 text-center">
				<h3 style="color:#4a4a4a">Ya tienes cuenta?</h3>
				<br>
				<form action="/">
				<button class="btn btn-outline-dark btn-lg" type="submit">Iniciar sesion</button></form>
				</div>
				
			</div>
		</div>
	</div>

</section>










<!--  <h1>${success}</h1>
<form action = "/register" method = "post">
	<table style="width: 100%">
    <tr>
     <td>UserName</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="pass" /></td>
    </tr>
     <tr>
     <td>Repeat your password</td>
     <td><input type="password" name="pass2" /></td>
    </tr>

   </table>
   <input type="submit" value="Submit" />
</form>-->


 <!-- MDB -->
<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.js"
></script>
</body>
</html>