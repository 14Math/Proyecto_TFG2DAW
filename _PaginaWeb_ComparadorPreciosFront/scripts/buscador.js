document.getElementById('searchForm').addEventListener('submit', async function (event) {
    event.preventDefault();

    const searchTerm = document.getElementById('productIdInput').value;

    if (searchTerm) {
        const producto = await getBuscarProductoPorNombre(searchTerm);

        if (producto) {
            console.log("Producto encontrado:", producto);
            mostrarProducto(producto);
        } else {
            console.log("Producto no encontrado");
            document.getElementById('resultadoBusqueda').textContent = "Producto no encontrado.";
        }
    } else {
        console.log("Por favor, ingrese un nombre de producto.");
        document.getElementById('resultadoBusqueda').textContent = "Por favor, ingrese un nombre de producto.";
    }
});


document.getElementById('toggleSearchType').addEventListener('click', function () {
    const searchTypeInput = document.getElementById('searchType');
    const inputField = document.getElementById('productIdInput');
    if (searchTypeInput.value === 'id') {
        searchTypeInput.value = 'nombre';
        inputField.placeholder = 'Buscar por Nombre';
        this.textContent = 'Buscar por ID';
    } else {
        searchTypeInput.value = 'id';
        inputField.placeholder = 'Buscar por ID';
        this.textContent = 'Buscar por Nombre';
    }
});



async function getBuscarProductoPorNombre(nombre) {
    try {
        const response = await axios.get(`http://localhost:8084/productos/buscarPorNombre/${nombre}`);
        return response.data;
    } catch (error) {
        console.error("Producto no encontrado o nombre incorrecto:", error);
        return null;
    }
}

function mostrarProducto(item) {
    const Productos = document.getElementById('resultadoBusqueda'); // Usamos el div resultadoBusqueda como contenedor

    // Limpiar resultados anteriores
    Productos.innerHTML = '';

    // Crear un div para cada producto
    let divProducto = document.createElement('div');
    divProducto.classList.add('producto'); // Agrega una clase para estilos

    // Crear div para la imagen
    let divImagen = document.createElement('div');
    let imagen = document.createElement('img');
    imagen.src = `../imagenes/${item.nombre}.jpg`; // Ruta dinámica
    imagen.alt = item.nombre; // Texto alternativo
    divImagen.appendChild(imagen);
    divProducto.appendChild(divImagen);

    // Crear divs para cada dato del producto
    let divCategoria = document.createElement('div');
    divCategoria.textContent = item.categorias.nombre; // Ajuste para categoria.nombre
    divCategoria.classList.add('Categoria');

    divProducto.appendChild(divCategoria);

    let divNombre = document.createElement('div');
    divNombre.textContent = item.nombre;
    divNombre.classList.add('Nombre');

    divProducto.appendChild(divNombre);

    let divMarca = document.createElement('div');
    divMarca.textContent = 'Marca: ' + item.marca;
    divMarca.classList.add('Marca');

    divProducto.appendChild(divMarca);

    let divPrecio = document.createElement('div');
    divPrecio.textContent = 'Desde: ' + item.precioVenta + '€'; // Ajuste para precio_venta
    divPrecio.classList.add('Precio');

    divProducto.appendChild(divPrecio);

    let divOfertas = document.createElement('div');
    divOfertas.innerHTML = `<button onclick="verOfertas(${item.idProducto})">Ver Ofertas</button>`; // Botón con HTML
    divOfertas.classList.add('btnVerOfertas')

    divProducto.appendChild(divOfertas);

    // Agregar el div del producto al contenedor principal
    Productos.appendChild(divProducto);
}
