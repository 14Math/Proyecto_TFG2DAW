// ----------- Mostrar botón y funcionalidad de "Añadir producto" SOLO ADMIN -----------

document.addEventListener('DOMContentLoaded', () => {
    mostrarBotonAddProductoSoloAdmin();
    inicializarModalAddProducto();
    inicializarFormularioAddProducto();
});

// Muestra el botón solo si es administrador
function mostrarBotonAddProductoSoloAdmin() {
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    const btnAddProducto = document.getElementById('btnAddProducto');
    if (btnAddProducto) {
        if (tipoUsuario === 'administrador') {
            btnAddProducto.style.display = 'inline-block';
        } else {
            btnAddProducto.style.display = 'none';
        }
    }
}

// Inicializa los listeners para abrir/cerrar el modal
function inicializarModalAddProducto() {
    const btnAddProducto = document.getElementById('btnAddProducto');
    const modal = document.getElementById('modalAddProducto');
    const cerrar = document.getElementById('cerrarModalAddProducto');
    if (btnAddProducto && modal) {
        btnAddProducto.onclick = async function () {
            modal.style.display = 'flex';
            await cargarCategorias();
        };
    }
    if (cerrar && modal) {
        cerrar.onclick = () => modal.style.display = 'none';
    }
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
}

// Carga las categorías al abrir el modal
async function cargarCategorias() {
    const select = document.getElementById('categoriaProducto');
    if (!select) return;
    select.innerHTML = '<option value="">Cargando...</option>';
    try {
        // Ajusta la URL según tu backend
        const resp = await fetch('http://localhost:8084/categorias/todos/');
        if (resp.ok) {
            const data = await resp.json();
            select.innerHTML = '<option value="">Seleccione una categoría</option>';
            data.forEach(cat => {
                select.innerHTML += `<option value="${cat.idCategoria}">${cat.nombre}</option>`;
            });
        } else {
            select.innerHTML = '<option value="">Error al cargar</option>';
        }
    } catch (e) {
        select.innerHTML = '<option value="">Error de red</option>';
    }
}

// Envía el formulario de producto con imagen en base64
function inicializarFormularioAddProducto() {
    const form = document.getElementById('formAddProducto');
    if (form) {
        form.onsubmit = async function (e) {
            e.preventDefault();
            const msg = document.getElementById('addProductoMsg');
            msg.textContent = '';
            msg.style.color = '';
            const imagenInput = document.getElementById('imagenProducto');
            if (!imagenInput.files.length) {
                msg.textContent = 'Debe seleccionar una imagen.';
                msg.style.color = 'red';
                return;
            }
            const file = imagenInput.files[0];
            if (!file.type.match(/^image\/jpeg$/)) {
                msg.textContent = 'La imagen debe ser JPG.';
                msg.style.color = 'red';
                return;
            }

            // Lee la imagen como base64
            const reader = new FileReader();
            reader.onload = async function () {
                const base64String = reader.result.split(',')[1];

                // Construye el objeto igual que en Postman
                const producto = {
                    nombre: document.getElementById('nombreProducto').value,
                    marca: document.getElementById('marcaProducto').value,
                    autor: document.getElementById('autorProducto').value,
                    descripcion: document.getElementById('descripcionProducto').value,
                    precioVenta: parseFloat(document.getElementById('precioProducto').value),
                    categorias: { idCategoria: parseInt(document.getElementById('categoriaProducto').value) },
                    imagenBase64: base64String
                };

                try {
                    const resp = await fetch('http://localhost:8084/administrador/añadir', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify(producto)
                    });
                    if (resp.ok) {
                        msg.style.color = 'green';
                        msg.textContent = 'Producto añadido correctamente.';
                        form.reset();
                        setTimeout(() => {
                            msg.textContent = '';
                            document.getElementById('modalAddProducto').style.display = 'none';
                        }, 1200);
                    } else {
                        msg.style.color = 'red';
                        msg.textContent = 'Error al añadir producto.';
                    }
                } catch (e) {
                    msg.style.color = 'red';
                    msg.textContent = 'Error de red al añadir producto.';
                }
            };
            reader.readAsDataURL(file);
        };
    }
}