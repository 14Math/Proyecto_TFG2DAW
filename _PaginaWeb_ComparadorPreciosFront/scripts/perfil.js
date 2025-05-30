// PERFIL DE USUARIO (MUESTRA DATOS)

document.addEventListener('DOMContentLoaded', () => {
    if (!verificarSesion()) {
        console.warn('No hay sesión activa');
        return;
    }
    cargarDatosPerfil();
    const btnCerrarSesion = document.getElementById('boton-cerrar-sesion');
    if (btnCerrarSesion) {
        btnCerrarSesion.addEventListener('click', cerrarSesion);
    }
});

function verificarSesion() {
    return localStorage.getItem('tipoUsuario') && localStorage.getItem('username');
}

function cargarDatosPerfil() {
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    const usernameElement = document.getElementById('profile-username');
    const emailElement = document.getElementById('profile-email');
    const typeElement = document.getElementById('profile-type');
    if (usernameElement) usernameElement.textContent = localStorage.getItem('username') || 'Usuario';
    if (emailElement) emailElement.textContent = localStorage.getItem('email') || 'No especificado';
    if (typeElement) typeElement.textContent = tipoUsuario === 'proveedor' ? 'Proveedor' : 'Cliente';
    if (tipoUsuario === 'proveedor') {
        const empresaContainer = document.getElementById('profile-company-container');
        const empresaElement = document.getElementById('profile-company');
        if (empresaContainer) empresaContainer.style.display = 'flex';
        if (empresaElement) empresaElement.textContent = localStorage.getItem('empresa') || 'No especificada';
    }
}

function cerrarSesion() {
    ['username', 'tipoUsuario', 'email', 'empresa', 'favoritos_temp', 'idCliente', 'idProveedor'].forEach(item => {
        localStorage.removeItem(item);
    });
    window.location.href = '../index.html';
}