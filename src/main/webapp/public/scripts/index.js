const formularioRegistro = document.getElementById("main-form");
console.log(formularioRegistro);
let alerta = document.querySelector("#alerta");
	
const post = (e) => {
	e.preventDefault();
	if(formularioRegistro.checkValidity()){
		var formulario = new FormData(formularioRegistro);
		var datos = {
			method : "POST",
			body : formulario
		}
		fetch('register', datos)
		.then(response => response.json())
		.then(data =>{
			if(data.status==200)
				alert("funciono")
			else
				alert("no funciono")	
			})
		.catch(err=>console.log('Error: ', err));
	}else 
		alert("Ocurrio un problema");
}

formularioRegistro.addEventListener("submit", post);