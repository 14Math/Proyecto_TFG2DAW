document.addEventListener('DOMContentLoaded', () => {
    const modal = document.getElementById('modalEditarPerfil');
    const btnEditarPerfil = document.getElementById('boton-editar-perfil');
    const btnCerrarModal = document.getElementById('cerrarModalEditarPerfil');
    const formEditarPerfil = document.getElementById('form-editar-perfil');
    const inputEmpresaContainer = document.getElementById('input-empresa-container');

    // Mostrar modal con datos actuales
    btnEditarPerfil.addEventListener('click', () => {
        document.getElementById('input-username').value = localStorage.getItem('username') || '';
        document.getElementById('input-email').value = localStorage.getItem('email') || '';
        document.getElementById('input-password').value = '';
        if (localStorage.getItem('tipoUsuario') === 'proveedor') {
            inputEmpresaContainer.style.display = '';
            document.getElementById('input-empresa').value = localStorage.getItem('empresa') || '';
        } else {
            inputEmpresaContainer.style.display = 'none';
        }
        modal.style.display = 'block';
    });

    // Cerrar modal funciones
    btnCerrarModal.addEventListener('click', () => { modal.style.display = 'none'; });
    window.addEventListener('click', (event) => {
        if (event.target === modal) modal.style.display = 'none';
    });

    // Enviar edición de perfil
    formEditarPerfil.addEventListener('submit', async (e) => {
        e.preventDefault();

        const tipoUsuario = localStorage.getItem('tipoUsuario');
        let url, datos;
        let passwordValue = document.getElementById('input-password').value;

        if (tipoUsuario === 'proveedor') {
            // Prepara el JSON para proveedor EXACTAMENTE como espera el backend
            url = 'http://localhost:8084/proveedor/modificar';
            datos = {
                idProvedor: Number(localStorage.getItem('idProveedor')),
                username: document.getElementById('input-username').value,
                password: passwordValue ? passwordValue : localStorage.getItem('password') || "defaultPassword", // Nunca vacío
                email: document.getElementById('input-email').value,
                empresa: document.getElementById('input-empresa').value,
                // Si tu backend requiere fechaRegistro, ponerlo aquí:
                // fechaRegistro: localStorage.getItem('fechaRegistro') || "2023-01-01"
            };
        } else if (tipoUsuario === 'cliente') {
            // Prepara el JSON para cliente EXACTAMENTE como espera el backend
            url = 'http://localhost:8084/cliente/modificar';
            datos = {
                idCliente: Number(localStorage.getItem('idCliente')),
                username: document.getElementById('input-username').value,
                password: passwordValue ? passwordValue : localStorage.getItem('password') || "defaultPassword",
                email: document.getElementById('input-email').value,
                nombre: document.getElementById('input-username').value,
                // fechaRegistro: localStorage.getItem('fechaRegistro') || "2023-01-01"
            };
        } else {
            alert('No se detectó el tipo de usuario.');
            return;
        }

        // Muestra el JSON que se va a enviar
        console.log("[EDITAR PERFIL] JSON a enviar:", JSON.stringify(datos));

        try {
            const response = await fetch(url, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(datos)
            });
            console.log("[EDITAR PERFIL] Código de respuesta:", response.status);

            const contentType = response.headers.get('content-type');
            if (contentType && contentType.includes('application/json')) {
                const data = await response.json();
                console.log("[EDITAR PERFIL] Respuesta del backend:", data);
                alert("Perfil editado correctamente.");
                // Actualizar localStorage para que el perfil se vea actualizado
                localStorage.setItem('username', datos.username);
                localStorage.setItem('email', datos.email);
                if (tipoUsuario === 'proveedor') localStorage.setItem('empresa', datos.empresa);
                modal.style.display = 'none';
                window.location.reload();
            } else {
                alert("Perfil editado correctamente (sin respuesta JSON).");
                modal.style.display = 'none';
                window.location.reload();
            }
        } catch (error) {
            console.error("[EDITAR PERFIL] Error al editar perfil:", error);
            alert("Hubo un error al editar el perfil.");
        }
    });
});