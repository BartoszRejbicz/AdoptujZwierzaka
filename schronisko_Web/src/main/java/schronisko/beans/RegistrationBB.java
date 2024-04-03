package schronisko.beans;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.primefaces.*;

import jakarta.faces.context.Flash;
import jakarta.faces.validator.ValidatorException;
import jakarta.faces.view.ViewScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.component.UIComponent;
import jakarta.faces.context.ExternalContext;
import jakarta.faces.context.FacesContext;
import jakarta.annotation.PostConstruct;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import schronisko.dao.*;
import schronisko.entities.Role;
import schronisko.entities.Uzytkownicy;
import jakarta.servlet.*;

@Named
@RequestScoped
public class RegistrationBB implements Serializable {

	private static final long serialVersionUID = 1L;
	private static final String PAGE_STAY_AT_THE_SAME = null;
	private static final String PAGE_LOGIN = "/userLogin?faces-redirect=true";
	private static final String PAGE_REG = "/userRegister?faces-redirect=true";

	@Inject
	private PasswordUtils passwordUtils;

	@EJB
	UzytkownicyDAO uzytkownicyDAO;

	@EJB
	RoleDAO roleDAO;

	private Uzytkownicy nowyUzytkownik = new Uzytkownicy();

	private String email;
	private String haslo;
	private String confirmHaslo;
	private String imie;
	private String nazwisko;

	public String register() {

		String email = getEmail();

		Uzytkownicy userExists = getUserByEmail(email);

		if (userExists != null && email.equals(userExists.getEmail())) {

			FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd rejestracji",
					"Użytkownik o podanym adresie email już istnieje.");
			FacesContext.getCurrentInstance().addMessage(null, message);
			System.out.println("Dodano komunikat: " + message.getDetail());
			return null;
		}

		String plainTextPassword = haslo;

		if (plainTextPassword == null || !plainTextPassword.equals(confirmHaslo)) {
			FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Hasła nie pasują do siebie",
					"Hasła muszą być takie same");
			FacesContext.getCurrentInstance().addMessage(null, message);
			System.out.println("Dodano komunikat: " + message.getDetail());
			return null;
		}

		Uzytkownicy nowyUzytkownik = new Uzytkownicy();
		String haslo = PasswordUtils.hashPassword(plainTextPassword);
		nowyUzytkownik.setHaslo(haslo);
		nowyUzytkownik.setEmail(email);
		;
		nowyUzytkownik.setImie(imie);
		nowyUzytkownik.setNazwisko(nazwisko);
		Role r = roleDAO.findByName("user");
		nowyUzytkownik.setRole(r);

		try {
			uzytkownicyDAO.create(nowyUzytkownik);
			FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Rejestracja zakończona pomyślnie",
					"Konto zostało utworzone. Zaraz zostaniesz przeniesiony na stronę logowania.");
			FacesContext.getCurrentInstance().addMessage(null, message);
			System.out.println("Dodano komunikat: " + message.getDetail());

			redirecting = true;
			PrimeFaces.current().executeScript(
					"setTimeout(function(){window.location.href='/schronisko_Web/userLogin.xhtml';}, 3000);");

			return null;
		} catch (Exception e) {
			e.printStackTrace();
			FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd podczas rejestracji",
					"Nie udalo sie utworzyć konta");
			FacesContext.getCurrentInstance().addMessage(null, message);
			System.out.println("Dodano komunikat: " + message.getDetail());
			return PAGE_STAY_AT_THE_SAME;
		}
	}

	public Uzytkownicy getUserByEmail(String email) {

		return uzytkownicyDAO.getUserByEmail(email);
	}

	private boolean redirecting;

	public boolean isRedirecting() {
		return redirecting;
	}

	public void setRedirecting(boolean redirecting) {
		this.redirecting = redirecting;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHaslo() {
		return haslo;
	}

	public void setHaslo(String haslo) {

		this.haslo = haslo;
	}

	public String getConfirmHaslo() {
		return confirmHaslo;
	}

	public void setConfirmHaslo(String confirmHaslo) {
		this.confirmHaslo = confirmHaslo;
	}

	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getNazwisko() {
		return nazwisko;
	}

	public void setNazwisko(String nazwisko) {
		this.nazwisko = nazwisko;
	}

	public PasswordUtils getPasswordUtils() {
		return passwordUtils;
	}

	public void setPasswordUtils(PasswordUtils passwordUtils) {
		this.passwordUtils = passwordUtils;
	}

}