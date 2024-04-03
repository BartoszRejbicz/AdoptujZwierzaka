package schronisko.entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;

/**
 * The persistent class for the role database table.
 * 
 */
@Entity
@NamedQuery(name = "Role.findAll", query = "SELECT r FROM Role r")
public class Role implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int rolaId;

	private String nazwaRoli;

	// bi-directional many-to-one association to Schroniska
	@OneToMany(mappedBy = "role")
	private List<Schroniska> schroniskas;

	// bi-directional many-to-one association to Uzytkownicy
	@OneToMany(mappedBy = "role")
	private List<Uzytkownicy> uzytkownicies;

	public Role() {
	}

	public int getRolaId() {
		return this.rolaId;
	}

	public void setRolaId(int rolaId) {
		this.rolaId = rolaId;
	}

	public String getNazwaRoli() {
		return this.nazwaRoli;
	}

	public void setNazwaRoli(String nazwaRoli) {
		this.nazwaRoli = nazwaRoli;
	}

	public List<Schroniska> getSchroniskas() {
		return this.schroniskas;
	}

	public void setSchroniskas(List<Schroniska> schroniskas) {
		this.schroniskas = schroniskas;
	}

	public Schroniska addSchroniska(Schroniska schroniska) {
		getSchroniskas().add(schroniska);
		schroniska.setRole(this);

		return schroniska;
	}

	public Schroniska removeSchroniska(Schroniska schroniska) {
		getSchroniskas().remove(schroniska);
		schroniska.setRole(null);

		return schroniska;
	}

	public List<Uzytkownicy> getUzytkownicies() {
		return this.uzytkownicies;
	}

	public void setUzytkownicies(List<Uzytkownicy> uzytkownicies) {
		this.uzytkownicies = uzytkownicies;
	}

	public Uzytkownicy addUzytkownicy(Uzytkownicy uzytkownicy) {
		getUzytkownicies().add(uzytkownicy);
		uzytkownicy.setRole(this);

		return uzytkownicy;
	}

	public Uzytkownicy removeUzytkownicy(Uzytkownicy uzytkownicy) {
		getUzytkownicies().remove(uzytkownicy);
		uzytkownicy.setRole(null);

		return uzytkownicy;
	}

}