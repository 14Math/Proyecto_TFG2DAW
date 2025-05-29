// Mostrar botón "Editar perfil" solo si el usuario está logueado
function inicializarEditarPerfil() {
    const idUsuario = localStorage.getItem('idCliente') || localStorage.getItem('idProveedor');
    const botonEditarPerfil = document.getElementById('boton-editar-perfil');
    const modal = document.getElementById('modalEditarPerfil');

    if (!idUsuario) return;

    // Abrir modal con datos actuales
    if (botonEditarPerfil) {
        botonEditarPerfil.addEventListener('click', () => {
            if (modal) {
                // Precargar datos
                document.getElementById('input-username').value = localStorage.getItem('username') || '';
                document.getElementById('input-email').value = localStorage.getItem('email') || '';
                document.getElementById('input-password').value = '';
                
                // Mostrar empresa si es proveedor
                const empresaContainer = document.getElementById('input-empresa-container');
                if (localStorage.getItem('tipoUsuario') === 'proveedor') {
                    empresaContainer.style.display = 'block';
                    document.getElementById('input-empresa').value = localStorage.getItem('empresa') || '';
                } else {
                    empresaContainer.style.display = 'none';
                }
                
                modal.style.display = 'block';
            }
        });
    }

    // Cerrar modal
    const cerrarModal = document.getElementById('cerrarModalEditarPerfil');
    if (cerrarModal) {
        cerrarModal.addEventListener('click', () => {
            if (modal) modal.style.display = 'none';
        });
    }

    // Enviar formulario
    const formEditar = document.getElementById('form-editar-perfil');
    if (formEditar) {
        formEditar.addEventListener('submit', async function(e) {
            e.preventDefault();
            
            const btn = formEditar.querySelector('button[type="submit"]');
            const btnOriginalText = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Guardando...';
            btn.disabled = true;

            try {
                const tipoUsuario = localStorage.getItem('tipoUsuario');
                const idUsuario = tipoUsuario === 'proveedor' 
                    ? localStorage.getItem('idProveedor') 
                    : localStorage.getItem('idCliente');

                const datos = {
                    username: document.getElementById('input-username').value.trim(),
                    email: document.getElementById('input-email').value.trim(),
                    password: document.getElementById('input-password').value || undefined
                };

                if (tipoUsuario === 'proveedor') {
                    datos.empresa = document.getElementById('input-empresa').value.trim();
                    datos.idProveedor = Number(idUsuario);
                } else {
                    datos.idCliente = Number(idUsuario);
                }

                const endpoint = tipoUsuario === 'proveedor'
                    ? 'http://localhost:8084/proveedor/modificar'
                    : 'http://localhost:8084/cliente/modificar';

                const response = await fetch(endpoint, {
                    method: 'PUT',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify(datos)
                });

                if (!response.ok) {
                    const error = await response.json();
                    throw new Error(error.message || 'Error al actualizar');
                }

                const resultado = await response.json();
                alert('Perfil actualizado correctamente!');
                
                // Actualizar localStorage
                localStorage.setItem('username', resultado.username);
                localStorage.setItem('email', resultado.email);
                if (resultado.empresa) localStorage.setItem('empresa', resultado.empresa);
                
                // Cerrar modal y recargar
                modal.style.display = 'none';
                setTimeout(() => window.location.reload(), 500);

            } catch (error) {
                console.error('Error:', error);
                alert('Error: ' + error.message);
            } finally {
                btn.innerHTML = btnOriginalText;
                btn.disabled = false;
            }
        });
    }

    // Cerrar al hacer clic fuera
    window.addEventListener('click', (e) => {
        if (e.target === modal) modal.style.display = 'none';
    });
}

// Esperar a que cargue el DOM
document.addEventListener('DOMContentLoaded', inicializarEditarPerfil);