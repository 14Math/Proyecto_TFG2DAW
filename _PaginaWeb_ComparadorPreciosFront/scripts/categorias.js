
// categorias.js
document.addEventListener('DOMContentLoaded', async function() {
    const navBar = document.querySelector('nav');
    
    // Eliminar enlaces estáticos excepto favoritos
    document.querySelectorAll('nav > div:not(.container-list-favorites)').forEach(el => el.remove());

    try {
        const response = await axios.get('http://localhost:8084/categorias/todos/');
        
        response.data.forEach(categoria => {
            const iconos = {
                'perfumería': 'fa-spray-can',
                'perfumeria': 'fa-spray-can',
                'librería': 'fa-book',
                'libreria': 'fa-book',
                'electrónica': 'fa-mobile-screen',
                'electronica': 'fa-mobile-screen',
                'videojuegos': 'fa-gamepad',
                'juguetes': 'fa-sleigh'
            };
            
            const div = document.createElement('div');
            div.innerHTML = `
                <a class="nav-link text-light categoria-link" 
                   href="htmls/categoria.html?id=${categoria.idCategoria}&nombre=${encodeURIComponent(categoria.nombre)}"
                   data-id="${categoria.idCategoria}">
                    <i class="fa-solid ${iconos[categoria.nombre.toLowerCase()] || 'fa-tag'} fa-lg"></i>
                    &nbsp;${categoria.nombre}
                </a>
            `;
            navBar.insertBefore(div, document.querySelector('.container-list-favorites'));
        });
        
    } catch (error) {
        console.error("Error cargando categorías:", error);
        // Carga categorías por defecto si es necesario
    }
});

