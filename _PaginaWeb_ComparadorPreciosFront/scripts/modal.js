document.addEventListener('DOMContentLoaded', () => {
    const modalLogin = document.getElementById('ventanaModalLogin');
    const openModalButton = document.getElementById('abrirModalLogin');
    const closeModalButton = modalLogin.querySelector('.close-btn'); // Opcional, si tienes un botón de cierre

    // Abrir el modal al hacer clic en el botón
    openModalButton.addEventListener('click', () => {
        modalLogin.style.display = 'flex'; // Muestra el modal
    });

    // Cerrar el modal si hay un botón de cierre
    if (closeModalButton) {
        closeModalButton.addEventListener('click', () => {
            modalLogin.style.display = 'none'; // Oculta el modal
        });
    }

    // Cerrar el modal al hacer clic fuera del contenedor
    window.addEventListener('click', (event) => {
        if (event.target === modalLogin) {
            modalLogin.style.display = 'none';
        }
    });
});