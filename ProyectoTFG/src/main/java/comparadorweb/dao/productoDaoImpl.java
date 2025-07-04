package comparadorweb.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comparadorweb.entidades.ClienteProducto;
import comparadorweb.entidades.Producto;
import comparadorweb.repository.ClienteProductoRepository;
import comparadorweb.repository.ProductoRepository;
@Repository
public class productoDaoImpl implements productoDao{
	
	@Autowired
	private ProductoRepository prepo;
	@Autowired
	private ClienteProductoRepository cprepo;

	@Override
	public List<Producto> buscarTodos() {
		// TODO Auto-generated method stub
		return prepo.findAll();
	}


	@Override
	public Producto insertOne(Producto productos) {
		// TODO Auto-generated method stub
		try {
			if (prepo.existsById(productos.getIdProducto()))
				return null;
			else  
				return prepo.save(productos);
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}




	@Override
	public Producto buscarUna(int idProducto) {
		// TODO Auto-generated method stub
		return prepo.findById(idProducto).orElse(null);
	}


	@Override
	public Producto buscarUnaPorNombre(String nombre) {
		// TODO Auto-generated method stub
		return prepo.findByNombre(nombre);
	}


	@Override
	public List<Producto> buscarTodosPorCategoria(int idCategoria) {
		// TODO Auto-generated method stub
		return prepo.findByCategoria(idCategoria);
	}


	@Override
	public List<ClienteProducto> mostrarValoraciones(int idProducto) {
		// TODO Auto-generated method stub
		return cprepo.findByValoracion(idProducto);
	}

}
