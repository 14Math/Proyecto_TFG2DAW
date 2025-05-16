package comparadorweb.restcontroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import comparadorweb.dao.CategoriaDao;
import comparadorweb.dao.productoDao;
import comparadorweb.entidades.Categoria;
import comparadorweb.entidades.Producto;

import java.util.List;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/categorias")
public class CategoriaRestController {
	
	@Autowired
    private CategoriaDao catedao;
	
	@Autowired
    private productoDao pdao;

 
	@GetMapping("/todos/")
    public ResponseEntity<List<Categoria>> todos() {
        List<Categoria> categorias = catedao.buscarTodos();
        return new ResponseEntity<>(categorias, HttpStatus.OK);
    }
	
	//------------------------------------BUSCAR TODOS-------------------------------------
			@GetMapping("/productos/{idCategoria}")
			public ResponseEntity<?>  todosPorCategoria(@PathVariable int idCategoria) {
				List<Producto> producto = pdao.buscarTodosPorCategoria(idCategoria);
				

				 if ( producto != null)
			 
					 return new ResponseEntity<> (producto, HttpStatus.OK);
				 else
					 return new ResponseEntity<String>("Categoria no existe", HttpStatus.NOT_FOUND);
			}
		//------------------------------------BUSCAR TODOS-------------------------------------

}

    
