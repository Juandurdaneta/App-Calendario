<%@ include file="partials/header.jsp" %>
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


 
<%@ include file="partials/footer.jsp" %>