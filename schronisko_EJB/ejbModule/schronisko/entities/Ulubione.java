package schronisko.entities;

import java.io.Serializable;
import jakarta.persistence.*;

/**
 * The persistent class for the ulubione database table.
 * 
 */
@Entity
@NamedQuery(name = "Ulubione.findAll", query = "SELECT u FROM Ulubione u")
public class Ulubione implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private UlubionePK id;

	public Ulubione() {
	}

	public UlubionePK getId() {
		return this.id;
	}

	public void setId(UlubionePK id) {
		this.id = id;
	}

}