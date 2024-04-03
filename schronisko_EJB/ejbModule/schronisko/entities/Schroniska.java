package schronisko.entities;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.NamedQuery;
import jakarta.persistence.OneToMany;

/**
 * The persistent class for the schroniska database table.
 * 
 */
@Entity
@NamedQuery(name = "Schroniska.findAll", query = "SELECT s FROM Schroniska s")
public class Schroniska implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int schroniskoId;

	private String adres;

	private String email;

	private String nazwa;

	private String miasto;

	private int nrTel;

	// bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name = "RolaId")
	private Role role;

	// bi-directional many-to-one association to Zwierzeta
	@OneToMany(mappedBy = "schroniska")
	private List<Zwierzeta> zwierzetas;

	public Schroniska() {
	}

	public int getSchroniskoId() {
		return this.schroniskoId;
	}

	public void setSchroniskoId(int schroniskoId) {
		this.schroniskoId = schroniskoId;
	}

	public String getAdres() {
		return this.adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNazwa() {
		return this.nazwa;
	}

	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}

	public String getMiasto() {
		return miasto;
	}

	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Zwierzeta> getZwierzetas() {
		return this.zwierzetas;
	}

	public void setZwierzetas(List<Zwierzeta> zwierzetas) {
		this.zwierzetas = zwierzetas;
	}

	public Zwierzeta addZwierzeta(Zwierzeta zwierzeta) {
		getZwierzetas().add(zwierzeta);
		zwierzeta.setSchroniska(this);

		return zwierzeta;
	}

	public Zwierzeta removeZwierzeta(Zwierzeta zwierzeta) {
		getZwierzetas().remove(zwierzeta);
		zwierzeta.setSchroniska(null);

		return zwierzeta;
	}

	public int getNrTel() {
		return nrTel;
	}

	public void setNrTel(int nrTel) {
		this.nrTel = nrTel;
	}

}