// ------------------------------ SCRIPT MEJORADO --------------------------------

document.addEventListener('DOMContentLoaded', () => {
    const productosContainer = document.getElementById('verProductos'); // Contenedor de productos

    // Función para verificar estado de sesión y mostrar botones correspondientes
    function verificarEstadoSesion() {
        const username = localStorage.getItem('username');
        const botonLogin = document.getElementById('abrirModalLogin');
        const botonVerPerfil = document.getElementById('boton-ver-perfil');
        const elementoUsername = document.getElementById('elemento-username');

        if (username) {
            // Usuario logueado
            if (botonLogin) botonLogin.style.display = 'none';
            if (botonVerPerfil) {
                botonVerPerfil.style.display = 'inline-block';
                if (elementoUsername) {
                    elementoUsername.textContent = username;
                }
            }
        } else {
            // Usuario no logueado
            if (botonLogin) botonLogin.style.display = 'inline-block';
            if (botonVerPerfil) botonVerPerfil.style.display = 'none';
        }
    }

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

    
    const crearProductoHTML = (producto) => {
        const divProducto = document.createElement('div');
        divProducto.classList.add('producto');
        divProducto.dataset.productId = producto.idProducto;

        divProducto.innerHTML = 
            `<div>
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
            </div>`
        ;

        return divProducto;
    };

    // Función para mostrar un mensaje en el contenedor
    const mostrarMensaje = (mensaje) => {
        productosContainer.innerHTML = `<p class="mensaje">${mensaje}</p>`;
    };

    // Función para manejar redirección a ofertas
    window.verOfertas = (idProducto) => {
        localStorage.setItem("idProducto", idProducto);
        window.location.href = "precioProvedores.html";
    };

    // Inicializar
    verificarEstadoSesion();
    cargarProductos();

    // Escuchar cambios en el estado de autenticación
    window.addEventListener('storage', (e) => {
        if (e.key === 'username') {
            verificarEstadoSesion();
        }
    });
});

