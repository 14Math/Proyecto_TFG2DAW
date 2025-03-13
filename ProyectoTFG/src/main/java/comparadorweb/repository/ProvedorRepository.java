package comparadorweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import comparadorweb.entidades.Cliente;
import comparadorweb.entidades.Provedor;

public interface ProvedorRepository extends JpaRepository<Provedor, Integer>{
	
	public Provedor findByUsernameAndPassword(String username, String password);

}
