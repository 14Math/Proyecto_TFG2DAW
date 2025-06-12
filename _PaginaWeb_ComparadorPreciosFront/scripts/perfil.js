document.addEventListener('DOMContentLoaded', () => {
    if (!verificarSesion()) {
        console.warn('No hay sesión activa');
        return;
    }
    cargarDatosPerfil();
    inicializarBotonPrecios();
    inicializarAdminUI();
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
    const empresaContainer = document.getElementById('profile-company-container');
    const empresaElement = document.getElementById('profile-company');

    if (usernameElement) usernameElement.textContent = localStorage.getItem('username') || 'Usuario';
    if (emailElement) emailElement.textContent = localStorage.getItem('email') || 'No especificado';

    if (typeElement) {
        if (tipoUsuario === 'proveedor') {
            typeElement.textContent = 'Proveedor';
        } else if (tipoUsuario === 'administrador') {
            typeElement.textContent = 'Administrador';
        } else {
            typeElement.textContent = 'Cliente';
        }
    }

    // Mostrar/ocultar datos de empresa según el tipo de usuario
    if (tipoUsuario === 'proveedor') {
        if (empresaContainer) empresaContainer.style.display = 'flex';
        if (empresaElement) empresaElement.textContent = localStorage.getItem('empresa') || 'No especificada';
    } else {
        if (empresaContainer) empresaContainer.style.display = 'none';
    }
}

function cerrarSesion() {
    [
        'username',
        'tipoUsuario',
        'email',
        'empresa',
        'favoritos_temp',
        'idCliente',
        'idProveedor',
        'idAdmin'
    ].forEach(item => {
        localStorage.removeItem(item);
    });
    window.location.href = '../index.html';
}

function inicializarBotonPrecios() {
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    const btnVerPrecios = document.getElementById('btnVerPrecios');
    if (btnVerPrecios && tipoUsuario === 'proveedor') {
        btnVerPrecios.style.display = 'inline-block';
        btnVerPrecios.addEventListener('click', mostrarPreciosOfertados);
    } else if (btnVerPrecios) {
        btnVerPrecios.style.display = 'none';
    }
}

// ----------- NUEVO: ADMINISTRADOR -----------
function inicializarAdminUI() {
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    const btnEditarPerfil = document.getElementById('boton-editar-perfil');
    const btnVerUsuarios = document.getElementById('btnVerUsuarios');
    if (tipoUsuario === 'administrador') {
        // Oculta botón editar perfil
        if (btnEditarPerfil) btnEditarPerfil.style.display = 'none';
        // Muestra botón ver usuarios
        if (btnVerUsuarios) {
            btnVerUsuarios.style.display = 'inline-block';
            btnVerUsuarios.addEventListener('click', () => {
                mostrarModalUsuarios('cliente');
            });
        }
        // Modal cerrar
        const modalUsuarios = document.getElementById('modalUsuarios');
        const cerrarModalUsuarios = document.getElementById('cerrarModalUsuarios');
        if (cerrarModalUsuarios) {
            cerrarModalUsuarios.onclick = () => modalUsuarios.style.display = "none";
        }
        window.onclick = function (event) {
            if (event.target === modalUsuarios) {
                modalUsuarios.style.display = "none";
            }
        };
        // Botones de filtro en el modal
        document.getElementById('btnMostrarClientes').onclick = () => mostrarModalUsuarios('cliente');
        document.getElementById('btnMostrarProveedores').onclick = () => mostrarModalUsuarios('proveedor');
    } else {
        if (btnVerUsuarios) btnVerUsuarios.style.display = 'none';
        if (btnEditarPerfil) btnEditarPerfil.style.display = '';
    }
}

async function mostrarModalUsuarios(tipo) {
    const modalUsuarios = document.getElementById('modalUsuarios');
    const listaUsuarios = document.getElementById('listaUsuarios');
    const titulo = document.getElementById('tituloModalUsuarios');
    // Filtros activos
    document.getElementById('btnMostrarClientes').classList.toggle('active', tipo === 'cliente');
    document.getElementById('btnMostrarProveedores').classList.toggle('active', tipo === 'proveedor');
    titulo.textContent = tipo === 'cliente' ? "Lista de Clientes" : "Lista de Proveedores";
    // API
    let url, nombreCampo, emailCampo, idCampo, extraInfo, avatarIcon;
    if (tipo === 'cliente') {
        url = "http://localhost:8084/administrador/todos/clientes";
        nombreCampo = 'username';
        emailCampo = 'email';
        idCampo = 'idCliente';
        extraInfo = '';
        avatarIcon = '<i class="fa fa-user"></i>';
    } else {
        url = "http://localhost:8084/administrador/todos/proveedores";
        nombreCampo = 'username';
        emailCampo = 'email';
        idCampo = 'idProvedor';
        extraInfo = ' | Empresa: ';
        avatarIcon = '<i class="fa fa-briefcase"></i>';
    }
    listaUsuarios.innerHTML = "<li>Cargando...</li>";
    try {
        const resp = await fetch(url);
        if (resp.ok) {
            const data = await resp.json();
            if (Array.isArray(data) && data.length > 0) {
                listaUsuarios.innerHTML = data.map(user => `
                  <li>
                    <span class="usuario-info">
                      <span class="usuario-avatar" title="${tipo === 'cliente' ? 'Cliente' : 'Proveedor'}">${avatarIcon}</span>
                      <span>
                        <b>${user[nombreCampo]}</b><br>
                        <span style="font-size:0.97em; color:#888;">${user[emailCampo]}</span>
                        ${extraInfo ? `<br><span style="font-size:0.96em; color:#666;">${extraInfo + (user.empresa || '')}</span>` : ''}
                      </span>
                    </span>
                    <button class="btn-eliminar-usuario" data-id="${user[idCampo]}" data-tipo="${tipo}" title="Eliminar usuario">
                      <i class="fa fa-trash"></i>
                    </button>
                  </li>
                `).join('');
                // Listeners de eliminar usuario
                document.querySelectorAll('.btn-eliminar-usuario').forEach(btn => {
                    btn.onclick = async function() {
                        const id = this.getAttribute('data-id');
                        const tipoUsuario = this.getAttribute('data-tipo');
                        if (confirm('¿Seguro que quieres eliminar este usuario?')) {
                            let deleteUrl = tipoUsuario === 'cliente'
                                ? `http://localhost:8084/administrador/clientes/eliminar/${id}`
                                : `http://localhost:8084/administrador/proveedor/eliminar/${id}`;
                            try {
                                let resp = await fetch(deleteUrl, { method: 'DELETE' });
                                if (resp.ok) {
                                    mostrarModalUsuarios(tipoUsuario);
                                } else {
                                    alert('No se pudo eliminar el usuario. Intenta de nuevo.');
                                }
                            } catch (e) {
                                alert('Error al eliminar el usuario.');
                            }
                        }
                    }
                });
            } else {
                listaUsuarios.innerHTML = `<li style="text-align:center;color:#888;">No hay ${tipo === 'cliente' ? 'clientes' : 'proveedores'} registrados.</li>`;
            }
        } else {
            listaUsuarios.innerHTML = `<li style="text-align:center;color:#888;">Error al cargar usuarios.</li>`;
        }
    } catch (e) {
        listaUsuarios.innerHTML = `<li style="text-align:center;color:#888;">Error al cargar usuarios.</li>`;
    }
    modalUsuarios.style.display = "flex";
}

// ----------- Botón y modal para ver precios ofertados (proveedor) -----------
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
                    btn.onclick = async function () {
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