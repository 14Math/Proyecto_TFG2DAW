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


loginForm.addEventListener('submit', async (event) => {
    event.preventDefault();

    const username = loginForm.querySelector('input[placeholder="Username"]').value.trim();
    const password = loginForm.querySelector('input[placeholder="Password"]').value;
    const tipoUsuario = document.getElementById('tipoUsuario').value;

    if (!username || !password) {
        alert("Por favor, completa todos los campos.");
        return;
    }

    // Determina la URL según el tipo de usuario
    const url = `http://localhost:8084/${tipoUsuario}/login?username=${username}&password=${password}`;

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ username, password })
        });

        if (!response.ok) {
            const errorMessage = await response.text();
            throw new Error(errorMessage || 'Error en el login');
        }

        const responseData = await response.json();
        console.log('Login exitoso:', responseData);

        localStorage.setItem('username', username);
        localStorage.setItem('tipoUsuario', tipoUsuario); // opcional

        mostrarUsername();

        document.getElementById('abrirModalLogin').style.display = "none";
        document.getElementById('boton-cerrar-sesion').style.display = 'block';
        document.getElementById('ventanaModalLogin').style.display = "none";

    } catch (error) {
        console.error('Error en el login:', error);
        alert("Error al iniciar sesión: " + error.message);
    }
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