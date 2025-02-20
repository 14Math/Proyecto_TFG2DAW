const container = document.querySelector('.container');
const registerBtn = document.querySelector('.register-btn');
const loginBtn = document.querySelector('.login-btn');
const loginForm = document.querySelector('.login form');

registerBtn.addEventListener('click', () => {
    container.classList.add('active');
});

loginBtn.addEventListener('click', () => {
    container.classList.remove('active');
});

loginForm.addEventListener('submit', (event) => {
    event.preventDefault();

    const username = loginForm.querySelector('input[placeholder="Username"]').value;
    const password = loginForm.querySelector('input[placeholder="Password"]').value;

    const data = {
        username: username,
        password: password
    };

    fetch(`http://localhost:8084/productos/login?username=${username}&password=${password}`, { // URL absoluta
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
    .then(response => {
        if (!response.ok) {
            return response.text().then(errorMessage => {
                throw new Error(errorMessage || 'Error en la solicitud');
            });
        }
        return response.json();
    })
    .then(responseData => {
        console.log('Login successful:', responseData);
        localStorage.setItem('username', username); // Guarda el username
        mostrarUsername(); // Muestra el username en el HTML
        document.getElementById('abrirModalLogin').style.display = "none";
        document.getElementById('boton-cerrar-sesion').style.display = 'block';
        document.getElementById('ventanaModalLogin').style.display="none";
        
    })
    .catch(error => {
        console.error('Login error:', error);
        alert("Login failed: " + error.message);
    });
});

function mostrarUsername() {
    const username = localStorage.getItem('username');
    const elementoUsername = document.getElementById('elemento-username'); // Reemplaza con el ID de tu elemento HTML
    if (elementoUsername) {
        elementoUsername.textContent = "Hola "+username;
    }
}

function cerrarSesion() {
    localStorage.removeItem('username');
    // Mostrar botón "Iniciar Sesión" y ocultar "Cerrar Sesión"
    document.getElementById('abrirModalLogin').style.display = 'block';
    document.getElementById('boton-cerrar-sesion').style.display = 'none';

    // Redirigir a la página de inicio (o recargar la página actual)
    window.location.href = "../index.html"; // Reemplaza con la URL de tu página de inicio
}

// Mostrar el username al cargar la página (si el usuario ya ha iniciado sesión)
window.addEventListener('DOMContentLoaded', mostrarUsername)