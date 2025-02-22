package comparadorweb.dao;

import comparadorweb.entidades.Cliente;

public interface ClienteDao {
	
	Cliente buscarporUsuarioPassword(String username, String password);
	
	int insertOne (Cliente clientes);
	int updateOne (Cliente clientes);

}
