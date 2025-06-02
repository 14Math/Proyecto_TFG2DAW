package comparadorweb.dao;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comparadorweb.entidades.ProductosProvedores;
import comparadorweb.entidades.Provedor;
import comparadorweb.repository.ProductosProvedoresRepository;
import comparadorweb.repository.ProvedorRepository;

@Repository
public class ProvedorDaoImpl implements ProvedorDao {

	@Autowired
	private ProvedorRepository prorepo;
	
	

	@Override
	public Provedor insertOne(Provedor provedores) {
		// TODO Auto-generated method stub
		try {
			if (prorepo.existsById(provedores.getIdProvedor()))
				return null;
			else  
				return prorepo.save(provedores);
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	@Override
	public Provedor updateOne(Provedor provedores) {
		// TODO Auto-generated method stub
		try {
			if (prorepo.existsById(provedores.getIdProvedor()))
				return prorepo.save(provedores);
			else  
				return null;
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}



	@Override
	public Provedor buscarUno(int idProvedor) {
		// TODO Auto-generated method stub
		return prorepo.findById(idProvedor).orElse(null);
	}

	@Override
	public Provedor buscarporUsuarioPassword(String username, String password) {
		// TODO Auto-generated method stub
		return prorepo.findByUsernameAndPassword(username, password);
	}



	

}
