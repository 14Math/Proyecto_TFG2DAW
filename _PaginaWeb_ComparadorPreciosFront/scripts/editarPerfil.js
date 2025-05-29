// Mostrar botón "Editar perfil" solo si el usuario está logueado
document.addEventListener('DOMContentLoaded', () => {
    const idCliente = localStorage.getItem('idCliente');
    const botonEditarPerfil = document.getElementById('boton-editar-perfil');
    const btnCerrarSesion = document.getElementById('boton-cerrar-sesion');
    const elementoUsername = document.getElementById('elemento-username');

    // Si el usuario está logueado, muestra el botón de cerrar sesión y editar perfil con el nombre
    if (idCliente) {
        if (botonEditarPerfil) botonEditarPerfil.style.display = 'inline-block';
        if (btnCerrarSesion) btnCerrarSesion.style.display = 'inline-block';
        if (elementoUsername) elementoUsername.textContent = localStorage.getItem('username');
        // Oculta el de login/registro
        document.getElementById('abrirModalLogin').style.display = 'none';
    } else {
        if (botonEditarPerfil) botonEditarPerfil.style.display = 'none';
        if (btnCerrarSesion) btnCerrarSesion.style.display = 'none';
        document.getElementById('abrirModalLogin').style.display = 'inline-block';
    }

    // Abrir el modal de editar perfil
    if (botonEditarPerfil) {
        botonEditarPerfil.addEventListener('click', () => {
            const modal = document.getElementById('modalEditarPerfil');
            if (modal) {
                // Precargar los datos actuales
                document.getElementById('input-username').value = localStorage.getItem('username') || '';
                document.getElementById('input-email').value = localStorage.getItem('email') || '';
                document.getElementById('input-password').value = '';
                modal.style.display = 'block';
            }
        });
    }

    // Cerrar modal de editar perfil
    const cerrarModal = document.getElementById('cerrarModalEditarPerfil');
    if (cerrarModal) {
        cerrarModal.addEventListener('click', () => {
            document.getElementById('modalEditarPerfil').style.display = 'none';
        });
    }

    // Enviar formulario de editar perfil
    const formEditar = document.getElementById('form-editar-perfil');
    if (formEditar) {
        formEditar.addEventListener('submit', async function(event) {
            event.preventDefault();

            const nuevoUsername = document.getElementById('input-username').value.trim();
            const nuevoEmail = document.getElementById('input-email').value.trim();
            const nuevaPassword = document.getElementById('input-password').value;

            if (!idCliente || !nuevoUsername || !nuevoEmail) {
                alert('Por favor, completa todos los campos obligatorios.');
                return;
            }

            const datosActualizacion = {
                idCliente: Number(idCliente),
                username: nuevoUsername,
                email: nuevoEmail
            };
            if (nuevaPassword && nuevaPassword.trim() !== "") {
                datosActualizacion.password = nuevaPassword;
            }

            try {
                const response = await fetch('http://localhost:8084/cliente/modificar', {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(datosActualizacion)
                });

                if (response.ok) {
                    const clienteActualizado = await response.json();
                    alert('Perfil actualizado con éxito.');
                    // Actualiza localStorage
                    localStorage.setItem('username', clienteActualizado.username);
                    localStorage.setItem('email', clienteActualizado.email);
                    // Cierra el modal
                    document.getElementById('modalEditarPerfil').style.display = 'none';
                    // Actualiza nombre en header
                    if (elementoUsername) elementoUsername.textContent = clienteActualizado.username;
                } else {
                    const errorMsg = await response.text();
                    alert('Error al actualizar perfil: ' + errorMsg);
                }
            } catch (error) {
                alert('Error de conexión con el servidor.');
                console.error(error);
            }
        });
    }

    // Cierra el modal si se hace click fuera del contenido
    window.onclick = function(event) {
        const modal = document.getElementById('modalEditarPerfil');
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };
});