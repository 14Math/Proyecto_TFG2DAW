package comparadorweb.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
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
		@GetMapping("/precios/{idProducto}")
		public ResponseEntity<?>  buscarPorProvedor(@PathVariable int idProvedor) {
			
			List<ProductosProvedores> precio = prodao.buscarLosPreciosOfertadosDelProvedor(idProvedor);
			
				 if ( precio != null)
			 
					 return new ResponseEntity<> (precio, HttpStatus.OK);
				 else
					 return new ResponseEntity<String>("No tienes ningun precio ofertado", HttpStatus.NOT_FOUND);
				
					 
			}
		//------------------------------------BUSCAR LOS PRECIOS OFERTADOS DEL PROVEDOR-------------------------------------
		
		
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
		
		//-------------------------------------MODIFICAR-----------------------------------------------
		
		@PutMapping("/modificar")
		public Provedor modificar(@RequestBody Provedor provedor) {
			return prdao.updateOne(provedor);
		}
		
		
		//-------------------------------------MODIFICAR-----------------------------------------------
}
