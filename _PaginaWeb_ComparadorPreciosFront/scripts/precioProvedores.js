console.log("local: ", localStorage.getItem("id"));
async function getPrecioProvedores() {
    let productos = await axios.get(`http://localhost:8084/productos/precios/provedor/${localStorage.getItem("id")}`);
    console.log("los productos: ", productos.data);

    let tablaProductos = document.getElementById('tablaPrecioProductos');
    console.log(tablaProductos);

    // Crear la estructura de la tabla fuera del bucle
    let tabla = document.createElement('table');
    let thead = tabla.insertRow();
    thead.insertCell().textContent = "Nombre";
    thead.insertCell().textContent = "Precio proveedor";
    thead.insertCell().textContent = "Empresa";

    let tbody = tabla.appendChild(document.createElement('tbody'));

    productos.data.forEach(item => {
        console.log(item);

        // Crear una nueva fila para cada producto
        let row = tbody.insertRow();
        row.insertCell().textContent = item.producto.nombre;
        row.insertCell().textContent = item.precioProvedor + "€";
        row.insertCell().textContent = item.provedor.empresa;

    });

    // Agregar la tabla completa al DOM una vez que se han agregado todas las filas
    tablaProductos.appendChild(tabla);


}

// async function getProductoDetalle() {
//     let productos = await axios.get(`http://localhost:8084/productos/precios/provedor/${localStorage.getItem("id")}`);
//     console.log("los productos: ", productos.data);

//     let productoDetale = document.getElementById('ProductoDetalle');
//     console.log(productoDetale);

//     productos.data.forEach(item => {
//         console.log(item);
// // Crear div para la imagen
// let divImagen = document.createElement('div');
// divImagen.classList.add=('imagenProducto');
// // let imagen = document.createElement('img');
// // imagen.src = `../imagenes/${item.nombre}.jpg`; // Ruta dinámica
// // imagen.alt = item.nombre; // Texto alternativo

//         divImagen.appendChild(imagen);
//     });


// }

getPrecioProvedores();
// getProductoDetalle();