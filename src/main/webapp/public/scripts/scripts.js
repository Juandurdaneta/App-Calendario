var inputUsuario = document.getElementById("nombreUserAEliminar")
var btnEliminar = document.getElementById("btnEliminar");


if (inputUsuario.value == ""){
	btnEliminar.disabled = true;
} else {
    btnEliminar.disabled = false;
}