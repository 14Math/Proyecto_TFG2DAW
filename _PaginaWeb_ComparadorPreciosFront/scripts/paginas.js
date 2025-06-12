let currentPage = 1;
const pageSize = 20;

function loadPage(page) {
    if (page < 1) return; // Evitar páginas negativas
    
    fetch(`http://localhost:8084/productos/todos/?page=${page}&size=${pageSize}`)
        .then(response => response.json())
        .then(productos => {
            if (productos && productos.length > 0) {
                renderProductos(productos);
                currentPage = page;
                updatePaginationUI();
            } else {
                // No hay productos en esta página
                if (page > 1) {
                    // Retroceder a la última página con contenido
                    loadPage(page - 1);
                } else {
                    // Estamos en la primera página y está vacía
                    document.getElementById('verProductos').innerHTML = '<p>No hay productos disponibles</p>';
                }
            }
        })
        .catch(error => {
            console.error('Error al cargar productos:', error);
        });
}

function updatePaginationUI() {
    // Quitar la clase 'active' de todos los elementos de paginación
    document.querySelectorAll('.pagination li a').forEach(link => {
        link.parentElement.classList.remove('active'); // Quitamos 'active' del <li>
    });
    
    // Añadir la clase 'active' al elemento de la página actual
    const activeLink = document.getElementById(`pag-${currentPage}`);
    if (activeLink) {
        activeLink.parentElement.classList.add('active');
    }
    
    // Manejar estado de los enlaces anterior/siguiente
    document.getElementById('pag-anterior').parentElement.classList.toggle('disabled', currentPage === 1);
}

// Renderiza los productos SOLO dentro de #verProductos
function renderProductos(productos) {
    const contenedor = document.getElementById('verProductos');
    contenedor.innerHTML = ''; // LIMPIA el contenedor antes de añadir nuevos

    productos.forEach(producto => {
        contenedor.innerHTML += `
          <div class="producto">
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
          </div>
        `;
    });
}

// Event listeners para la paginación
document.getElementById('pag-anterior').addEventListener('click', function(e) {
    e.preventDefault();
    if (currentPage > 1) {
        loadPage(currentPage - 1);
    }
});

document.getElementById('pag-1').addEventListener('click', function(e) {
    e.preventDefault();
    loadPage(1);
});

document.getElementById('pag-2').addEventListener('click', function(e) {
    e.preventDefault();
    loadPage(2);
});

document.getElementById('pag-3').addEventListener('click', function(e) {
    e.preventDefault();
    loadPage(3);
});

document.getElementById('pag-siguiente').addEventListener('click', function(e) {
    e.preventDefault();
    loadPage(currentPage + 1);
});

// Llama a la página 1 al iniciar
loadPage(1);