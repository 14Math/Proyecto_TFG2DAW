package comparadorweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import comparadorweb.entidades.Administrador;

public interface AdministradorRepository extends JpaRepository<Administrador, Integer>{
	
	public Administrador findByUsernameAndPassword(String username, String password);

}
