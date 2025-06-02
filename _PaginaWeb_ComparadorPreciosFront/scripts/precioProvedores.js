console.log("local: ", localStorage.getItem("idProducto"));

async function getPrecioProvedores() {
    const idProducto = localStorage.getItem("idProducto");
    if (!idProducto) {
        mostrarMensaje("No se ha encontrado el ID del producto.");
        return;
    }

    try {
        mostrarIndicadorCarga();

        // Cargar productos y valoraciones en paralelo
        const [productosResponse, valoracionesResponse] = await Promise.all([
            axios.get(`http://localhost:8084/productos/precios/provedor/${idProducto}`),
            axios.get(`http://localhost:8084/productos/valoraciones/${idProducto}`)
        ]);

        ocultarIndicadorCarga();

        // Procesar ofertas (sección derecha)
        if (!productosResponse.data || productosResponse.data.length === 0) {
            document.getElementById('tablaPrecioProductos').innerHTML =
                '<div class="mensaje-sistema">No se encontraron precios para este producto.</div>';
        } else {
            const contenedorPrecios = document.getElementById('tablaPrecioProductos');
            contenedorPrecios.innerHTML = '';

            for (const item of productosResponse.data) {
                const tarjetaPrecio = await crearTarjetaPrecio(item);
                contenedorPrecios.appendChild(tarjetaPrecio);
            }
        }

        // Procesar valoraciones (sección izquierda)
        mostrarValoraciones(valoracionesResponse.data);

    } catch (error) {
        console.error("Error al obtener datos:", error);
        ocultarIndicadorCarga();
        mostrarMensaje("Error al obtener datos. Inténtalo de nuevo más tarde.");
    }
}

// Función para mostrar valoraciones en la sección izquierda
function mostrarValoraciones(valoraciones) {
    const resumenContainer = document.getElementById('resumen-valoraciones');
    const todasContainer = document.getElementById('todas-valoraciones');

    if (!Array.isArray(valoraciones)) {
        resumenContainer.innerHTML = '<div class="error-valoraciones">Error cargando valoraciones</div>';
        todasContainer.innerHTML = '';
        return;
    }

    if (valoraciones.length === 0) {
        resumenContainer.innerHTML = '<div class="sin-valoraciones">Este producto no tiene valoraciones aún</div>';
        todasContainer.innerHTML = '';
        return;
    }

    // Calcular promedio
    const totalValoracion = valoraciones.reduce((acc, v) => acc + (v.valoracion ?? v.VALORACION ?? 0), 0);
    const media = (totalValoracion / valoraciones.length).toFixed(1);

    // Mostrar resumen
    resumenContainer.innerHTML = `
        <div class="estrellas-valoracion-grandes">
            ${generarEstrellas(media, true)}
            <div class="media-valoracion">${media} de 5</div>
            <div class="total-valoraciones">(${valoraciones.length} valoraciones)</div>
        </div>
    `;

    // Mostrar todas las valoraciones
    let html = '<h3>Opiniones de clientes</h3>';
    valoraciones.forEach(val => {
        const usuario = val.cliente?.username || val.username || val.USERNAME || "Anónimo";
        const opinion = val.opinion || val.OPINION || "Sin comentario";
        const valoracion = val.valoracion ?? val.VALORACION ?? 0;

        html += `
            <div class="opinion-completa">
                <div class="opinion-cabecera">
                    <span class="opinion-usuario">${usuario}</span>
                </div>
                <div class="opinion-estrellas">${generarEstrellas(valoracion)}</div>
                <div class="opinion-texto">${opinion}</div>
            </div>
        `;
    });

    todasContainer.innerHTML = html;
}

