document.addEventListener('DOMContentLoaded', () => {
    if (!verificarSesion()) {
        console.warn('No hay sesión activa');
        return;
    }
    cargarDatosPerfil();
    inicializarBotonPrecios();
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

// ----------- NUEVO: Botón y modal para ver precios ofertados -----------
function inicializarBotonPrecios() {
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    const btnVerPrecios = document.getElementById('btnVerPrecios');
    if (btnVerPrecios && tipoUsuario === 'proveedor') {
        btnVerPrecios.style.display = 'inline-block';
        btnVerPrecios.addEventListener('click', mostrarPreciosOfertados);
    }
}

async function mostrarPreciosOfertados() {
    const idProveedor = localStorage.getItem('idProveedor');
    const listaPrecios = document.getElementById('listaPrecios');
    if (!idProveedor || !listaPrecios) return;

    try {
        let resp = await fetch(`http://localhost:8084/proveedor/precios/${idProveedor}`);
        if (resp.ok) {
            let precios = await resp.json();
            if (Array.isArray(precios) && precios.length > 0) {
                let html = precios.map(p =>
                  `<li>
                      Producto: ${p.producto?.nombre || ''} | Precio: ${p.precioProvedor}€
                      <button class="btn-eliminar-oferta" data-idpro="${p.idPro}" style="float:right; color: #fff; background: #e74c3c; border:none; border-radius:5px; margin-left:10px; padding:2px 10px; cursor:pointer;">
                        <i class="fa fa-trash"></i> Eliminar
                      </button>
                   </li>`
                ).join('');
                listaPrecios.innerHTML = html;

                // Añadir listeners a los nuevos botones
                document.querySelectorAll('.btn-eliminar-oferta').forEach(btn => {
                    btn.onclick = async function() {
                        const idPro = this.getAttribute('data-idpro');
                        if (confirm('¿Seguro que quieres eliminar esta oferta?')) {
                            try {
                                let resp = await fetch(`http://localhost:8084/proveedor/eliminar/precio/${idPro}`, {
                                    method: 'DELETE'
                                });
                                if (resp.ok) {
                                    mostrarPreciosOfertados();
                                } else {
                                    alert('No se pudo eliminar la oferta. Intenta de nuevo.');
                                }
                            } catch (e) {
                                alert('Error al eliminar la oferta.');
                            }
                        }
                    }
                });
            } else {
                listaPrecios.innerHTML = "<li>No tienes ningún precio ofertado.</li>";
            }
        } else {
            listaPrecios.innerHTML = "<li>No tienes ningún precio ofertado.</li>";
        }
    } catch (e) {
        listaPrecios.innerHTML = "<li>Error al cargar precios.</li>";
    }
    mostrarModalPrecios();
}

function mostrarModalPrecios() {
    const modal = document.getElementById('modalPrecios');
    if (modal) modal.style.display = 'flex';
}

function cerrarModalPrecios() {
    const modal = document.getElementById('modalPrecios');
    if (modal) modal.style.display = 'none';
}