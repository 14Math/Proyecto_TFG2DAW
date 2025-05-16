package comparadorweb.dao;

import java.util.List;

import comparadorweb.entidades.ClienteProducto;
import comparadorweb.entidades.Producto;

public interface productoDao {
	
	Producto buscarUna(int idProducto);
	Producto buscarUnaPorNombre(String nombre);
	
	List<Producto> buscarTodosPorCategoria(int idCategoria);
	List<Producto> buscarTodos();
	List<ClienteProducto> mostrarValoraciones(int idProducto);
	int insertOne (Producto productos);

}
																									