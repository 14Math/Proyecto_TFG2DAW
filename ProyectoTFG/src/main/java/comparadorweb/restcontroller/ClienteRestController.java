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
import comparadorweb.entidades.ClienteProducto;
import comparadorweb.repository.ClienteProductoRepository;

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
	
	@PostMapping("/alta")
	public ResponseEntity<?> altaCliente(@RequestBody Cliente nuevoCliente) {
        try {
            // Validar que los datos del cliente no estén vacíos
            if (nuevoCliente == null || nuevoCliente.getUsername() == null || nuevoCliente.getUsername().isEmpty()) {
                return new ResponseEntity<>("Datos inválidos. El nombre de usuario es obligatorio.", HttpStatus.BAD_REQUEST);
            }

            // Insertar el cliente en la base de datos
            Cliente clienteGuardado = cdao.insertOne(nuevoCliente);
            if (clienteGuardado != null) {
                return new ResponseEntity<>(clienteGuardado, HttpStatus.CREATED);
            } else {
                return new ResponseEntity<>("Error al registrar el cliente.", HttpStatus.INTERNAL_SERVER_ERROR);
            }
        } catch (Exception e) {
            return new ResponseEntity<>("Error inesperado: " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
	
	//--------------------------------------ALTA--------------------------------------------------
	
	
	//-------------------------------------MODIFICAR-----------------------------------------------
	
	@PutMapping("/modificar")
	public Cliente modificar(@RequestBody Cliente cliente) {
		return cdao.updateOne(cliente);
	}
	
	
	//-------------------------------------MODIFICAR-----------------------------------------------

}
