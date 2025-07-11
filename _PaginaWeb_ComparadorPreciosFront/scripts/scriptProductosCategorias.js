document.addEventListener('DOMContentLoaded', async () => {
    const productosContainer = document.getElementById('productosCategoria');
    const tituloCategoria = document.getElementById('tituloCategoria');

    // Obtener parámetros de la URL
    const urlParams = new URLSearchParams(window.location.search);
    const idCategoria = urlParams.get('id');
    const nombreCategoria = urlParams.get('nombre');

    // Mostrar título de categoría
    if (nombreCategoria) {
        tituloCategoria.textContent = nombreCategoria.toUpperCase();
    }

    // Función para cargar productos
    const cargarProductosPorCategoria = async () => {
        try {
            productosContainer.innerHTML = '<p class="mensaje">Cargando productos...</p>';
            
            const response = await axios.get(`http://localhost:8084/categorias/productos/${idCategoria}`);
            
            if (response.data?.length > 0) {
                renderizarProductos(response.data);
            } else {
                mostrarMensaje("No hay productos en esta categoría.");
            }
        } catch (error) {
            console.error("Error al cargar productos:", error);
            mostrarMensaje("Error al cargar los productos. Intente más tarde.");
        }
    };

    // Función para renderizar productos (adaptada a tu CSS)
    const renderizarProductos = (productos) => {
        productosContainer.innerHTML = '';
        
        productos.forEach((producto, index) => {
            const productoHTML = `
    <div class="producto">
        <img src="../imagenes/${producto.nombre}.jpg" alt="${producto.nombre}">
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
    </div>
`;
            productosContainer.insertAdjacentHTML('beforeend', productoHTML);
        });
    };

    // Función para mostrar mensajes
    const mostrarMensaje = (mensaje) => {
        productosContainer.innerHTML = `<p class="mensaje">${mensaje}</p>`;
    };

    if (idCategoria) {
        await cargarProductosPorCategoria();
    }
});

// Funciones globales
window.verOfertas = (idProducto) => {
    localStorage.setItem("idProducto", idProducto);
    window.location.href = "../precioProvedores.html";
};

window.toggleFavorite = function(button, productId) {
    button.classList.toggle('active');
    const icon = button.querySelector('i');
    icon.classList.toggle('far');
    icon.classList.toggle('fas');
    
    // Lógica para guardar en favoritos
    console.log(`Producto ${productId} ${button.classList.contains('active') ? 'añadido a' : 'eliminado de'} favoritos`);
};