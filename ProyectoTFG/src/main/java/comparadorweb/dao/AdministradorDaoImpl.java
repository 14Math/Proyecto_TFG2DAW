package comparadorweb.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comparadorweb.entidades.Administrador;
import comparadorweb.repository.AdministradorRepository;

@Repository
public class AdministradorDaoImpl implements AdministradorDao{
	
	@Autowired
    private AdministradorRepository adrepo;

	@Override
	public Administrador buscarporUsuarioPassword(String username, String password) {
		// TODO Auto-generated method stub
		return adrepo.findByUsernameAndPassword(username, password);
	}

}
