package comparadorweb.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PrecioProveedorDto {
	
	private int idProveedor;
	private int idProducto;
	private double precioProveedor;

}
