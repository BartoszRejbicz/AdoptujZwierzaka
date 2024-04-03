package schronisko.entities;

import java.io.Serializable;
import jakarta.persistence.*;

/**
 * The primary key class for the ulubione database table.
 * 
 */
@Embeddable
public class UlubionePK implements Serializable {
	// default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(insertable = false, updatable = false)
	private int uzytkownikId;

	@Column(insertable = false, updatable = false)
	private int zwierzeId;

	public UlubionePK() {
	}

	public UlubionePK(int uzytkownikId, int zwierzeId) {
		// TODO Auto-generated constructor stub
	}

	public int getUzytkownikId() {
		return this.uzytkownikId;
	}

	public void setUzytkownikId(int uzytkownikId) {
		this.uzytkownikId = uzytkownikId;
	}

	public int getZwierzeId() {
		return this.zwierzeId;
	}

	public void setZwierzeId(int zwierzeId) {
		this.zwierzeId = zwierzeId;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof UlubionePK)) {
			return false;
		}
		UlubionePK castOther = (UlubionePK) other;
		return (this.uzytkownikId == castOther.uzytkownikId) && (this.zwierzeId == castOther.zwierzeId);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.uzytkownikId;
		hash = hash * prime + this.zwierzeId;

		return hash;
	}
}