package comparadorweb.dao;

import java.util.List;

import comparadorweb.entidades.Producto;
import comparadorweb.entidades.ProductosProvedores;
import comparadorweb.entidades.Provedor;

public interface ProvedorDao {
	
	List<Provedor> mostrarTodos();
	
	Provedor buscarUno(int idProvedor); 
	Provedor buscarporUsuarioPassword(String username, String password);
	
	
	Provedor insertOne (Provedor provedores);
	Provedor updateOne (Provedor provedores);
	int deleteOne(Provedor provedores);
	void eliminarOfertasDeProveedor(int idProvedor);

}
