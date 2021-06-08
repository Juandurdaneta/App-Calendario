<%@ include file="partials/header.jsp" %>

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

<%@ include file="partials/footer.jsp" %>