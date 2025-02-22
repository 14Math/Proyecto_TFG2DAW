package comparadorweb.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
@Table(name="PROVEDORES")
public class Provedor implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID_PROVEDOR")
	private int idProvedor;
	private String username;
	private String password;
	private String email;
	private String empresa;
	
	@Column(name="FECHA_REGISTRO")
	@Temporal(TemporalType.DATE)
	private Date fechaRegistro;

	public Provedor() {
		super();
	}

	public Provedor(int idProvedor, String username, String password, String email, String empresa,
			Date fechaRegistro) {
		super();
		this.idProvedor = idProvedor;
		this.username = username;
		this.password = password;
		this.email = email;
		this.empresa = empresa;
		this.fechaRegistro = fechaRegistro;
	}

	public int getIdProvedor() {
		return idProvedor;
	}

	public void setIdProvedor(int idProvedor) {
		this.idProvedor = idProvedor;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEmpresa() {
		return empresa;
	}

	public void setEmpresa(String empresa) {
		this.empresa = empresa;
	}

	public Date getFechaRegistro() {
		return fechaRegistro;
	}

	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}

	@Override
	public String toString() {
		return "Provedor [idProvedor=" + idProvedor + ", username=" + username + ", password=" + password + ", email="
				+ email + ", empresa=" + empresa + ", fechaRegistro=" + fechaRegistro + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(idProvedor);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Provedor other = (Provedor) obj;
		return idProvedor == other.idProvedor;
	}
	
	
	

}