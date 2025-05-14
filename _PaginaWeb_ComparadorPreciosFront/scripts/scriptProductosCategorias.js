document.addEventListener('DOMContentLoaded', () => {
    // Función principal para cargar productos por categoría
    const cargarProductosPorCategoria = async (idCategoria, contenedorId) => {
        try {
            const response = await axios.get(`http://localhost:8084/productos/categorias/productos/${idCategoria}`);
            const productos = response.data;

            if (productos && productos.length > 0) {
                renderizarProductos(productos, contenedorId);
            } else {
                mostrarMensaje("No se encontraron productos para esta categoría.", contenedorId);
            }
        } catch (error) {
            console.error(`Error al cargar productos de la categoría ${idCategoria}:`, error);
            mostrarMensaje("Hubo un error al cargar los productos. Por favor, intenta más tarde.", contenedorId);
        }
    };

    // Función para renderizar los productos en el DOM
    const renderizarProductos = (productos, contenedorId) => {
        const contenedor = document.getElementById(contenedorId);
        contenedor.innerHTML = ''; // Limpiar el contenedor

        productos.forEach((producto) => {
            const productoDiv = crearProductoHTML(producto);
            contenedor.appendChild(productoDiv);
        });
    };

    // Función para crear el HTML de un producto (similar a la de script.js)
    const crearProductoHTML = (producto) => {
        const divProducto = document.createElement('div');
        divProducto.classList.add('producto');
        divProducto.dataset.productId = producto.idProducto;

        divProducto.innerHTML = `
            <div class="ProductoImagen">
                <img src="../imagenes/${producto.nombre}.jpg" alt="${producto.nombre}">
            </div>
            <div class="Nombre">${producto.nombre}</div>
            <div class="Marca">Marca: ${producto.marca}</div>
            <div class="Precio">Desde: ${producto.precioVenta}€</div>
            <div class="btnVerOfertas">
                <button onclick="verOfertas(${producto.idProducto})">Ver Ofertas</button>
                <button class="favorite" onclick="toggleFavorite(this, ${producto.idProducto})">
                    <i class="far fa-heart"></i>
                </button>
            </div>
        `;

        return divProducto;
    };

    // Función para mostrar un mensaje en el contenedor específico
    const mostrarMensaje = (mensaje, contenedorId) => {
        const contenedor = document.getElementById(contenedorId);
        contenedor.innerHTML = `<p class="mensaje">${mensaje}</p>`;
    };

    // Función para manejar redirección a ofertas (compartida con script.js)
    window.verOfertas = (idProducto) => {
        localStorage.setItem("id", idProducto);
        window.location.href = "../precioProvedores.html";
    };

    // Función para alternar favoritos (compartida con script.js)
    window.toggleFavorite = (element, idProducto) => {
        element.classList.toggle('active');
        // Aquí podrías añadir lógica para guardar en localStorage o API
        showConfetti(element);
    };

    // Cargar productos para cada categoría
    cargarProductosPorCategoria(1, 'verProductosElectronicos');
    cargarProductosPorCategoria(2, 'verProductosVideojuegos');
    cargarProductosPorCategoria(3, 'verProductosLibros');
    cargarProductosPorCategoria(4, 'verProductosPerfumes');
    cargarProductosPorCategoria(5, 'verProductosJuguetes');
});

// Efecto de confeti (compartido con script.js)
function showConfetti(element) {
    const confetti = document.createElement('div');
    confetti.style.position = 'absolute';
    confetti.innerHTML = '🎉';
    document.body.appendChild(confetti);
    
    anime({
        targets: confetti,
        translateY: [-20, 100],
        translateX: () => anime.random(-50, 50),
        opacity: [1, 0],
        duration: 1000,
        easing: 'easeOutExpo',
        complete: () => confetti.remove()
    });
}