async function crearTarjetaPrecio(item) {
    const tarjeta = document.createElement('div');
    tarjeta.classList.add('tarjeta-precio');

    // Nombre del producto
    const nombre = document.createElement('h3');
    nombre.classList.add('producto-nombre');
    nombre.textContent = item.producto?.nombre ?? 'Producto sin nombre';
    tarjeta.appendChild(nombre);

    // Precio del proveedor
    const precioContainer = document.createElement('div');
    precioContainer.classList.add('precio-container');

    if (item.descuento && item.descuento > 0) {
        const precioOriginal = document.createElement('span');
        precioOriginal.classList.add('precio-original');
        precioOriginal.textContent = formatearPrecio(item.precioProvedor * (1 + item.descuento/100));

        const precioOferta = document.createElement('span');
        precioOferta.classList.add('precio-oferta');
        precioOferta.textContent = formatearPrecio(item.precioProvedor);

        const descuento = document.createElement('span');
        descuento.classList.add('descuento');
        descuento.textContent = `-${item.descuento}%`;

        precioContainer.appendChild(precioOriginal);
        precioContainer.appendChild(precioOferta);
        precioContainer.appendChild(descuento);
    } else {
        const precioNormal = document.createElement('span');
        precioNormal.classList.add('precio-normal');
        precioNormal.textContent = formatearPrecio(item.precioProvedor);
        precioContainer.appendChild(precioNormal);
    }

    tarjeta.appendChild(precioContainer);

    // Nombre de la empresa proveedora
    const empresa = document.createElement('div');
    empresa.classList.add('proveedor-info');
    empresa.textContent = `Proveedor: ${item.provedor?.empresa ?? 'Proveedor desconocido'}`;
    tarjeta.appendChild(empresa);

    // Botón de ver oferta
    const botonVerOferta = document.createElement('button');
    botonVerOferta.textContent = "Ver oferta";
    botonVerOferta.classList.add('btn-ver-oferta');
    tarjeta.appendChild(botonVerOferta);

    return tarjeta;
}

function generarEstrellas(puntuacion, grande = false) {
    const estrellasTotal = 5;
    puntuacion = Math.round(puntuacion);
    let html = '<div class="estrellas-container">';

    for (let i = 1; i <= estrellasTotal; i++) {
        const claseActiva = i <= puntuacion ? 'activa' : '';
        const claseGrande = grande ? 'grande' : '';
        html += `<span class="estrella ${claseActiva} ${claseGrande}">★</span>`;
    }

    html += '</div>';
    return html;
}

function formatearPrecio(precio) {
    return new Intl.NumberFormat('es-ES', { style: 'currency', currency: 'EUR' }).format(precio);
}

function mostrarIndicadorCarga() {
    const contenedor = document.getElementById('tablaPrecioProductos');
    if (!contenedor) return;
    contenedor.innerHTML = '<div class="cargando-precios">Cargando precios...</div>';
}

function ocultarIndicadorCarga() {
    const contenedor = document.getElementById('tablaPrecioProductos');
    if (!contenedor) return;
    const indicador = contenedor.querySelector('.cargando-precios');
    if (indicador) indicador.remove();
}

function mostrarMensaje(mensaje) {
    const contenedor = document.getElementById('tablaPrecioProductos');
    if (!contenedor) return;
    contenedor.innerHTML = `<div class="mensaje-sistema">${mensaje}</div>`;
}

// Muestra el botón solo si el usuario es proveedor y redirige a añadirPrecio.html al pulsar
function mostrarBotonSiProveedor() {
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    if (tipoUsuario === 'proveedor') {
        const btn = document.getElementById('btnAñadirPrecio');
        if (btn) {
            btn.style.display = 'inline-block';
            btn.onclick = function() {
                window.location.href = 'htmls/añadirPrecio.html';
            };
        }
    } else {
        // Si no es proveedor, ocultar 
        const btn = document.getElementById('btnAñadirPrecio');
        if (btn) btn.style.display = 'none';
    }
}

// OCULTA el bloque de añadir valoración si es proveedor
function ocultarValoracionSiProveedor() {
    const tipoUsuario = localStorage.getItem('tipoUsuario');
    const bloque = document.getElementById('bloqueAgregarValoracion');
    if (tipoUsuario === 'proveedor' && bloque) {
        bloque.style.display = 'none';
    }
}

document.addEventListener('DOMContentLoaded', function() {
    mostrarBotonSiProveedor();
    ocultarValoracionSiProveedor();
    getPrecioProvedores();
});