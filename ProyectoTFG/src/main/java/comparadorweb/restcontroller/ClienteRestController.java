package comparadorweb.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import comparadorweb.dao.ClienteDao;
import comparadorweb.entidades.Cliente;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/cliente")
public class ClienteRestController {
	
	@Autowired
	private ClienteDao cdao;
	
	
	
	//------------------------------------------LOGIN--------------------------------------------
	
	@PostMapping("/login")
    public ResponseEntity<?> login(@RequestParam String username,@RequestParam String password) {
		
		Cliente cliente = cdao.buscarporUsuarioPassword(username, password);
		
		if(cliente != null)
			return new ResponseEntity<>(cliente,HttpStatus.ACCEPTED);
		else
			return new ResponseEntity<String>("USERNAME O CONTRASEÑA MAL", HttpStatus.NOT_FOUND);
        
    }
	
	
	//---------------------------------------LOGIN-----------------------------------------
	
	
	//--------------------------------------ALTA--------------------------------------------------
	
	@PostMapping("/alta/")
	public Cliente alta(@RequestBody Cliente cliente) {
		return cdao.insertOne(cliente);
		
	}
	
	
	//--------------------------------------ALTA--------------------------------------------------
	
	
	//-------------------------------------MODIFICAR-----------------------------------------------
	
	@PutMapping("/modificar")
	public Cliente modificar(@RequestBody Cliente cliente) {
		return cdao.updateOne(cliente);
	}
	
	
	//-------------------------------------MODIFICAR-----------------------------------------------

}
