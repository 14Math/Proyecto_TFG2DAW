package comparadorweb.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comparadorweb.entidades.Cliente;
import comparadorweb.repository.ClienteRepository;
@Repository
public class ClienteDaoImpl implements ClienteDao{
	
	@Autowired
	private ClienteRepository crepo;


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

	


}
