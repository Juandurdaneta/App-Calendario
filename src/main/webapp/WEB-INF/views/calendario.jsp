<%@ include file="partials/header.jsp" %>
<body>
<section id="main">
	<div class="container-fluid">
			<!-- Botones -->
			<div class="row p-1">
			
			<div class="col-6 d-flex justify-content-start">
				<form method="get" action="/cerrar-sesion">
					<button type="submit" class="btn btn-danger">Cerrar Sesion</button>
				</form>
			</div>
			
				<div class="col-6 d-flex justify-content-end">
					<form method="get" action="/user/${username}">
						<button style="float:left "type="submit" class="btn btn-primary btn-lg btn-floating">
							<i class="fas fa-user"></i>
						</button>
						<p style="float:right" class="p-2"> ${username}</p>
					</form>
				</div>
			</div>
			<!-- Calendario -->
			<div class="row d-flex">
				<div class="col-12">
				  <div id="calendar"></div>
				</div>
			</div>
			
		</div>
		
		
		
		<div
  class="modal fade"
  id="exampleModal"
  tabindex="-1"
  aria-labelledby="exampleModalLabel"
  aria-hidden="true"
>
  <div class="modal-dialog">
    <div class="modal-content p-4">

   
          <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
    
    
      <div class="modal-body">
      
    	<form>
    	<!-- Nombre del evento -->
    	  <div class="form-outline mb-4">
    		<input type="text" id="nombreEvento" name="nombreEvento" class="form-control" />
    		<label class="form-label" for="nombreEvento">Nombre del Evento</label>
 		 </div>
 		 <!-- Fecha inicio / Fecha Fin -->
    	<div class="row mb-4">
    		<div class="col-6">
    			<div class="form-outline">
    				<input  class="form-control" type="datetime-local" id="fecha-inicio" name="fecha-inicio" value="">
    				<label class="form-label" for="fecha-inicio">Fecha inicio</label>
    			</div>
    		</div>
    		<div class="col-6">
    			<div class="form-outline">
    				<input class="form-control" type="datetime-local" id="fecha-fin" name="fecha-fin" value="">
    				<label class="form-label" for="fecha-fin">Fecha fin</label>
    			</div>
    		</div>
    	</div>
    	<!-- Imagen -->
    	<div class="form mb-4">
    		<label class="form-label" for="imagen">Agregar imagen</label>
    		<input type="file" name="imagen" id="imagen" class="form-control" accept="image/png, image/jpeg">
    	</div>
    	<!-- Color -->
    	
    	<div class="form mb-4">
    		<label class="form-label" for="colorEvento">Color:</label>
    		<input type="color" id="colorEvento" name="colorEvento" value="#0041C2">
    	</div>
    	
    	<!-- Agregar evento -->
    	
    	<button type="submit" class="btn btn-primary btn-block mb-4">Agregar Evento</button>
    	
    	</form>
      
      </div>
    </div>
  </div>
</div>
		
</section>


<%@ include file="partials/LogicaCalendario.jsp" %>

<%@ include file="partials/footer.jsp" %>