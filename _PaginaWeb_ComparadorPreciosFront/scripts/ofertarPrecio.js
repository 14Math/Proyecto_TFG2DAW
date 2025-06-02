document.addEventListener('DOMContentLoaded', async function() {
    // 1. Obtener datos del producto seleccionado
    const idProducto = localStorage.getItem('idProducto');
    const inputProducto = document.getElementById('nombreProducto');
    let nombreProducto = "Producto seleccionado";

    console.log("[DEBUG] idProducto en localStorage:", idProducto);

    if (idProducto) {
        try {
            const res = await fetch(`http://localhost:8084/productos/buscar/${idProducto}`);
            console.log("[DEBUG] Fetch producto status:", res.status);
            if (res.ok) {
                const data = await res.json();
                console.log("[DEBUG] Respuesta del backend producto:", data);
                nombreProducto = data.nombre || nombreProducto;
            } else {
                console.log("[ERROR] No se pudo obtener el producto. Status:", res.status);
            }
        } catch (e) {
            console.log("[ERROR] Excepción al obtener producto:", e);
        }
        inputProducto.value = nombreProducto;
        console.log("[DEBUG] Nombre del producto mostrado:", inputProducto.value);
    } else {
        inputProducto.value = "(Sin producto seleccionado)";
        console.log("[DEBUG] No hay idProducto, se muestra aviso");
    }

    // 2. Obtener y mostrar la empresa del proveedor (como la guarda tu login)
    const empresa = localStorage.getItem('empresa');
    const inputProveedor = document.getElementById('nombreProveedor');
    console.log("[DEBUG] empresa en localStorage:", empresa);
    inputProveedor.value = empresa ? empresa : "(Sin proveedor)";
    console.log("[DEBUG] Nombre de empresa mostrado:", inputProveedor.value);

    // El id del proveedor (como lo guarda tu login.js)
    const idProveedor = localStorage.getItem('idProveedor');
    console.log("[DEBUG] idProveedor en localStorage:", idProveedor);

    // 3. Botón Volver atrás
    const btnVolver = document.getElementById('btnVolverAtras');
    if (btnVolver) {
        btnVolver.addEventListener('click', function() {
            // Puedes usar history.back() si quieres volver exactamente a la página anterior,
            // o ir a una página concreta:
            // window.history.back();
            window.location.href = "../precioProvedores.html";
        });
    }

    // 4. Manejo del formulario
    document.getElementById('formAñadirPrecio').addEventListener('submit', async function(e) {
        e.preventDefault();

        const precioProveedor = parseFloat(document.getElementById('precioProveedor').value);
        const mensajeDiv = document.getElementById('mensaje');
        const tipoUsuario = localStorage.getItem('tipoUsuario');

        // Validaciones
        if (!idProducto) {
            mensajeDiv.textContent = 'No se ha seleccionado producto.';
            mensajeDiv.style.color = 'var(--danger)';
            console.log("[ERROR] No se ha seleccionado producto.");
            return;
        }
        if (!empresa || !idProveedor) {
            mensajeDiv.textContent = 'No se ha detectado proveedor logueado.';
            mensajeDiv.style.color = 'var(--danger)';
            console.log("[ERROR] Falta empresa o idProveedor.");
            return;
        }
        if (tipoUsuario !== 'proveedor') {
            mensajeDiv.textContent = 'Solo los proveedores pueden añadir precios.';
            mensajeDiv.style.color = 'var(--danger)';
            console.log("[ERROR] Tipo de usuario no es proveedor:", tipoUsuario);
            return;
        }
        if (isNaN(precioProveedor) || precioProveedor <= 0) {
            mensajeDiv.textContent = 'Por favor, introduzca un precio válido mayor que 0.';
            mensajeDiv.style.color = 'var(--danger)';
            console.log("[ERROR] Precio introducido no válido:", precioProveedor);
            return;
        }

        // Objeto ajustado según el DTO que espera tu backend
        const data = {
            precioProveedor: precioProveedor,
            idProducto: Number(idProducto),
            idProveedor: Number(idProveedor)
        };
        console.log("[DEBUG] Objeto enviado al backend:", data);

        try {
            const response = await fetch(`http://localhost:8084/productos/alta/ofertarPrecio`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data)
            });

            console.log("[DEBUG] Respuesta POST añadirPrecio status:", response.status);

            if (response.ok) {
                mensajeDiv.textContent = 'Precio añadido correctamente al producto. Redirigiendo...';
                mensajeDiv.style.color = 'green';
                document.getElementById('precioProveedor').value = '';
                setTimeout(() => {
                    window.location.href = "../precioProvedores.html";
                }, 1200); // Puedes ajustar el tiempo si quieres
            } else {
                const err = await response.text();
                mensajeDiv.textContent = 'Error al añadir precio: ' + err;
                mensajeDiv.style.color = 'var(--danger)';
                console.log("[ERROR] Error al añadir precio:", err);
            }
        } catch (error) {
            mensajeDiv.textContent = 'Error de conexión con el servidor.';
            mensajeDiv.style.color = 'var(--danger)';
            console.log("[ERROR] Error de conexión:", error);
        }
    });
});