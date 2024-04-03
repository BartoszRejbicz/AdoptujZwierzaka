package schronisko.entities;

import java.io.Serializable;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 * The persistent class for the uzytkownicy database table.
 * 
 */
@Entity
@NamedQuery(name = "Uzytkownicy.findAll", query = "SELECT u FROM Uzytkownicy u")
public class Uzytkownicy implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int uzytkownikId;

	private String email;

	private String haslo;

	private String imie;

	private String nazwisko;

	// bi-directional many-to-many association to Zwierzeta
	@ManyToMany(mappedBy = "uzytkownicies")
	private List<Zwierzeta> zwierzetas;

	// bi-directional many-to-one association to Role
	@ManyToOne
	@JoinColumn(name = "RolaId")
	private Role role;

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Uzytkownicy() {
		this.zwierzetas = new ArrayList<>();
	}

	public int getUzytkownikId() {
		return this.uzytkownikId;
	}

	public void setUzytkownikId(int uzytkownikId) {
		this.uzytkownikId = uzytkownikId;
	}

	public String getHaslo() {
		return this.haslo;
	}

	public void setHaslo(String haslo) {
		this.haslo = haslo;
	}

	public String getImie() {
		return this.imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getNazwisko() {
		return this.nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}

	public List<Zwierzeta> getZwierzetas() {
		return this.zwierzetas;
	}

	public void setZwierzetas(List<Zwierzeta> zwierzetas) {
		this.zwierzetas = zwierzetas;
	}

	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

}