const loginForm = document.querySelector('.login form');
const modalLogin = document.getElementById('ventanaModalLogin');

loginForm.addEventListener('submit', async (event) => {
    event.preventDefault();

    const usernameInput = loginForm.querySelector('input[placeholder="Username"]');
    const passwordInput = loginForm.querySelector('input[placeholder="Password"]');
    const username = usernameInput.value.trim();
    const password = passwordInput.value;
    const tipoUsuario = document.getElementById('tipoUsuario').value;

    console.log("Intentando login con:");
    console.log("username:", username);
    console.log("tipoUsuario:", tipoUsuario);

    if (!username || !password) {
        alert("Por favor, completa todos los campos.");
        return;
    }

    const url = `http://localhost:8084/${tipoUsuario}/login?username=${username}&password=${password}`;

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ username, password })
        });

        if (!response.ok) {
            const errorMessage = await response.text();
            throw new Error(errorMessage || 'Error en el login');
        }

        const responseData = await response.json();
        console.log('[LOGIN] Respuesta del backend:', responseData);

        localStorage.setItem('username', username);
        localStorage.setItem('tipoUsuario', tipoUsuario);

        // CLIENTE
        if (tipoUsuario === 'cliente' && (responseData.ID_CLIENTE || responseData.idCliente)) {
            const idCliente = responseData.ID_CLIENTE ? responseData.ID_CLIENTE : responseData.idCliente;
            localStorage.setItem('idCliente', idCliente);
            localStorage.removeItem('idProveedor');
            console.log('[LOGIN] Guardado idCliente:', idCliente);
        }
        // PROVEEDOR
       if (tipoUsuario === 'proveedor' && responseData.idProvedor) {
    localStorage.setItem('idProveedor', responseData.idProvedor);
    console.log('Guardado idProveedor en localStorage:', responseData.idProvedor);
    localStorage.removeItem('idCliente');
}

        // Empresa proveedor
        if (tipoUsuario === 'proveedor' && (responseData.empresa || responseData.EMPRESA)) {
            const emp = responseData.empresa ? responseData.empresa : responseData.EMPRESA;
            localStorage.setItem('empresa', emp);
            console.log('[LOGIN] Guardada empresa:', emp);
        } else {
            localStorage.removeItem('empresa');
        }

        // Email
        if (responseData.EMAIL || responseData.email) {
            const email = responseData.EMAIL ? responseData.EMAIL : responseData.email;
            localStorage.setItem('email', email);
            console.log('[LOGIN] Guardado email:', email);
        }

        // Mostrar TODO el localStorage tras login
        console.log("[LOGIN] localStorage tras login:");
        for (let key in localStorage) {
            if (localStorage.hasOwnProperty(key)) {
                console.log(key, localStorage.getItem(key));
            }
        }

        modalLogin.style.display = "none";
        window.location.reload();
    } catch (error) {
        console.error('[LOGIN] Error en el login:', error);
        alert("Error al iniciar sesión: " + error.message);
        passwordInput.value = '';
    }
});