// ------------------------------ SCRIPT MEJORADO --------------------------------

document.addEventListener('DOMContentLoaded', () => {
    const productosContainer = document.getElementById('verProductos'); // Contenedor de productos

    // Función principal para cargar los productos
    const cargarProductos = async () => {
        try {
            const response = await axios.get("http://localhost:8084/productos/todos/");
            const productos = response.data;

            if (productos && productos.length > 0) {
                renderizarProductos(productos);
            } else {
                mostrarMensaje("No se encontraron productos.");
            }
        } catch (error) {
            console.error("Error al cargar productos:", error);
            mostrarMensaje("Hubo un error al cargar los productos. Por favor, intenta más tarde.");
        }
    };

    // Función para renderizar los productos en el DOM
    const renderizarProductos = (productos) => {
        productosContainer.innerHTML = ''; // Limpiar el contenedor

        productos.forEach((producto) => {
            const productoDiv = crearProductoHTML(producto);
            productosContainer.appendChild(productoDiv);
        });
    };

    // En la función crearProductoHTML, modificar el botón de favoritos:
// Función para crear el HTML de un producto
const crearProductoHTML = (producto) => {
    const divProducto = document.createElement('div');
    divProducto.classList.add('producto');
    divProducto.dataset.productId = producto.idProducto;

    divProducto.innerHTML = `
        <div>
            <img src="../imagenes/${producto.nombre}.jpg" alt="${producto.nombre}">
        </div>
        <div class="Categoria">${producto.categorias?.nombre || "Sin Categoría"}</div>
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

    // Función para mostrar un mensaje en el contenedor
    const mostrarMensaje = (mensaje) => {
        productosContainer.innerHTML = `<p class="mensaje">${mensaje}</p>`;
    };

    // Función para manejar redirección a ofertas
    window.verOfertas = (idProducto) => {
        localStorage.setItem("idProducto", idProducto)
        window.location.href = "precioProvedores.html"; // Redirigir
    };

    // Inicializar la carga de productos
    cargarProductos();
});
// Efecto de confeti (opcional)
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