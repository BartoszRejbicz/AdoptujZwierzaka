package schronisko.entities;

import java.io.Serializable;
import jakarta.persistence.*;
import java.math.BigDecimal;
import java.util.List;


/**
 * The persistent class for the zwierzeta database table.
 * 
 */
@Entity
@NamedQuery(name="Zwierzeta.findAll", query="SELECT z FROM Zwierzeta z")
public class Zwierzeta implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int zwierzeId;
	
	private String imie;

	@Lob
	private String cechyZachowania;

	private String kastrowany;

	private String kolor;

	@Lob
	private String opis;

	private String plec;

	@Lob
	private String przebyteChoroby;

	private String rasaKota;

	private String rasaPsa;

	private String rodzajWlosia;

	private String typ;

	private BigDecimal waga;

	private String wiek;

	private String wielkosc;

	private String zdjecieURL;

	//bi-directional many-to-many association to Uzytkownicy
	@ManyToMany
	@JoinTable(
		name="ulubione"
		, joinColumns={
			@JoinColumn(name="ZwierzeId")
			}
		, inverseJoinColumns={
			@JoinColumn(name="UzytkownikId")
			}
		)
	private List<Uzytkownicy> uzytkownicies;

	//bi-directional many-to-one association to Schroniska
	@ManyToOne
	@JoinColumn(name="SchroniskoId")
	private Schroniska schroniska;

	public Zwierzeta() {
	}

	public int getZwierzeId() {
		return this.zwierzeId;
	}

	public void setZwierzeId(int zwierzeId) {
		this.zwierzeId = zwierzeId;
	}
	
	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getCechyZachowania() {
		return this.cechyZachowania;
	}

	public void setCechyZachowania(String cechyZachowania) {
		this.cechyZachowania = cechyZachowania;
	}

	public String getKastrowany() {
		return this.kastrowany;
	}

	public void setKastrowany(String kastrowany) {
		this.kastrowany = kastrowany;
	}

	public String getKolor() {
		return this.kolor;
	}

	public void setKolor(String kolor) {
		this.kolor = kolor;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public String getPlec() {
		return this.plec;
	}

	public void setPlec(String plec) {
		this.plec = plec;
	}

	public String getPrzebyteChoroby() {
		return this.przebyteChoroby;
	}

	public void setPrzebyteChoroby(String przebyteChoroby) {
		this.przebyteChoroby = przebyteChoroby;
	}

	public String getRasaKota() {
		return this.rasaKota;
	}

	public void setRasaKota(String rasaKota) {
		this.rasaKota = rasaKota;
	}

	public String getRasaPsa() {
		return this.rasaPsa;
	}

	public void setRasaPsa(String rasaPsa) {
		this.rasaPsa = rasaPsa;
	}

	public String getRodzajWlosia() {
		return this.rodzajWlosia;
	}

	public void setRodzajWlosia(String rodzajWlosia) {
		this.rodzajWlosia = rodzajWlosia;
	}

	public String getTyp() {
		return this.typ;
	}

	public void setTyp(String typ) {
		this.typ = typ;
	}

	public BigDecimal getWaga() {
		return this.waga;
	}

	public void setWaga(BigDecimal waga) {
		this.waga = waga;
	}

	public String getWiek() {
		return this.wiek;
	}

	public void setWiek(String wiek) {
		this.wiek = wiek;
	}

	public String getWielkosc() {
		return this.wielkosc;
	}

	public void setWielkosc(String wielkosc) {
		this.wielkosc = wielkosc;
	}

	public String getZdjecieURL() {
		return this.zdjecieURL;
	}

	public void setZdjecieURL(String zdjecieURL) {
		this.zdjecieURL = zdjecieURL;
	}

	public List<Uzytkownicy> getUzytkownicies() {
		return this.uzytkownicies;
	}

	public void setUzytkownicies(List<Uzytkownicy> uzytkownicies) {
		this.uzytkownicies = uzytkownicies;
	}

	public Schroniska getSchroniska() {
		return this.schroniska;
	}

	public void setSchroniska(Schroniska schroniska) {
		this.schroniska = schroniska;
	}

}