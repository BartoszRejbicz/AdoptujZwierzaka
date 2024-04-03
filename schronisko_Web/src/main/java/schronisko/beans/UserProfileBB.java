package schronisko.beans;

import jakarta.enterprise.context.RequestScoped;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import jakarta.servlet.http.HttpSession;
import schronisko.dao.SchroniskaDAO;
import schronisko.dao.UlubioneDAO;
import schronisko.dao.UzytkownicyDAO;
import schronisko.entities.Uzytkownicy;
import jakarta.annotation.PostConstruct;
import jakarta.annotation.security.DeclareRoles;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.EJB;
import jakarta.inject.Inject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import schronisko.entities.Zwierzeta;

@Named
@ViewScoped

public class UserProfileBB implements Serializable {
	private static final long serialVersionUID = 1L;
	private Uzytkownicy user;
	private int userId;
	private List<Zwierzeta> favoriteAnimals;

	@Inject
	private UzytkownicyDAO uzytkownicyDAO;
	@Inject
	private UlubioneDAO ulubioneDAO;

	@EJB
	SchroniskaDAO schroniskaDAO;

	@PostConstruct

	public void init() {

		FacesContext context = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) context.getExternalContext().getSession(false);
		Uzytkownicy loggedInUser = (Uzytkownicy) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			this.userId = loggedInUser.getUzytkownikId();
			this.user = uzytkownicyDAO.getUserById(userId);

			loadUser();
		}
	}

	public void loadUser() {
		this.user = uzytkownicyDAO.find(userId);
		this.user = uzytkownicyDAO.findUserWithFavoritesById(userId);

		if (this.user != null && this.user.getZwierzetas() != null && !this.user.getZwierzetas().isEmpty()) {
			this.favoriteAnimals = user.getZwierzetas();
		} else {

			this.favoriteAnimals = new ArrayList<>();
		}
		this.user = uzytkownicyDAO.getUserById(userId);
	}

	public String viewUserProfile() {
		FacesContext context = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) context.getExternalContext().getSession(false);

		Uzytkownicy loggedInUser = (Uzytkownicy) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {

			// Jeśli użytkownik ma rolę schroniska
			if (loggedInUser.getRole().getRolaId() == 2) {

				return "/schronisko/shelterAnimalsList.xhtml?faces-redirect=true";
			}

			else {

				this.userId = loggedInUser.getUzytkownikId();

				return "/profile/userProfile.xhtml?faces-redirect=true&userId=" + this.userId;
			}
		} else {
			// Użytkownik nie jest zalogowany
			FacesMessage messages = new FacesMessage(FacesMessage.SEVERITY_ERROR, "UWAGA", "Musisz się zalogować.");
			FacesContext.getCurrentInstance().addMessage(null, messages);
			return null; // Przekieruj do strony logowania
		}
	}

	public void removeFromFavorites(int zwierzeId) {
		FacesContext ctx = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) ctx.getExternalContext().getSession(false);
		Uzytkownicy loggedInUser = (Uzytkownicy) session.getAttribute("loggedInUser");

		if (loggedInUser != null) {
			int userId = loggedInUser.getUzytkownikId();

			try {
				ulubioneDAO.removeAnimalFromFavorites(userId, zwierzeId);
				this.user = uzytkownicyDAO.findUserWithFavoritesById(userId);
				// this.favoriteAnimals = user.getZwierzetas();

				FacesMessage messages = new FacesMessage(FacesMessage.SEVERITY_WARN, "Uwaga",
						"Zwierzę zostało usunięte z ulubionych.");
				FacesContext.getCurrentInstance().addMessage(null, messages);
				System.out.println("Dodano komunikat: " + messages.getDetail());

			} catch (Exception e) {
				e.printStackTrace();
				FacesMessage messages = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd",
						"Nie udało się usunąć zwierzęcia z ulubionych.");
				FacesContext.getCurrentInstance().addMessage(null, messages);
				System.out.println("Dodano komunikat: " + messages.getDetail());
			}
		} else {
			// Użytkownik nie jest zalogowany
			FacesMessage messages = new FacesMessage(FacesMessage.SEVERITY_WARN, "Uwaga",
					"Musisz być zalogowany, aby usunąć zwierzę z ulubionych.");
			FacesContext.getCurrentInstance().addMessage(null, messages);
			System.out.println("Dodano komunikat: " + messages.getDetail());
		}

	}

	public Uzytkownicy getUser() {
		return user;
	}

	public void setUser(Uzytkownicy user) {
		this.user = user;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public List<Zwierzeta> getFavoriteAnimals() {
		return favoriteAnimals;
	}

	public void setFavoriteAnimals(List<Zwierzeta> favoriteAnimals) {
		this.favoriteAnimals = favoriteAnimals;
	}
}
