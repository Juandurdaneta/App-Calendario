var date = new Date();
var fechaInicioInput = toISOLocal(date).substring(0,16);
date.setDate(date.getDate() + 1)
var fechaFinInput = toISOLocal(date).substring(0,16);
var nuevoEvento = "";
var username = document.getElementById('nombreUsuario');


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
          text: "Nuevo Evento",
          click: anadirEvento
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
    	  },
    	  eventClick: verEvento
      
    });
    	const myModalEl = document.getElementById('anadirEventoModal');
    	const modal = new mdb.Modal(myModalEl);
    	

        function anadirEvento(){
            //Mostrar el modal
            modal.toggle();
            
            //Boton agregar Evento
            document.getElementById("agregarEvento").addEventListener("click", function(){  
            //Variables
            let evento = document.getElementById("nombreEvento").value;
            let fecha_inicio = document.getElementById("fecha-inicio").value;
            let fecha_fin = document.getElementById("fecha-fin").value;
            let colorEvento = document.getElementById("colorEvento").value;
            
        
            if(evento != "" && fecha_inicio != "" && fecha_fin != "" && colorEvento != ""){

                nuevoEvento = {
                    title: evento,
                    start : fecha_inicio,
                    end : fecha_fin,
                    color: colorEvento
                    };  

                    evento = "";
                    fecha_inicio = "";
                    fecha_fin  = "";
                    colorEvento = "";

                    document.getElementById("nombreEvento").value = "";
                    document.getElementById("fecha-inicio").value = fechaInicioInput;
                    document.getElementById("fecha-fin").value = fechaFinInput;


                calendar.addEvent(nuevoEvento);
                modal.toggle();
            }
        
             
            
        });
        
        
        
        }
    
    
	function verEvento(info){
        //Info del evento
    	var objEvento = info.event;

        //Modal con la informacion del evento
    	const modalEditarEvento = document.getElementById("editarEventoModal");
    	const modalEvento = new mdb.Modal(modalEditarEvento);
    	modalEvento.toggle();

        //Variables
        var dateInicio = new Date(objEvento.start);
        var dateFin = new Date(objEvento.end);
    	var fechaInicioEvento = toISOLocal(dateInicio).substring(0,16);
        var fechaFinEvento = toISOLocal(dateFin).substring(0,16);

        let tituloEventoSeleccionado = document.getElementById("tituloEvento").value = objEvento.title;
        let fechaInicioDeEventoSeleccionada = document.getElementById("inicioEvento").value = fechaInicioEvento;
        let fechaFinDeEventoSeleccionada = document.getElementById("finEvento").value = fechaFinEvento;
        let colorEventoSeleccionado = document.getElementById("color").value = objEvento.backgroundColor;

        //Eliminar Evento

        document.getElementById("EliminarEvento").addEventListener("click", function(){
            if(tituloEventoSeleccionado != "" && fechaInicioDeEventoSeleccionada != "" 
            && fechaFinDeEventoSeleccionada != "" && colorEventoSeleccionado != ""){

                objEvento.remove();
                
                tituloEventoSeleccionado = "";
                fechaInicioDeEventoSeleccionada = "";
                fechaFinDeEventoSeleccionada = "";
                colorEventoSeleccionado = "";

				document.getElementById("tituloEvento").value = "";
                modalEvento.hide();
            }
           
        });


        //Modificar Evento

        document.getElementById("guardarCambios").addEventListener("click", function(){
            if(tituloEventoSeleccionado != "" && fechaInicioDeEventoSeleccionada != "" 
            && fechaFinDeEventoSeleccionada != "" && colorEventoSeleccionado != ""){  

               objEvento.setDates(document.getElementById("inicioEvento").value, document.getElementById("finEvento").value);
               modalEvento.hide();
                

            }
           

        });
		
	
		}
    
  
   

    calendar.render();
  });
  
 // MANEJO DE FECHAS
  
  function toISOLocal(d) {
  var z  = n =>  ('0' + n).slice(-2);
  var zz = n => ('00' + n).slice(-3);
  var off = d.getTimezoneOffset();
  var sign = off < 0? '+' : '-';
  off = Math.abs(off);

  return d.getFullYear() + '-'
         + z(d.getMonth()+1) + '-' +
         z(d.getDate()) + 'T' +
         z(d.getHours()) + ':'  + 
         z(d.getMinutes()) + ':' +
         z(d.getSeconds()) + '.' +
         zz(d.getMilliseconds()) +
         sign + z(off/60|0) + ':' + z(off%60); 
}
  
