package comparadorweb.dao;

import java.util.List;

import comparadorweb.entidades.Producto;
import comparadorweb.entidades.ProductosProvedores;
import comparadorweb.entidades.Provedor;

public interface ProvedorDao {
	
	Provedor buscarUno(int idProvedor); 
	Provedor buscarporUsuarioPassword(String username, String password);
	
	
	int insertOne (Provedor provedores);
	Provedor updateOne (Provedor provedores);

}
