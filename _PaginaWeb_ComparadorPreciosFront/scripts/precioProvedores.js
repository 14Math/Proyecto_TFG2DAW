// console.log("local: ", localStorage.getItem("id"));
// async function getPrecioProvedores() {
//     let productos = await axios.get(`http://localhost:8084/productos/precios/provedor/${localStorage.getItem("id")}`);
//     console.log("los productos: ", productos.data);

//     let tablaProductos = document.getElementById('tablaPrecioProductos');
//     console.log(tablaProductos);

//     // Crear la estructura de la tabla fuera del bucle
//     let tabla = document.createElement('table');
//     let thead = tabla.insertRow();
//     thead.insertCell().textContent = "Nombre";
//     thead.insertCell().textContent = "Precio proveedor";
//     thead.insertCell().textContent = "Empresa";

//     let tbody = tabla.appendChild(document.createElement('tbody'));

//     productos.data.forEach(item => {
//         console.log(item);

//         // Crear una nueva fila para cada producto
//         let row = tbody.insertRow();
//         row.insertCell().textContent = item.producto.nombre;
//         row.insertCell().textContent = item.precioProvedor + "€";
//         row.insertCell().textContent = item.provedor.empresa;

//     });

//     // Agregar la tabla completa al DOM una vez que se han agregado todas las filas
//     tablaProductos.appendChild(tabla);


// }

// getPrecioProvedores();
console.log("local: ", localStorage.getItem("id"));

async function getPrecioProvedores() {
    try {
        mostrarIndicadorCarga(); // Mostrar indicador de carga

        const productos = await axios.get(`http://localhost:8084/productos/precios/provedor/${localStorage.getItem("id")}`);
        console.log("los productos: ", productos.data);

        ocultarIndicadorCarga(); // Ocultar indicador de carga

        if (!productos.data || productos.data.length === 0) {
            mostrarMensaje("No se encontraron precios para este producto.");
            return;
        }

        const contenedorPrecios = document.getElementById('tablaPrecioProductos');
        contenedorPrecios.innerHTML = ''; // Limpiar contenido anterior

        productos.data.forEach(item => {
            const tarjetaPrecio = crearTarjetaPrecio(item);
            contenedorPrecios.appendChild(tarjetaPrecio);
        });
    } catch (error) {
        console.error("Error al obtener precios:", error);
        ocultarIndicadorCarga();
        mostrarMensaje("Error al obtener precios. Inténtalo de nuevo más tarde.");
    }
}

function crearTarjetaPrecio(item) {
    const tarjeta = document.createElement('div');
    tarjeta.classList.add('tarjeta-precio');

    const nombre = document.createElement('h3');
    nombre.textContent = item.producto.nombre;
    tarjeta.appendChild(nombre);

    const precio = document.createElement('div');
    precio.classList.add('precio');
    precio.textContent = formatearPrecio(item.precioProvedor);
    tarjeta.appendChild(precio);

    const empresa = document.createElement('div');
    empresa.classList.add('empresa');
    empresa.textContent = item.provedor.empresa;
    tarjeta.appendChild(empresa);

    const botonVerOferta = document.createElement('button');
    botonVerOferta.textContent = "Ver oferta";
    tarjeta.appendChild(botonVerOferta);

    return tarjeta;
}

function formatearPrecio(precio) {
    return new Intl.NumberFormat('es-ES', { style: 'currency', currency: 'EUR' }).format(precio);
}

function mostrarIndicadorCarga() {
    const indicadorCarga = document.createElement('div');
    indicadorCarga.textContent = "Cargando precios...";
    indicadorCarga.id = "indicadorCarga";
    document.getElementById('tablaPrecioProductos').appendChild(indicadorCarga);
}

function ocultarIndicadorCarga() {
    const indicadorCarga = document.getElementById('indicadorCarga');
    if (indicadorCarga) {
        indicadorCarga.remove();
    }
}

function mostrarMensaje(mensaje) {
    const mensajeDiv = document.createElement('div');
    mensajeDiv.textContent = mensaje;
    mensajeDiv.classList.add('mensaje');
    document.getElementById('tablaPrecioProductos').appendChild(mensajeDiv);
}
// ------------------------------- DETALLE PRODUCTO

getPrecioProvedores();
