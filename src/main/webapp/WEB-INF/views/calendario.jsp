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
    <div class="modal-content">

    
      <div class="modal-body">
      
          <button
          type="button"
          class="btn-close"
          data-mdb-dismiss="modal"
          aria-label="Close"
        ></button>
    	
    	<form>
    	<!-- Nombre del evento -->
    	
    	<div class="form-outline mb-4">
    		<input  class="form-control" type="datetime-local" id="fecha-inicio" name="fecha-inicio" value="">
    		<label class="form-label" for="fecha-inicio">Fecha de inicio</label>
    	</div>
    	
    	</form>
      
      </div>
    </div>
  </div>
</div>
		
</section>




<script
  type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.5.0/mdb.min.js"
></script>

<script>
var dateControl = document.querySelector('input[type="datetime-local"]');
dateControl.value = '2021-06-01T08:30';

document.addEventListener("DOMContentLoaded", function () {
    var calendarEl = document.getElementById("calendar");
    var eventos = [];
    var calendar = new FullCalendar.Calendar(calendarEl, {
      customButtons: {
        myCustomButton: {
          text: "Añadir evento",
          click: añadirEvento
        },
      },
      headerToolbar: {
        center: "myCustomButton",
      },
      initialView: "timeGridWeek",
      locale: "es",
      titleFormat: { // Esto producira una fecha del tipo : "Lun, 7 de jun de 2021"
    	    month: 'short',
    	    year: 'numeric',
    	    day: 'numeric',
    	    weekday: 'short',
    	  }

      
    });
    
    function añadirEvento(){
    	const myModalEl = document.getElementById('exampleModal');
    	const modal = new mdb.Modal(myModalEl);
    	modal.show();
    }

    calendar.render();
  });

</script>


</body>
</html>