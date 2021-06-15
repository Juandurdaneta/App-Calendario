window.onload = function inicio(){
    var usuario = document.getElementById("nombreDeUsuario");  

    fetch('https://app-calendario-web2.herokuapp.com/user', {
        method: "POST",
        mode: "no-cors",
        headers: new Headers({
            'Content-Type': 'application/json'
        }),
    }).then(res => res.json())
    .catch(error => console.error('Error:', error))
    .then(response =>{
        console.log('Resultados: ', response)
        alert(response.message)
        usuario.innerHTML = response.username;
    });
}