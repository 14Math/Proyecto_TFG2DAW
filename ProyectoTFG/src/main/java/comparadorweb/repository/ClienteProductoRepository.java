package comparadorweb.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import comparadorweb.entidades.ClienteProducto;

public interface ClienteProductoRepository extends JpaRepository<ClienteProducto, Integer>{
	
	@Query("from ClienteProducto cp where cp.productos.idProducto =?1")
	public List<ClienteProducto> findByValoracion(int idProducto);
	
    void deleteByClientesIdCliente(int idCliente);

}
