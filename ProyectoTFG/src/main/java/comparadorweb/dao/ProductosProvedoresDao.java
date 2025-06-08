package comparadorweb.dao;

import java.util.List;


import comparadorweb.entidades.ProductosProvedores;

public interface ProductosProvedoresDao {
	
	List<ProductosProvedores> buscarProductoYMostrarLosPreciosProvedores(int idProducto);
	List<ProductosProvedores> buscarLosPreciosOfertadosDelProvedor(int idProvedor);
	
	
	ProductosProvedores insertProductoProvedor (ProductosProvedores productosProvedores);
	int updateProductoProvedor (double precioProvedor);
	int deleteproductoProvedor (int idPro);


}
