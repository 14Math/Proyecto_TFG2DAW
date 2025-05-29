async function cargarValoraciones() {
    const idProducto = localStorage.getItem("idProducto");
    if (!idProducto) return;

    try {
        const res = await fetch(`http://localhost:8084/productos/valoraciones/${idProducto}`);
        let listaHtml = "";
        let total = 0;
        let resumenHtml = "";
        if (res.ok) {
            const valoraciones = await res.json();
            if (!valoraciones || valoraciones.length === 0) {
                listaHtml = "<p>No hay valoraciones para este producto.</p>";
                resumenHtml = `<span>Sin valoraciones</span>`;
            } else {
                valoraciones.forEach(val => {
                    listaHtml += `
                        <div class="valoracion">
                            <strong>${val.clientes?.username || "Usuario"}</strong> 
                            <span>${"★".repeat(val.valoracion)}${"☆".repeat(5-val.valoracion)}</span>
                            <p>${val.opinion}</p>
                        </div>
                    `;
                    total += val.valoracion;
                });
                const media = (total/valoraciones.length).toFixed(1);
                resumenHtml = `<span>Media: <b>${media}</b> de 5 (${valoraciones.length} valoraciones)</span>`;
            }
        } else {
            listaHtml = "<p>Error al cargar valoraciones.</p>";
            resumenHtml = "";
        }
        // ¡Usa los IDs que necesitas!
        let contLista = document.getElementById('todas-valoraciones');
        if (contLista) contLista.innerHTML = listaHtml;
        let contResumen = document.getElementById('resumen-valoraciones');
        if (contResumen) contResumen.innerHTML = resumenHtml;
    } catch (error) {
        let contLista = document.getElementById('todas-valoraciones');
        if (contLista) contLista.innerHTML = "<p>Error al cargar valoraciones.</p>";
        let contResumen = document.getElementById('resumen-valoraciones');
        if (contResumen) contResumen.innerHTML = "";
    }
}

document.addEventListener('DOMContentLoaded', () => {
    cargarValoraciones();

    // Mostrar u ocultar el formulario según login
    const username = localStorage.getItem('username');
    const bloque = document.getElementById('bloqueAgregarValoracion');
    if (!username && bloque) {
        bloque.style.display = 'none';
    } else if (bloque) {
        bloque.style.display = 'block';
    }
});

// Enviar la valoración
document.getElementById('formValoracion').addEventListener('submit', async function(e) {
    e.preventDefault();
    const opinion = document.getElementById('opinion').value.trim();
    const valoracion = parseInt(document.getElementById('valoracion').value);
    const username = localStorage.getItem('username');
    const idProducto = localStorage.getItem("idProducto");

    if(!opinion || !valoracion || !idProducto) {
        alert("Completa todos los campos");
        return;
    }
    // Ajusta el DTO si tu backend lo necesita diferente
    const data = {
        opinion,
        valoracion,
        productos: { idProducto: parseInt(idProducto) }
    };

    try {
        const res = await fetch(`http://localhost:8084/productos/valoracion?username=${username}`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(data)
        });
        if (res.ok) {
            alert("¡Valoración enviada!");
            this.reset();
            await cargarValoraciones();
        } else {
            const err = await res.text();
            alert("Error: " + err);
        }
    } catch (err) {
        alert("Error de conexión");
    }
});