package schronisko.beans;

import jakarta.inject.Inject;
import jakarta.inject.Named;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import schronisko.entities.Schroniska;
import schronisko.entities.Uzytkownicy;
import schronisko.dao.RoleDAO;
import schronisko.dao.SchroniskaDAO;
import schronisko.dao.UzytkownicyDAO;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import jakarta.faces.annotation.ManagedProperty;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.RequestScoped;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.application.FacesMessage;

import jakarta.faces.context.ExternalContext;
import jakarta.faces.context.FacesContext;
import jakarta.faces.context.Flash;
import jakarta.faces.view.ViewScoped;
import simplesecurity.RemoteClient;

@Named
//@RequestScoped
//@SessionScoped
@ViewScoped
public class LoginBB implements Serializable {
	private static final long serialVersionUID = 1L;
	private static final String PAGE_MAIN = "/index";
	private static final String PAGE_LOGIN = "/userLogin";
	private static final String PAGE_STAY_AT_THE_SAME = null;

	@EJB
	UzytkownicyDAO uzytkownicyDAO;

	@EJB
	RoleDAO roleDAO;

	@Inject
	SchroniskaDAO schroniskaDAO;

	@Inject
	Flash flash;

	@Inject
	private PasswordUtils passwordUtils;

	private String haslo;

	private String email;

	private String nazwaRoli;

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

	@Inject
	@ManagedProperty("#{txtLogErr}")
	private ResourceBundle txtLogErr;

	public String doLogin() {

		FacesContext ctx = FacesContext.getCurrentInstance();

		String email = getEmail();
		String haslo = getHaslo();

		Uzytkownicy uzytkownik = null;

		// 1. verify login and password - get User from "database"
		try {
			uzytkownik = uzytkownicyDAO.getUserByEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Błąd przy pobieraniu użytkownika z bazy danych: " + e.getMessage());
		}

		if (uzytkownik == null || !PasswordUtils.checkPassword(haslo, uzytkownik.getHaslo())) {
			FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd logowania",
					"Niepoprawny login lub hasło");
			FacesContext.getCurrentInstance().addMessage(null, message);
			return null;
		}

		if (uzytkownik.getRole().getRolaId() == 2) {

			Schroniska schronisko = schroniskaDAO.getSchroniskoByEmail(email);
			if (schronisko != null) {
				// Zapisz schroniskoId w sesji
				HttpSession session = (HttpSession) ctx.getExternalContext().getSession(true);
				session.setAttribute("schroniskoId", schronisko.getSchroniskoId());
			}
		}

		// 3. if logged in: get User roles, save in RemoteClient and store it in session

		RemoteClient<Uzytkownicy> client = new RemoteClient<Uzytkownicy>(); // create new RemoteClient
		client.setDetails(uzytkownik);

		List<String> roles = uzytkownicyDAO.getRolesFromDB(uzytkownik); // get User roles
		nazwaRoli = uzytkownik.getRole().getNazwaRoli();
		if (roles != null) { // save roles in RemoteClient
			for (String role : roles) {
				client.getRoles().add(role);

			}
		}

		// store RemoteClient with request info in session (needed for SecurityFilter)
		HttpServletRequest request = (HttpServletRequest) ctx.getExternalContext().getRequest();
		client.store(request);

		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
		session.setAttribute("loggedInUser", uzytkownik);
		session.setAttribute("userRole", nazwaRoli);
		System.out.println("Nazwa roli: " + nazwaRoli);
		// and enter the system (now SecurityFilter will pass the request)

		return PAGE_MAIN;
	}

	public boolean isUserInRole(String nazwaRoli) {
		FacesContext context = FacesContext.getCurrentInstance();
		ExternalContext externalContext = context.getExternalContext();
		Uzytkownicy user = (Uzytkownicy) externalContext.getSessionMap().get("loggedInUser");

		if (user != null && user.getRole() != null) {
			return user.getRole().getNazwaRoli().equals(nazwaRoli);
		}

		return false;

	}

	public String doLogout() {

		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);

		if (session != null) {
			session.invalidate(); //
		}
		return PAGE_LOGIN;
	}

	public String getProfilePage() {
		FacesContext ctx = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) ctx.getExternalContext().getSession(false);
		Uzytkownicy loggedInUser = (Uzytkownicy) session.getAttribute("loggedInUser");
		if (loggedInUser != null && loggedInUser.getRole().getRolaId() == 2) {
			return "/schronisko/shelterAnimalList.xhtml";
		} else {
			return "/user/userProfile.xhtml";
		}
	}

}
