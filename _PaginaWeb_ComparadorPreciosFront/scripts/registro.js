// -------------------- Función de Registro --------------------
async function registrarUsuario(event) {
    event.preventDefault();

    // Capturar los valores de los inputs del formulario
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value;
    const email = document.getElementById('email').value.trim();
    const tipoUsuario = document.getElementById('tipoUsuarioRegistro').value; // Cliente o Proveedor
    const empresa = document.getElementById('empresa') ? document.getElementById('empresa').value.trim() : null;

    // Validar que los campos no estén vacíos
    if (!username || !password || !email || !tipoUsuario) {
        alert("Por favor, completa todos los campos.");
        return;
    }

    if (tipoUsuario === "proveedor" && !empresa) {
        alert("Por favor, completa el campo de Empresa.");
        return;
    }

    // Definir la URL según el tipo de usuario
    const url = `http://localhost:8084/${tipoUsuario}/alta`;

    try {
        // Realizar la solicitud POST al servidor
        const bodyData = tipoUsuario === "proveedor" 
            ? { username, password, email, empresa } 
            : { username, password, email };

        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(bodyData),
        });

        // Verificar si la solicitud fue exitosa
        if (!response.ok) {
            const errorMessage = await response.text();
            throw new Error(errorMessage || 'Error en el registro');
        }

        const responseData = await response.json();
        console.log('Registro exitoso:', responseData);

        // Mostrar mensaje de éxito y redirigir a la página de inicio (index.html)
        alert("Usuario registrado exitosamente.");
        window.location.href = "../index.html"; // Cambiar a la página principal
    } catch (error) {
        console.error('Error en el registro:', error);
        alert("Error al registrar usuario: " + error.message);
    }
}

// -------------------- Mostrar Campo Empresa Dinámicamente --------------------
document.addEventListener('DOMContentLoaded', () => {
    const tipoUsuarioSelect = document.getElementById('tipoUsuarioRegistro');
    const registroForm = document.getElementById('registroForm');

    if (tipoUsuarioSelect && registroForm) {
        tipoUsuarioSelect.addEventListener('change', () => {
            const empresaField = document.getElementById('empresaField');

            if (tipoUsuarioSelect.value === "proveedor") {
                // Si no existe el campo de empresa, lo agregamos
                if (!empresaField) {
                    const newField = document.createElement('div');
                    newField.id = 'empresaField';
                    newField.classList.add('input-box');
                    newField.innerHTML = `
                        <input type="text" id="empresa" placeholder="Nombre de la Empresa" required>
                        <i class='bx bxs-briefcase'></i>
                    `;
                    registroForm.insertBefore(newField, registroForm.querySelector('button[type="submit"]'));
                }
            } else {
                // Si selecciona "Cliente", eliminamos el campo de empresa si existe
                if (empresaField) {
                    empresaField.remove();
                }
            }
        });
    }

    // Asignar el evento submit al formulario
    if (registroForm) {
        registroForm.addEventListener('submit', registrarUsuario);
    }
});
// -------------------- Mostrar Campo Empresa Dinámicamente --------------------
document.addEventListener('DOMContentLoaded', () => {
    // Mostrar Campo Empresa Dinámicamente
    const tipoUsuarioSelect = document.getElementById('tipoUsuarioRegistro');
    const empresaField = document.getElementById('empresaField');

    tipoUsuarioSelect.addEventListener('change', () => {
        if (tipoUsuarioSelect.value === "proveedor") {
            empresaField.classList.remove('hidden');
        } else {
            empresaField.classList.add('hidden');
        }
    });
});