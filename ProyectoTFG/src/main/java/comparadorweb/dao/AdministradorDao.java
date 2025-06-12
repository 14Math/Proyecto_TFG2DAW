package comparadorweb.dao;

import comparadorweb.entidades.Administrador;


public interface AdministradorDao {
	Administrador buscarporUsuarioPassword(String username, String password);

}
