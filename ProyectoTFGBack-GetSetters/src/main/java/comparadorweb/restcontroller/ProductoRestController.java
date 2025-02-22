package comparadorweb.restcontroller;

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
import comparadorweb.dao.productoDao;
import comparadorweb.entidades.Cliente;
import comparadorweb.entidades.Producto;
import comparadorweb.entidades.ProductosProvedores;


@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/productos")
public class ProductoRestController {
	
	@Autowired
	private productoDao pdao;
	
	@Autowired
	private ProductosProvedoresDao prodao;
	
	@Autowired
	private ClienteDao cdao;
	
	//------------------------------------BUSCAR TODOS-------------------------------------
	@GetMapping("/todos/")
	public ResponseEntity<List<Producto>>  todos() {
		return new ResponseEntity<List<Producto>>(pdao.buscarTodos(), HttpStatus.OK);
	}
	//------------------------------------BUSCAR TODOS-------------------------------------
	
	//------------------------------------BUSCAR TODOS-------------------------------------
		@GetMapping("/categorias/productos/{idCategoria}")
		public ResponseEntity<?>  todosPorCategoria(@PathVariable int idCategoria) {
			List<Producto> producto = pdao.buscarTodosPorCategoria(idCategoria);
			

			 if ( producto != null)
		 
				 return new ResponseEntity<> (producto, HttpStatus.OK);
			 else
				 return new ResponseEntity<String>("Categoria no existe", HttpStatus.NOT_FOUND);
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
		
		
		
		
		//---------------------------------------LOGIN-----------------------------------------
		
		@PostMapping("/login")
	    public ResponseEntity<?> login(@RequestParam String username,@RequestParam String password) {
			
			Cliente cliente = cdao.buscarporUsuarioPassword(username, password);
			
			if(cliente != null)
				return new ResponseEntity<>(cliente,HttpStatus.ACCEPTED);
			else
				return new ResponseEntity<String>("USERNAME O CONTRASEÑA MAL", HttpStatus.NOT_FOUND);
	        
	    }
		
		
		//---------------------------------------LOGIN-----------------------------------------
	
	//-------------------------------------ALTA---------------------------------------
	/*
	
	@PostMapping("/alta/")
	public ResponseEntity<Producto> alta(@RequestBody ProductoDto productoDto) {
		
	Producto producto = productoDto.convertToproducto();
		
	 	producto.setIdProducto(pdao.buscarUna(productoDto.getIdProducto()));
		
		return 	new ResponseEntity<Producto>(pdao.insertOne(producto), HttpStatus.CREATED);
		
	//   	productoDto.setCodigo(producto.getCodigo());
		// return productoDto;
	}
	
	
	*/
	//-------------------------------------ALTA---------------------------------------
	
	

	
}