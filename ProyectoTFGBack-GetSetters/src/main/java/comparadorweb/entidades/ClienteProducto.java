package comparadorweb.entidades;

import java.io.Serializable;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name="CLIENTES_PRODUCTOS")
public class ClienteProducto implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@Column(name="ID_CLIPROD")
	private int idCliProd;
	
	@ManyToOne
	@JoinColumn(name= "ID_CLIENTE")
	private Cliente clientes;
	
	@ManyToOne
	@JoinColumn(name= "ID_PRODUCTO")
	private Producto productos;
	
	private String opinion;
	private int valoracion;
	public ClienteProducto() {
		super();
	}
	public ClienteProducto(int idCliProd, Cliente clientes, Producto productos, String opinion, int valoracion) {
		super();
		this.idCliProd = idCliProd;
		this.clientes = clientes;
		this.productos = productos;
		this.opinion = opinion;
		this.valoracion = valoracion;
	}
	public int getIdCliProd() {
		return idCliProd;
	}
	public void setIdCliProd(int idCliProd) {
		this.idCliProd = idCliProd;
	}
	public Cliente getClientes() {
		return clientes;
	}
	public void setClientes(Cliente clientes) {
		this.clientes = clientes;
	}
	public Producto getProductos() {
		return productos;
	}
	public void setProductos(Producto productos) {
		this.productos = productos;
	}
	public String getOpinion() {
		return opinion;
	}
	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}
	public int getValoracion() {
		return valoracion;
	}
	public void setValoracion(int valoracion) {
		this.valoracion = valoracion;
	}
	@Override
	public String toString() {
		return "ClienteProducto [idCliProd=" + idCliProd + ", clientes=" + clientes + ", productos=" + productos
				+ ", opinion=" + opinion + ", valoracion=" + valoracion + "]";
	}
	@Override
	public int hashCode() {
		return Objects.hash(idCliProd);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClienteProducto other = (ClienteProducto) obj;
		return idCliProd == other.idCliProd;
	}


}