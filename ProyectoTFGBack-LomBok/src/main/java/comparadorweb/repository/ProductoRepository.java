package comparadorweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import comparadorweb.entidades.Producto;

public interface ProductoRepository extends JpaRepository<Producto, Integer>{
	
	
	public Producto findByNombre(String nombre);
	
	@Query("from Producto p where p.categorias.idCategoria = ?1")
	public List<Producto> findByCategoria(int idCategoria);
}
