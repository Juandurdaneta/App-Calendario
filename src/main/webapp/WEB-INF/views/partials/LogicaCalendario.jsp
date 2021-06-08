<script>

var date = new Date();
var fechaInicioInput = date.toISOString().substring(0,16);
date.setDate(date.getDate() + 1)
var fechaFinInput = date.toISOString().substring(0,16);


var dateControl = document.querySelectorAll('input[type="datetime-local"]')[0];
var dateControl2 = document.querySelectorAll('input[type="datetime-local"]')[1];
dateControl.value = fechaInicioInput;
dateControl2.value = fechaFinInput;

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
