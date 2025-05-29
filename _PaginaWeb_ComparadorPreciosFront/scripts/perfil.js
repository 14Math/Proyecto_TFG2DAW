document.addEventListener('DOMContentLoaded', () => {
    // Verificar sesión
    const idUsuario = localStorage.getItem('idCliente') || localStorage.getItem('idProveedor');
    if (!idUsuario) {
        window.location.href = '../index.html';
        return;
    }

    // Cargar datos del perfil
    cargarDatosPerfil();

    // Configurar cerrar sesión
    const btnCerrarSesion = document.getElementById('boton-cerrar-sesion');
    if (btnCerrarSesion) {
        btnCerrarSesion.addEventListener('click', cerrarSesion);
    }
});

async function cargarDatosPerfil() {
    const idUsuario = localStorage.getItem('idCliente') || localStorage.getItem('idProveedor');
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    
    if (!idUsuario || !tipoUsuario) return;

    try {
        // Solo mostrar datos de localStorage
        document.getElementById('profile-username').textContent = localStorage.getItem('username') || 'Usuario';
        document.getElementById('profile-email').textContent = localStorage.getItem('email') || 'No especificado';
        document.getElementById('profile-type').textContent = tipoUsuario === 'proveedor' ? 'Proveedor' : 'Cliente';
        
        if (tipoUsuario === 'proveedor') {
            const empresaContainer = document.getElementById('profile-company-container');
            if (empresaContainer) {
                empresaContainer.style.display = 'flex';
                document.getElementById('profile-company').textContent = localStorage.getItem('empresa') || 'No especificada';
            }
        }
    } catch (error) {
        console.error('Error al cargar perfil:', error);
    }
}

function cerrarSesion() {
    // Limpiar localStorage
    localStorage.removeItem('idCliente');
    localStorage.removeItem('idProveedor');
    localStorage.removeItem('username');
    localStorage.removeItem('email');
    localStorage.removeItem('tipoUsuario');
    localStorage.removeItem('empresa');
    
    // Redirigir al inicio
    window.location.href = '../index.html';
}