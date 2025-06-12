package comparadorweb.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import comparadorweb.dao.AdministradorDao;
import comparadorweb.dao.ClienteDao;
import comparadorweb.dao.ProvedorDao;
import comparadorweb.dao.productoDao;
import comparadorweb.entidades.Administrador;
import comparadorweb.entidades.Cliente;
import comparadorweb.entidades.Producto;
import comparadorweb.entidades.Provedor;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/administrador")
public class AdministradorRestController {
	
	@Autowired
	private productoDao pdao;
	
	@Autowired
	private ProvedorDao prdao;
	
	@Autowired
	private ClienteDao cdao;
	
	@Autowired
	private AdministradorDao adao;
	
	
	//------------------------------------------AÑADIRPRODUCTO-------------------------------
	@PostMapping("/añadir")
	public ResponseEntity<?> añadirProducto(@RequestBody Producto producto) {
	    try {
	        // 1. Si viene imagenBase64, la guardamos como archivo
	        if (producto.getImagenBase64() != null && !producto.getImagenBase64().isEmpty()) {
	            byte[] datosImagen = java.util.Base64.getDecoder().decode(producto.getImagenBase64());
	            // El nombre será igual al nombre del producto, extensión .jpg
	            String nombreLimpio = producto.getNombre().replaceAll("[^a-zA-Z0-9_-]", "_"); // limpia para archivo
	            String rutaDestino = "C:\\IFP\\Proyecto_TFG2DAW\\_PaginaWeb_ComparadorPreciosFront\\imagenes\\" + nombreLimpio + ".jpg";
	            try (java.io.FileOutputStream fos = new java.io.FileOutputStream(rutaDestino)) {
	                fos.write(datosImagen);
	            }
	        }

	        // 2. Guardar el producto en la BBDD (sin imagenBase64)
	        producto.setImagenBase64(null); // ¡Muy importante no guardar el base64 en la BBDD!
	        Producto productoNuevo = pdao.insertOne(producto);
	        if (productoNuevo != null) {
	            return new ResponseEntity<>(productoNuevo, HttpStatus.CREATED);
	        } else {
	            return new ResponseEntity<>("Error al añadir un producto", HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return new ResponseEntity<>("Error inesperado: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
	//------------------------------------------AÑADIRPRODUCTO-------------------------------
	
	
	//------------------------------------BUSCAR TODOS-------------------------------------
		@GetMapping("/todos/proveedores")
		public ResponseEntity<List<Provedor>> todosProveedores() {
		    List<Provedor> proveedores = prdao.mostrarTodos();
		    return new ResponseEntity<>(proveedores, HttpStatus.OK);
		}

				@GetMapping("/todos/clientes")
				public ResponseEntity<List<Cliente>> todosClientes() {
				    List<Cliente> clientes = cdao.mostrarTodos();
				    return new ResponseEntity<>(clientes, HttpStatus.OK);
				}
			//------------------------------------BUSCAR TODOS-------------------------------------
				
			//------------------------------------ELIMINAR-----------------------------------------
				
				@DeleteMapping("/clientes/eliminar/{idCliente}")
				public ResponseEntity<Void> eliminarCliente(@PathVariable int idCliente) {
				    cdao.eliminarProductosDeCliente(idCliente); // Borra las reseñas primero
				    Cliente cliente = cdao.buscarporId(idCliente);
				    if (cliente != null) {
				        int filas = cdao.deleteOne(cliente);
				        if (filas > 0) {
				            return ResponseEntity.noContent().build();
				        }
				    }
				    return ResponseEntity.notFound().build();
				}
				
				
				
				@DeleteMapping("/proveedor/eliminar/{idProvedor}")
				public ResponseEntity<Void> eliminarProveedor(@PathVariable int idProvedor) {
					prdao.eliminarOfertasDeProveedor(idProvedor); // Borra las ofertas primero
				    Provedor provedor = prdao.buscarUno(idProvedor);
				    if (provedor != null) {
				        int filas = prdao.deleteOne(provedor);
				        if (filas > 0) {
				            return ResponseEntity.noContent().build(); // 204
				        }
				    }
				    return ResponseEntity.notFound().build(); // 404
				}
				//------------------------------------ELIMINAR-----------------------------------------
				
				//------------------------------------------LOGIN--------------------------------------------
				
				@PostMapping("/login")
			    public ResponseEntity<?> login(@RequestParam String username,@RequestParam String password) {
					
					Administrador admin = adao.buscarporUsuarioPassword(username, password);
					
					if(admin != null)
						return new ResponseEntity<>(admin,HttpStatus.ACCEPTED);
					else
						return new ResponseEntity<String>("USERNAME O CONTRASEÑA MAL", HttpStatus.NOT_FOUND);
			        
			    }
				
				
				//---------------------------------------LOGIN-----------------------------------------
}
