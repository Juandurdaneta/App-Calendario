<%@ include file="partials/header.jsp" %>
<section id="main">
	<div class="container-fluid justify-content-center">
	
	<!-- Imagen de perfil -->
		<div class="row d-flex">
			<div class="col text-center">
				<div class="profile-pic" style="font-size: 24px;">
					<i class="far fa-user-circle fa-10x"></i>
				</div>
			</div>
		</div>
		
		<!-- Nombre de usuario -->
	<div class="row d-flex">
		<div class="col text-center">
			<div class="username">
				<h1>${username}</h1>
			</div>
		</div>
	</div>		
	
	<br>
	
	<!-- Formulario para editar imagen de perfil -->
	<div class="row d-flex justify-content-center">
		<div class="col-4 text-center">
			<p>Imagen de perfil:</p>
		</div>
		<div class="col-8">
			<form>
				<div class="form-group w-50 formularioPerfil">
    			<input type="file" name="imagenPerfil" id="imagenPerfil" class="form-control" accept="image/png, image/jpeg">
    			</div>
    			<div class="form-group formularioPerfil">
    			<button class="btn">Guardar cambios y volver</button>
    			</div>
			</form>
		</div>
	</div>
	
	<!-- Eliminar Cuenta -->
	<div class="row d-flex justify-content-center eliminarCuenta">
	
		<div class="col-2 p-2 ">
			<button type="button" class="btn btn-danger" data-mdb-toggle="modal" data-mdb-target="#eliminarUsuarioModal">Eliminar cuenta</button>
		</div>
		<div
  class="modal fade"
  id="eliminarUsuarioModal"
  tabindex="-1"
  aria-labelledby="eliminarUsuarioLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <p class="modal-title" id="exampleModalLabel">Estas absolutamente seguro?</p>
        <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
     </div>
      <div class="modal-body">
      
      <p class="alert alert-warning">Importante leer esto</p>
      
      <div>
      <p>Esta accion no se puede deshacer, estas eliminando permanentemente el usuario <strong>${username}</strong>, los calendarios,
      los eventos y todo lo que contenga esta cuenta.</p>
      
      <p>Por favor, escribe <strong>${username}</strong> para confirmar.</p>
      
      </div>
      
      </div>
      
    </div>
  </div>
</div>
	</div>
	
	
	
	</div>
</section>
<%@ include file="partials/footer.jsp" %>