package schronisko.beans;

import jakarta.annotation.security.DeclareRoles;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.ExternalContext;
import jakarta.faces.context.FacesContext;
import jakarta.inject.Named;
import schronisko.dao.RoleDAO;
import schronisko.dao.SchroniskaDAO;
import schronisko.dao.UzytkownicyDAO;
import schronisko.entities.Role;
import schronisko.entities.Schroniska;
import schronisko.entities.Uzytkownicy;

import java.io.Serializable;
import java.util.List;

@Named
@RequestScoped

public class AddShelterBB implements Serializable {
	private static final long serialVersionUID = 1L;
	private Schroniska newShelter = new Schroniska();
	private String selectedUserEmail;
	private String nazwa;
	private String adres;
	private String miasto;
	private String email;
	private String nazwaRoli = "schronisko";
	private int nrTel;

	@EJB
	private SchroniskaDAO schroniskoDAO;

	@EJB
	private UzytkownicyDAO uzytkownicyDAO;

	@EJB
	private RoleDAO roleDAO;

	public String addShelter() {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();

		try {
			Uzytkownicy user = uzytkownicyDAO.findByEmail(selectedUserEmail);
			if (user != null) {

				newShelter.setNazwa(nazwa);
				newShelter.setAdres(adres);
				newShelter.setMiasto(miasto);
				newShelter.setNrTel(nrTel);
				newShelter.setEmail(selectedUserEmail);
				Role schroniskoRole = roleDAO.findByName("schronisko");
				newShelter.setRole(schroniskoRole);
				schroniskoDAO.create(newShelter);
				FacesContext.getCurrentInstance().addMessage(null,
						new FacesMessage(FacesMessage.SEVERITY_INFO, "Sukces", "Schronisko zostało dodane."));
				return "/admin/userList.xhtml?faces-redirect=true";
			}
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd", "Dodanie schroniska nie powiodło się."));
			return null;
		}
		return "/index.xhtml?faces-redirect=true";
	}

	public Schroniska getNewShelter() {
		return newShelter;
	}

	public void setNewShelter(Schroniska newShelter) {
		this.newShelter = newShelter;
	}

	public String getSelectedUserEmail() {
		return selectedUserEmail;
	}

	public void setSelectedUserEmail(String selectedUserEmail) {
		this.selectedUserEmail = selectedUserEmail;
	}

	@RolesAllowed({ "admin" })
	public List<Uzytkownicy> getAvailableSchroniskoUsers() {
		return uzytkownicyDAO.findAllSchroniskoUsers();
	}

	public String getNazwa() {
		return nazwa;
	}

	public void setNazwa(String nazwa) {
		this.nazwa = nazwa;
	}

	public String getAdres() {
		return adres;
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getMiasto() {
		return miasto;
	}

	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}

	public int getNrTel() {
		return nrTel;
	}

	public void setNrTel(int nrTel) {
		this.nrTel = nrTel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
