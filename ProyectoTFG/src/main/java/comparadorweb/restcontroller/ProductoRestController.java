package comparadorweb.restcontroller;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import comparadorweb.dao.ClienteDao;
import comparadorweb.dao.ProductosProvedoresDao;
import comparadorweb.dao.ProvedorDao;
import comparadorweb.dao.productoDao;
import comparadorweb.dtos.PrecioProveedorDto;
import comparadorweb.entidades.Categoria;
import comparadorweb.entidades.Cliente;
import comparadorweb.entidades.ClienteProducto;
import comparadorweb.entidades.Producto;
import comparadorweb.entidades.ProductosProvedores;
import comparadorweb.entidades.Provedor;
import comparadorweb.repository.ClienteProductoRepository;


@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/productos")
public class ProductoRestController {
	
	@Autowired
	private productoDao pdao;
	
	@Autowired
	private ProductosProvedoresDao prodao;
	
	@Autowired
	private ProvedorDao prdao;
	
	@Autowired
	private ClienteDao cdao;
	
	@Autowired
	private ClienteProductoRepository cprepo;
	
	
	//------------------------------------BUSCAR TODOS-------------------------------------
	@GetMapping("/todos/")
    public ResponseEntity<List<Producto>> todos(
        @RequestParam(value = "page", required = false, defaultValue = "0") int page,
        @RequestParam(value = "size", required = false, defaultValue = "20") int size) {

        List<Producto> productos = pdao.buscarTodos();
        int fromIndex = page * size;
        int toIndex = Math.min(fromIndex + size, productos.size());

        if (fromIndex >= productos.size()) {
            return new ResponseEntity<>(Collections.emptyList(), HttpStatus.OK);
        }
        List<Producto> pagina = productos.subList(fromIndex, toIndex);
        return new ResponseEntity<>(pagina, HttpStatus.OK);
    }
	//------------------------------------BUSCAR TODOS-------------------------------------
		
	
	//------------------------------------BUSCAR PRODUCTOS Y QUE SALGAN LOS PRECIO PROVEDORES-------------------------------------
	@GetMapping("/precios/provedor/{idProducto}")
	public ResponseEntity<?>  buscarPorProducto(@PathVariable int idProducto) {
		
		List<ProductosProvedores> producto = prodao.buscarProductoYMostrarLosPreciosProvedores(idProducto);
		
		

			 if ( producto != null)
		 
				 return new ResponseEntity<> (producto, HttpStatus.OK);
			 else
				 return new ResponseEntity<String>("Producto no existe", HttpStatus.NOT_FOUND);
			
				 
		}
	//------------------------------------BUSCAR PRODUCTOS Y QUE SALGAN LOS PRECIO PROVEDORES-------------------------------------
	
	//-------------------------------------BUSCAR UNO---------------------------------------
	@GetMapping("/buscar/{idProducto}")
	public ResponseEntity<?> uno(@PathVariable int idProducto) {
		 Producto producto = pdao.buscarUna(idProducto);
		 if ( producto != null)
			 return new ResponseEntity<Producto>(producto, HttpStatus.OK);
		 else
			 return new ResponseEntity<String>("Producto no existe", HttpStatus.NOT_FOUND);
			 
	}
	
	//-------------------------------------BUSCAR UNO---------------------------------------
	
	//-------------------------------------BUSCAR UNO POR NOMBRE---------------------------------------
		@GetMapping("/buscarPorNombre/{nombre}")
		public ResponseEntity<?> unoPorNombre(@PathVariable String nombre) {
			 Producto producto = pdao.buscarUnaPorNombre(nombre);
			 if ( producto != null)
				 return new ResponseEntity<Producto>(producto, HttpStatus.OK);
			 else
				 return new ResponseEntity<String>("Producto no existe CRACK", HttpStatus.NOT_FOUND);
				 
		}
		
		//-------------------------------------BUSCAR UNO POR NOMBRE---------------------------------------
		
		
		//-----------------------------------MOSTRAR VALORACIONES-----------------------------------------
		
		@GetMapping("/valoraciones/{idProducto}")
	    public ResponseEntity<?> valoraciones(@PathVariable int idProducto) {
	        List<ClienteProducto> valoraciones = pdao.mostrarValoraciones(idProducto);
	        if ( valoraciones != null)
	   		 
				 return new ResponseEntity<> (valoraciones, HttpStatus.OK);
			 else
				 return new ResponseEntity<String>("No hay valoraciones para este producto", HttpStatus.NOT_FOUND);
	    }
		
		//----------------------------------MOSTRAR VALORACIONES-----------------------------------------
		
		//-------------------------------------AÑADIR VALORACIONES------------------------------------
		
		@PostMapping("/valoracion")
		public ResponseEntity<?> anadirValoracion(@RequestBody ClienteProducto valoracion, @RequestParam String username) {
		    
		    Cliente cliente = cdao.buscarporUsuario(username);
		    if (cliente == null) {
		        return new ResponseEntity<>("Usuario no encontrado", HttpStatus.UNAUTHORIZED);
		    }
		    valoracion.setClientes(cliente);
		   
		    ClienteProducto guardado = cprepo.save(valoracion);
		    if (guardado != null) {
		        return new ResponseEntity<>(guardado, HttpStatus.CREATED);
		    } else {
		        return new ResponseEntity<>("Error al guardar valoración", HttpStatus.INTERNAL_SERVER_ERROR);
		    }
		}
		
		//-------------------------------------AÑADIR VALORACIONES-----------------------------------
		
	
	//-------------------------------------ALTADELPRECIO---------------------------------------
	
	
	@PostMapping("/alta/ofertarPrecio")
	public ResponseEntity<ProductosProvedores> alta(@RequestBody PrecioProveedorDto precioProveedorDto) {
		
		ProductosProvedores pp = new ProductosProvedores();
		pp.setPrecioProvedor(precioProveedorDto.getPrecioProveedor());
		pp.setProducto(pdao.buscarUna(precioProveedorDto.getIdProducto()));
		pp.setProvedor(prdao.buscarUno(precioProveedorDto.getIdProveedor()));
		
		return 	new ResponseEntity<ProductosProvedores>(prodao.insertProductoProvedor(pp), HttpStatus.CREATED);

	}
	
	
	//-------------------------------------ALTADELPRECIO---------------------------------------
	
	

	
}