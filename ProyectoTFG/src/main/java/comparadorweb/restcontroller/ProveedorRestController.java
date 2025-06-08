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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import comparadorweb.dao.ProductosProvedoresDao;
import comparadorweb.dao.ProvedorDao;
import comparadorweb.entidades.Cliente;
import comparadorweb.entidades.ProductosProvedores;
import comparadorweb.entidades.Provedor;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/proveedor")

public class ProveedorRestController {
	
	@Autowired
	private ProductosProvedoresDao prodao;
	
	@Autowired
	private ProvedorDao prdao;

	
	//------------------------------------BUSCAR LOS PRECIOS OFERTADOS DEL PROVEDOR -------------------------------------
		@GetMapping("/precios/{idProvedor}")
		public ResponseEntity<?>  buscarPorProvedor(@PathVariable int idProvedor) {
			
			List<ProductosProvedores> precio = prodao.buscarLosPreciosOfertadosDelProvedor(idProvedor);
			
				 if ( precio != null)
			 
					 return new ResponseEntity<> (precio, HttpStatus.OK);
				 else
					 return new ResponseEntity<String>("No tienes ningun precio ofertado", HttpStatus.NOT_FOUND);
				
					 
			}		
		
		//------------------------------------------LOGIN--------------------------------------------
		
		@PostMapping("/login")
	    public ResponseEntity<?> login(@RequestParam String username,@RequestParam String password) {
			
			Provedor provedor = prdao.buscarporUsuarioPassword(username, password);
			
			if(provedor != null)
				return new ResponseEntity<>(provedor,HttpStatus.ACCEPTED);
			else
				return new ResponseEntity<String>("USERNAME O CONTRASEÑA MAL", HttpStatus.NOT_FOUND);
	        
	    }
		
		
		//---------------------------------------LOGIN-----------------------------------------
		
		//--------------------------------------ALTA-------------------------------------------
		@PostMapping("/alta")
		public ResponseEntity<?> altaProveedor(@RequestBody Provedor nuevoProveedor) {
	        try {
	            
	            if (nuevoProveedor == null || nuevoProveedor.getUsername() == null || nuevoProveedor.getUsername().isEmpty()) {
	                return new ResponseEntity<>("Datos inválidos. El nombre de usuario es obligatorio.", HttpStatus.BAD_REQUEST);
	            }

	            
	            Provedor proveedorGuardado = prdao.insertOne(nuevoProveedor);
	            if (proveedorGuardado != null) {
	                return new ResponseEntity<>(proveedorGuardado, HttpStatus.CREATED);
	            } else {
	                return new ResponseEntity<>("Error al registrar el proveedor.", HttpStatus.INTERNAL_SERVER_ERROR);
	            }
	        } catch (Exception e) {
	            return new ResponseEntity<>("Error inesperado: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
		
		//--------------------------------------ALTA-------------------------------------------
		
		//-------------------------------------MODIFICAR-----------------------------------------------
		
		@PutMapping("/modificar")
		public Provedor modificar(@RequestBody Provedor provedor) {
			return prdao.updateOne(provedor);
		}
		
		
		//-------------------------------------MODIFICAR-----------------------------------------------
		
		//---------------------------------ELIOMINAR OFERTA----------------------------------------------
		@DeleteMapping("/eliminar/precio/{idPro}")
	    public ResponseEntity<?> eliminarPrecio(@PathVariable int idPro) {
	        int resultado = prodao.deleteproductoProvedor(idPro);
	        if (resultado == 1) {
	            return ResponseEntity.ok("Precio eliminado correctamente.");
	        } else if (resultado == 0) {
	            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("No existe un precio con ese idPro.");
	        } else {
	            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error al eliminar el precio.");
	        }
	    }
		//---------------------------------ELIOMINAR OFERTA----------------------------------------------
}
