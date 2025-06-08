package comparadorweb.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import comparadorweb.entidades.ProductosProvedores;
import comparadorweb.repository.ProductosProvedoresRepository;
@Repository
public class ProductosProvedoresDaoImpl implements ProductosProvedoresDao{
	
	
	
	@Autowired
	private ProductosProvedoresRepository proprorepo;

	@Override
	public ProductosProvedores insertProductoProvedor(ProductosProvedores productosProvedores) {
		// TODO Auto-generated method stub
		
		try {
			if (proprorepo.existsById(productosProvedores.getIdPro()))
				return null;
			else  
				return proprorepo.save(productosProvedores);
			 
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int updateProductoProvedor(double precioProvedor) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteproductoProvedor(int idPro) {
		 try {
		        if (proprorepo.existsById(idPro)) {
		            proprorepo.deleteById(idPro);
		            return 1; 
		        } else {
		            return 0; 
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return -1; // Error
		    }
	}

	@Override
	public List<ProductosProvedores> buscarProductoYMostrarLosPreciosProvedores(int idProducto) {
		// TODO Auto-generated method stub
		return proprorepo.findByProducto(idProducto);
	}

	@Override
	public List<ProductosProvedores> buscarLosPreciosOfertadosDelProvedor(int idProvedor) {
		// TODO Auto-generated method stub
		return proprorepo.findByProvedor(idProvedor);
	}



	

	

}
