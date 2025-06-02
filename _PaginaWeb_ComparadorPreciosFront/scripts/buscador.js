document.getElementById('searchForm').addEventListener('submit', async function (event) {
    event.preventDefault();

    const searchTerm = document.getElementById('productIdInput').value.trim();
    const resultadoBusqueda = document.getElementById('resultadoBusqueda');

    if (searchTerm) {
        resultadoBusqueda.innerHTML = '<div class="loading">Buscando...</div>';
        
        try {
            const producto = await getBuscarProductoPorNombre(searchTerm);

            if (producto) {
                console.log("Producto encontrado:", producto);
                mostrarProducto(producto);
            } else {
                console.log("Producto no encontrado");
                resultadoBusqueda.innerHTML = `
                    <div class="no-results">
                        <p>No se encontró ningún producto con el nombre "${searchTerm}"</p>
                    </div>
                `;
            }
        } catch (error) {
            console.error("Error en la búsqueda:", error);
            resultadoBusqueda.innerHTML = `
                <div class="error">
                    <p>Hubo un error al realizar la búsqueda. Por favor, inténtalo de nuevo.</p>
                </div>
            `;
        }
    } else {
        resultadoBusqueda.innerHTML = `
            <div class="empty-search">
                <p>Por favor, ingresa un nombre de producto para buscar.</p>
            </div>
        `;
    }
});

document.getElementById('toggleSearchType').addEventListener('click', function () {
    const searchTypeInput = document.getElementById('searchType');
    const inputField = document.getElementById('productIdInput');
    const searchButton = document.getElementById('searchButton');
    
    if (searchTypeInput.value === 'id') {
        searchTypeInput.value = 'nombre';
        inputField.placeholder = 'Buscar por Nombre';
        this.textContent = 'Buscar por ID';
        searchButton.innerHTML = '<i class="fas fa-search"></i> Buscar por Nombre';
    } else {
        searchTypeInput.value = 'id';
        inputField.placeholder = 'Buscar por ID';
        this.textContent = 'Buscar por Nombre';
        searchButton.innerHTML = '<i class="fas fa-search"></i> Buscar por ID';
    }
});

async function getBuscarProductoPorNombre(nombre) {
    try {
        const response = await axios.get(`http://localhost:8084/productos/buscarPorNombre/${nombre}`);
        return response.data;
    } catch (error) {
        console.error("Error al buscar producto:", error);
        throw error;
    }
}

function mostrarProducto(item) {
    const resultadoBusqueda = document.getElementById('resultadoBusqueda');
    resultadoBusqueda.innerHTML = '';

    const productoDiv = document.createElement('div');
    productoDiv.className = 'producto';
    productoDiv.dataset.productId = item.idProducto;

    productoDiv.innerHTML = `
        <div class="producto-imagen">
            <img src="../imagenes/${item.nombre}.jpg" alt="${item.nombre}">
        </div>
        <div class="glass-effect"></div>
        <div class="producto-contenido">
            <div class="Categoria">${item.categorias?.nombre || "ELECTRONICA"}</div>
            <div class="Nombre">${item.nombre}</div>
            <div class="Marca">${item.marca}</div>
            <div class="Precio">Desde: ${item.precioVenta}€</div>
            <div class="btnVerOfertas">
                <button onclick="verOfertas(${item.idProducto})">Ver Ofertas</button>
                <button class="favorite" onclick="toggleFavorite(this, ${item.idProducto})">
                    <i class="far fa-heart"></i>
                </button>
            </div>
        </div>
    `;

    resultadoBusqueda.appendChild(productoDiv);
}

// Función para ver ofertas
window.verOfertas = (idProducto) => {
    localStorage.setItem("idProducto", idProducto);
    window.location.href = "precioProvedores.html";
};

// Función para favoritos (simulada)
window.toggleFavorite = (element, idProducto) => {
    element.classList.toggle('active');
    element.querySelector('i').classList.toggle('fas');
    element.querySelector('i').classList.toggle('far');
    console.log(`Producto ${idProducto} marcado como favorito: ${element.classList.contains('active')}`);
};