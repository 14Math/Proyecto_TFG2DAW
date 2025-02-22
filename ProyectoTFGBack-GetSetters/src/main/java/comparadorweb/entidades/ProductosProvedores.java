package comparadorweb.entidades;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name="PRODUCTOS_PROVEDORES")
public class ProductosProvedores implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="ID_PRO")
	private int idPro;
	
	
	@ManyToOne
	@JoinColumn(name= "ID_PRODUCTO")
	private Producto producto;
	@ManyToOne
	@JoinColumn(name= "ID_PROVEDOR")
	private Provedor provedor;
	@Column(name="PRECIO_PROVEDOR")
	private double precioProvedor;
	public ProductosProvedores() {
		super();
	}
	public ProductosProvedores(int idPro, Producto producto, Provedor provedor, double precioProvedor) {
		super();
		this.idPro = idPro;
		this.producto = producto;
		this.provedor = provedor;
		this.precioProvedor = precioProvedor;
	}
	public int getIdPro() {
		return idPro;
	}
	public void setIdPro(int idPro) {
		this.idPro = idPro;
	}
	public Producto getProducto() {
		return producto;
	}
	public void setProducto(Producto producto) {
		this.producto = producto;
	}
	public Provedor getProvedor() {
		return provedor;
	}
	public void setProvedor(Provedor provedor) {
		this.provedor = provedor;
	}
	public double getPrecioProvedor() {
		return precioProvedor;
	}
	public void setPrecioProvedor(double precioProvedor) {
		this.precioProvedor = precioProvedor;
	}
	@Override
	public String toString() {
		return "ProductosProvedores [idPro=" + idPro + ", producto=" + producto + ", provedor=" + provedor
				+ ", precioProvedor=" + precioProvedor + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(idPro);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductosProvedores other = (ProductosProvedores) obj;
		return idPro == other.idPro;
	}
	
	
	

}