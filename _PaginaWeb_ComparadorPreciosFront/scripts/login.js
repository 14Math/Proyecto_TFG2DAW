// Elementos del DOM
const container = document.querySelector('.container');
const registerBtn = document.querySelector('.register-btn');
const loginBtn = document.querySelector('.login-btn');
const loginForm = document.querySelector('.login form');
const modalLogin = document.getElementById('ventanaModalLogin');

// Verificar sesión al cargar la página
document.addEventListener('DOMContentLoaded', verificarSesion);

// Mostrar/ocultar formularios de login/registro
registerBtn.addEventListener('click', () => {
    container.classList.add('active');
});

loginBtn.addEventListener('click', () => {
    container.classList.remove('active');
});

// Función para verificar el estado de sesión
function verificarSesion() {
    const username = localStorage.getItem('username');
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    
    if (username) {
        // Usuario está logueado
        mostrarUsername();
        document.getElementById('abrirModalLogin').style.display = "none";
        document.getElementById('boton-cerrar-sesion').style.display = 'block';
        modalLogin.style.display = "none";
        
        // Mostrar elementos según el tipo de usuario
        if (tipoUsuario === 'admin') {
            document.querySelectorAll('.admin-only').forEach(el => el.style.display = 'block');
        }
    } else {
        // Usuario no está logueado
        document.getElementById('abrirModalLogin').style.display = "block";
        document.getElementById('boton-cerrar-sesion').style.display = 'none';
    }
}


function mostrarUsername() {
    const username = localStorage.getItem('username');
    const elementoUsername = document.getElementById('elemento-username');
    if (elementoUsername) {
        elementoUsername.textContent = username;
    }
}

function cerrarSesion() {
    localStorage.removeItem('username');
    localStorage.removeItem('tipoUsuario');
    localStorage.removeItem('favoritos_temp');
 
    verificarSesion();
    
    // Redirigir a la página principal
    window.location.href = "../index.html";
}

loginForm.addEventListener('submit', async (event) => {
    event.preventDefault();

    const usernameInput = loginForm.querySelector('input[placeholder="Username"]');
    const passwordInput = loginForm.querySelector('input[placeholder="Password"]');
    
    const username = usernameInput.value.trim();
    const password = passwordInput.value;
    const tipoUsuario = document.getElementById('tipoUsuario').value;

    if (!username || !password) {
        alert("Por favor, completa todos los campos.");
        return;
    }

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
        localStorage.setItem('tipoUsuario', tipoUsuario);

        migrarFavoritosTemporales(username);
        verificarSesion();

        // Cerrar modal de login
        modalLogin.style.display = "none";

        // Disparar evento para actualizar favoritos
        window.dispatchEvent(new Event('storage'));

    } catch (error) {
        console.error('Error en el login:', error);
        alert("Error al iniciar sesión: " + error.message);
        
        // Limpiar campos en caso de error
        passwordInput.value = '';
    }
});


function migrarFavoritosTemporales(username) {
    const tempFavs = JSON.parse(localStorage.getItem('favoritos_temp')) || [];
    if (tempFavs.length > 0) {
        const userFavsKey = `favoritos_${username}`;
        const existingFavs = JSON.parse(localStorage.getItem(userFavsKey)) || [];
        
        // Combinar evitando duplicados
        const combinedFavs = [...existingFavs];
        tempFavs.forEach(tempFav => {
            if (!existingFavs.some(fav => fav.id === tempFav.id)) {
                combinedFavs.push(tempFav);
            }
        });
        
        localStorage.setItem(userFavsKey, JSON.stringify(combinedFavs));
        localStorage.removeItem('favoritos_temp');
    }
}