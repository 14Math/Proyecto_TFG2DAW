

async function getProductosCategorias1() {
    let productos1 = await axios.get("http://localhost:8084/productos/categorias/productos/1");

    console.log("los productos: ", productos1.data);


    let Productos = document.getElementById('verProductosElectronicos');
    console.log(Productos);

    productos1.data.forEach(item => {
        console.log(item);

        // Crear un div para cada producto
        let divProducto = document.createElement('div');
        divProducto.classList.add('producto'); // Agrega una clase para estilos


        // Crear div para la imagen
        let divImagen = document.createElement('div');
        divImagen.classList.add('ProductoImagen');

        let imagen = document.createElement('img');
        imagen.src = `../imagenes/${item.nombre}.jpg`; // Ruta dinámica
        imagen.alt = item.nombre; // Texto alternativo
        divImagen.appendChild(imagen);
        divProducto.appendChild(divImagen);

        // Crear divs para cada dato del producto
        // let divCategoria = document.createElement('div');
        // divCategoria.textContent = item.categorias.nombre;
        // divCategoria.classList.add('Categoria');

        // divProducto.appendChild(divCategoria);

        let divNombre = document.createElement('div');
        divNombre.textContent = item.nombre;
        divNombre.classList.add('Nombre');

        divProducto.appendChild(divNombre);

        let divMarca = document.createElement('div');
        divMarca.textContent = 'Marca: ' + item.marca;
        divMarca.classList.add('Marca');

        divProducto.appendChild(divMarca);

        let divPrecio = document.createElement('div');
        divPrecio.textContent = 'Desde: ' + item.precioVenta + '€';
        divPrecio.classList.add('Precio');

        divProducto.appendChild(divPrecio);

        let divOfertas = document.createElement('div');
        divOfertas.innerHTML = '<button onclick="verOfertas('+item.idProducto+')">Ver Ofertas</button>'; // Botón con HTML
        divOfertas.classList.add('btnVerOfertas')

        divProducto.appendChild(divOfertas);

        // Agregar el div del producto al contenedor principal
        Productos.appendChild(divProducto);
    });
}

async function getProductosCategorias2() {

    let productos2 = await axios.get("http://localhost:8084/productos/categorias/productos/2");

    console.log("los productos: ", productos2.data);

    let Productos = document.getElementById('verProductosVideojuegos');
    console.log(Productos);

    productos2.data.forEach(item => {
        console.log(item);

        // Crear un div para cada producto
        let divProducto = document.createElement('div');
        divProducto.classList.add('producto'); // Agrega una clase para estilos

        // Crear div para la imagen
        let divImagen = document.createElement('div');
        let imagen = document.createElement('img');
        imagen.src = `../imagenes/${item.nombre}.jpg`; // Ruta dinámica
        imagen.alt = item.nombre; // Texto alternativo
        divImagen.appendChild(imagen);
        divProducto.appendChild(divImagen);

        // Crear divs para cada dato del producto
        // let divCategoria = document.createElement('div');
        // divCategoria.textContent = item.categorias.nombre;
        // divCategoria.classList.add('Categoria');

        // divProducto.appendChild(divCategoria);

        let divNombre = document.createElement('div');
        divNombre.textContent = item.nombre;
        divNombre.classList.add('Nombre');

        divProducto.appendChild(divNombre);

        let divMarca = document.createElement('div');
        divMarca.textContent = 'Marca: ' + item.marca;
        divMarca.classList.add('Marca');

        divProducto.appendChild(divMarca);

        let divPrecio = document.createElement('div');
        divPrecio.textContent = 'Desde: ' + item.precioVenta + '€';
        divPrecio.classList.add('Precio');

        divProducto.appendChild(divPrecio);

        let divOfertas = document.createElement('div');
        divOfertas.innerHTML = '<button onclick="verOfertas('+item.idProducto+')">Ver Ofertas</button>'; // Botón con HTML
        divOfertas.classList.add('btnVerOfertas')

        divProducto.appendChild(divOfertas);

        // Agregar el div del producto al contenedor principal
        Productos.appendChild(divProducto);
    });
}

async function getProductosCategorias3() {

    let productos3 = await axios.get("http://localhost:8084/productos/categorias/productos/3");
    console.log("los productos: ", productos3.data);

    let Productos = document.getElementById('verProductosLibros');
    console.log(Productos);

    productos3.data.forEach(item => {
        console.log(item);

        // Crear un div para cada producto
        let divProducto = document.createElement('div');
        divProducto.classList.add('producto'); // Agrega una clase para estilos

        // Crear div para la imagen
        let divImagen = document.createElement('div');
        let imagen = document.createElement('img');
        imagen.src = `../imagenes/${item.nombre}.jpg`; // Ruta dinámica
        imagen.alt = item.nombre; // Texto alternativo
        divImagen.appendChild(imagen);
        divProducto.appendChild(divImagen);

        // Crear divs para cada dato del producto
        // let divCategoria = document.createElement('div');
        // divCategoria.textContent = item.categorias.nombre;
        // divCategoria.classList.add('Categoria');

        // divProducto.appendChild(divCategoria);

        let divNombre = document.createElement('div');
        divNombre.textContent = item.nombre;
        divNombre.classList.add('Nombre');

        divProducto.appendChild(divNombre);

        let divMarca = document.createElement('div');
        divMarca.textContent = 'Marca: ' + item.marca;
        divMarca.classList.add('Marca');

        divProducto.appendChild(divMarca);

        let divPrecio = document.createElement('div');
        divPrecio.textContent = 'Desde: ' + item.precioVenta + '€';
        divPrecio.classList.add('Precio');

        divProducto.appendChild(divPrecio);

        let divOfertas = document.createElement('div');
        divOfertas.innerHTML = '<button onclick="verOfertas('+item.idProducto+')">Ver Ofertas</button>'; // Botón con HTML
        divOfertas.classList.add('btnVerOfertas')

        divProducto.appendChild(divOfertas);

        // Agregar el div del producto al contenedor principal
        Productos.appendChild(divProducto);
    });
}

