package comparadorweb.dao;

import comparadorweb.entidades.Cliente;

public interface ClienteDao {
	
	Cliente buscarporUsuarioPassword(String username, String password);
	
	Cliente insertOne (Cliente clientes);
	Cliente updateOne (Cliente clientes);

}
