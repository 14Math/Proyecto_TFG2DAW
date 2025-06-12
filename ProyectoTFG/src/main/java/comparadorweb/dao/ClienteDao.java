package comparadorweb.dao;

import java.util.List;

import comparadorweb.entidades.Cliente;


public interface ClienteDao {
	
	List<Cliente> mostrarTodos();
	
	Cliente buscarporUsuarioPassword(String username, String password);
	Cliente buscarporUsuario(String username);
	Cliente buscarporId(int idCliente);
	
	Cliente insertOne (Cliente clientes);
	Cliente updateOne (Cliente clientes);
	int deleteOne(Cliente clientes);
	void eliminarProductosDeCliente(int idCliente);

}
