document.addEventListener('DOMContentLoaded', () => {
    // Elementos del DOM
    const favoritosBtn = document.getElementById('button-header-favorite');
    const favoritosContainer = document.querySelector('.container-list-favorites');
    const favoritosList = document.querySelector('.list-favorites');
    const cerrarBtn = document.getElementById('btn-close');
    const contadorFavoritos = document.querySelector('.counter-favorite');

    if (!contadorFavoritos) {
        console.error('No se encontró el elemento .counter-favorite en el DOM');
        return;
    }

    // Obtener username y clave de favoritos
    const username = localStorage.getItem('username');
    const favoritosKey = username ? `favoritos_${username}` : 'favoritos_temp';
    
    // Inicializar favoritos
    let favoritos = JSON.parse(localStorage.getItem(favoritosKey)) || [];

    // Funciones principales
    function actualizarContador() {
        contadorFavoritos.textContent = favoritos.length;
        contadorFavoritos.style.display = favoritos.length > 0 ? 'inline' : 'none';
    }

    function mostrarFavoritos() {
        if (!favoritosList) return;
        
        favoritosList.innerHTML = '';
        
        if (favoritos.length === 0) {
            favoritosList.innerHTML = '<p class="empty-message">No tienes productos favoritos</p>';
            return;
        }

        favoritos.forEach((producto, index) => {
            const favItem = document.createElement('div');
            favItem.className = 'card-favorite';
            favItem.innerHTML = `
                <p class="title">${producto.nombre}</p>
                <p>${producto.precio}€</p>
                <button class="remove-favorite" data-index="${index}">×</button>
            `;
            favoritosList.appendChild(favItem);
        });

        // Event listeners para botones de eliminar
        document.querySelectorAll('.remove-favorite').forEach(btn => {
            btn.addEventListener('click', (e) => {
                const index = parseInt(e.target.dataset.index);
                favoritos.splice(index, 1);
                guardarFavoritos();
                mostrarFavoritos();
                actualizarContador();
                
                // Actualizar iconos en los productos
                document.querySelectorAll('.producto').forEach(producto => {
                    const id = producto.dataset.productId;
                    const btn = producto.querySelector('.favorite');
                    if (btn) {
                        const icon = btn.querySelector('i');
                        if (icon) {
                            icon.className = favoritos.some(p => p.id === id) ? 'fas fa-heart' : 'far fa-heart';
                        }
                    }
                });
            });
        });
    }

    function guardarFavoritos() {
        localStorage.setItem(favoritosKey, JSON.stringify(favoritos));
    }

    // Event listeners
    if (favoritosBtn) {
        favoritosBtn.addEventListener('click', () => {
            mostrarFavoritos();
            favoritosContainer.classList.toggle('show');
        });
    }

    if (cerrarBtn) {
        cerrarBtn.addEventListener('click', () => {
            favoritosContainer.classList.remove('show');
        });
    }

    // Función global para alternar favoritos
    window.toggleFavorite = function(btn, idProducto) {
        const productoElement = btn.closest('.producto');
        if (!productoElement) return;

        const producto = {
            id: idProducto,
            nombre: productoElement.querySelector('.Nombre')?.textContent || 'Producto sin nombre',
            precio: productoElement.querySelector('.Precio')?.textContent?.replace('Desde: ', '') || '0€'
        };

        const index = favoritos.findIndex(p => p.id === idProducto);
        const icon = btn.querySelector('i');

        if (index > -1) {
            favoritos.splice(index, 1);
            if (icon) icon.className = 'far fa-heart';
        } else {
            favoritos.push(producto);
            if (icon) icon.className = 'fas fa-heart';
            btn.classList.add('added');
            setTimeout(() => btn.classList.remove('added'), 500);
        }

        guardarFavoritos();
        actualizarContador();
    };

    // Inicialización
    actualizarContador();
    
    // Marcar favoritos existentes al cargar
    document.querySelectorAll('.producto').forEach(producto => {
        const id = producto.dataset.productId;
        const btn = producto.querySelector('.favorite');
        if (btn && favoritos.some(p => p.id === id)) {
            const icon = btn.querySelector('i');
            if (icon) icon.className = 'fas fa-heart';
        }
    });

    // Escuchar cambios en el login/logout
    window.addEventListener('storage', (e) => {
        if (e.key === 'username') {
            const newUsername = e.newValue;
            const newFavoritosKey = newUsername ? `favoritos_${newUsername}` : 'favoritos_temp';
            
            // Actualizar la clave de favoritos
            favoritosKey = newFavoritosKey;
            
            // Cargar los nuevos favoritos
            favoritos = JSON.parse(localStorage.getItem(favoritosKey)) || [];
            
            // Actualizar UI
            actualizarContador();
            mostrarFavoritos();
            
            // Actualizar iconos de corazón en productos
            document.querySelectorAll('.producto').forEach(producto => {
                const id = producto.dataset.productId;
                const btn = producto.querySelector('.favorite');
                if (btn) {
                    const icon = btn.querySelector('i');
                    if (icon) {
                        icon.className = favoritos.some(p => p.id === id) ? 'fas fa-heart' : 'far fa-heart';
                    }
                }
            });
        }
    });
});