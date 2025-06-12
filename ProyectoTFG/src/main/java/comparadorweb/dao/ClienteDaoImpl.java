package comparadorweb.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comparadorweb.entidades.Cliente;
import comparadorweb.repository.ClienteProductoRepository;
import comparadorweb.repository.ClienteRepository;
import jakarta.transaction.Transactional;
@Repository
public class ClienteDaoImpl implements ClienteDao{
	
	@Autowired
	private ClienteRepository crepo;
	
	@Autowired
	private ClienteProductoRepository cprepo;


	@Override
	public Cliente buscarporUsuarioPassword(String username, String password) {
		// TODO Auto-generated method stub
		return crepo.findByUsernameAndPassword(username, password);
	}

	@Override
	public Cliente insertOne(Cliente clientes) {
		// TODO Auto-generated method stub
		try {
			if (crepo.existsById(clientes.getIdCliente()))
				return null;
			else  
				return crepo.save(clientes);
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Cliente updateOne(Cliente clientes) {
		try {
			if (crepo.existsById(clientes.getIdCliente()))
				return crepo.save(clientes);
			else  
				return null;
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	@Override
	public Cliente buscarporUsuario(String username) {
	    return crepo.findByUsername(username); 
	}

	@Override
	public List<Cliente> mostrarTodos() {
		// TODO Auto-generated method stub
		return crepo.findAll();
	}

	@Override
	public int deleteOne(Cliente clientes) {
		// TODO Auto-generated method stub
		if (crepo.existsById(clientes.getIdCliente())) {
			crepo.delete(clientes);
			return 1;
		}
		return 0;
	}

	@Override
	public Cliente buscarporId(int idCliente) {
		// TODO Auto-generated method stub
		return crepo.findById(idCliente).orElse(null);
	}

	@Transactional
	public void eliminarProductosDeCliente(int idCliente) {
		// TODO Auto-generated method stub
		cprepo.deleteByClientesIdCliente(idCliente);
		
	}

	


}