async function getProductosCategorias4() {
    let productos4 = await axios.get("http://localhost:8084/productos/categorias/productos/4");
    console.log("los productos: ", productos4.data);

    let Productos = document.getElementById('verProductosPerfumes');
    console.log(Productos);

    productos4.data.forEach(item => {
        console.log(item);

        // Crear un div para cada producto
        let divProducto = document.createElement('div');
        divProducto.classList.add('producto'); // Agrega una clase para estilos

        // Crear div para la imagen
        let divImagen = document.createElement('div');
        let imagen = document.createElement('img');
        imagen.src = `../imagenes/${item.nombre}.jpg`; // Ruta dinámica
        imagen.alt = item.nombre; // Texto alternativo
        divImagen.appendChild(imagen);
        divProducto.appendChild(divImagen);

        // Crear divs para cada dato del producto
        // let divCategoria = document.createElement('div');
        // divCategoria.textContent = item.categorias.nombre;
        // divCategoria.classList.add('Categoria');

        // divProducto.appendChild(divCategoria);

        let divNombre = document.createElement('div');
        divNombre.textContent = item.nombre;
        divNombre.classList.add('Nombre');

        divProducto.appendChild(divNombre);

        let divMarca = document.createElement('div');
        divMarca.textContent = 'Marca: ' + item.marca;
        divMarca.classList.add('Marca');

        divProducto.appendChild(divMarca);

        let divPrecio = document.createElement('div');
        divPrecio.textContent = 'Desde: ' + item.precioVenta + '€';
        divPrecio.classList.add('Precio');

        divProducto.appendChild(divPrecio);

        let divOfertas = document.createElement('div');
        divOfertas.innerHTML = '<button onclick="verOfertas('+item.idProducto+')">Ver Ofertas</button>'; // Botón con HTML
        divOfertas.classList.add('btnVerOfertas')

        divProducto.appendChild(divOfertas);

        // Agregar el div del producto al contenedor principal
        Productos.appendChild(divProducto);
    });
}

async function getProductosCategorias5() {
    let productos5 = await axios.get("http://localhost:8084/productos/categorias/productos/5");
    console.log("los productos: ", productos5.data);

    let Productos = document.getElementById('verProductosJuguetes');
    console.log(Productos);

    productos5.data.forEach(item => {
        console.log(item);

        // Crear un div para cada producto
        let divProducto = document.createElement('div');
        divProducto.classList.add('producto'); // Agrega una clase para estilos

        // Crear div para la imagen
        let divImagen = document.createElement('div');
        let imagen = document.createElement('img');
        imagen.src = `../imagenes/${item.nombre}.jpg`; // Ruta dinámica
        imagen.alt = item.nombre; // Texto alternativo
        divImagen.appendChild(imagen);
        divProducto.appendChild(divImagen);

        // Crear divs para cada dato del producto
        // let divCategoria = document.createElement('div');
        // divCategoria.textContent = item.categorias.nombre;
        // divCategoria.classList.add('Categoria');

        // divProducto.appendChild(divCategoria);

        let divNombre = document.createElement('div');
        divNombre.textContent = item.nombre;
        divNombre.classList.add('Nombre');

        divProducto.appendChild(divNombre);

        let divMarca = document.createElement('div');
        divMarca.textContent = 'Marca: ' + item.marca;
        divMarca.classList.add('Marca');

        divProducto.appendChild(divMarca);

        let divPrecio = document.createElement('div');
        divPrecio.textContent = 'Desde: ' + item.precioVenta + '€';
        divPrecio.classList.add('Precio');

        divProducto.appendChild(divPrecio);

        let divOfertas = document.createElement('div');
        divOfertas.innerHTML = '<button onclick="verOfertas('+item.idProducto+')">Ver Ofertas</button>'; // Botón con HTML
        divOfertas.classList.add('btnVerOfertas')

        divProducto.appendChild(divOfertas);

        // Agregar el div del producto al contenedor principal
        Productos.appendChild(divProducto);
    });
}

function verOfertas(idProducto) {
    window.location.href = "../precioProvedores.html";
    console.log('Ver ofertas del producto con ID:', idProducto);
    localStorage.setItem("id", idProducto);
    console.log("local: ", localStorage.getItem("id"));
    // Aquí puedes agregar la lógica para mostrar las ofertas del producto con el ID especificado
}

getProductosCategorias1();
getProductosCategorias2();
getProductosCategorias3();
getProductosCategorias4();
getProductosCategorias5();