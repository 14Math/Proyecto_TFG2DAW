document.addEventListener('DOMContentLoaded', function() {
    // 1. ABRIR EL MODAL: botón en el header (id="abrirModalLogin")
    const abrirModalBtn = document.getElementById('abrirModalLogin');
    const modal = document.getElementById('ventanaModalLogin');
    const container = modal.querySelector('.container');

    if (abrirModalBtn && modal) {
        abrirModalBtn.addEventListener('click', function() {
            modal.style.display = 'flex';
            container.classList.remove('active');
        });
    }

    // 2. CERRAR MODAL AL HACER CLICK FUERA DEL CONTENIDO
    modal.addEventListener('click', function(e) {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });
    // CERRAR MODAL CON ESC
    window.addEventListener('keydown', function(e) {
        if (e.key === 'Escape' && modal.style.display === 'flex') {
            modal.style.display = 'none';
        }
    });

    // 3. ALTERNAR ENTRE LOGIN Y REGISTRO
    const registerBtn = modal.querySelector('.register-btn');
    const loginBtn = modal.querySelector('.login-btn');
    if (registerBtn && container) {
        registerBtn.addEventListener('click', function(e) {
            e.preventDefault();
            container.classList.add('active');
        });
    }
    if (loginBtn && container) {
        loginBtn.addEventListener('click', function(e) {
            e.preventDefault();
            container.classList.remove('active');
        });
    }

    // 4. MOSTRAR/OCULTAR CAMPO EMPRESA EN REGISTRO
    const tipoUsuarioRegistro = modal.querySelector('#tipoUsuarioRegistro');
    const empresaField = modal.querySelector('#empresaField');
    if (tipoUsuarioRegistro && empresaField) {
        tipoUsuarioRegistro.addEventListener('change', function() {
            if (this.value === 'proveedor') {
                empresaField.classList.remove('hidden');
            } else {
                empresaField.classList.add('hidden');
            }
        });
    }

    // 5. LIMPIAR REGISTRO AL ABRIR PANEL REGISTRO
    const registroForm = modal.querySelector('#registroForm');
    if (registerBtn && registroForm && empresaField) {
        registerBtn.addEventListener('click', function() {
            registroForm.reset();
            empresaField.classList.add('hidden');
        });
    }
});