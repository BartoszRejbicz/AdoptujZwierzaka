package schronisko.beans;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.security.DeclareRoles;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.EJB;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import schronisko.dao.RoleDAO;
import schronisko.dao.UzytkownicyDAO;
import schronisko.entities.Role;
import schronisko.entities.Uzytkownicy;

import java.io.Serializable;
import java.util.List;

@Named
@ViewScoped

public class EditUserBB implements Serializable {
	private static final long serialVersionUID = 1L;
	private int userId;
	private Uzytkownicy user;
	private List<Role> availableRoles; // Lista dostępnych ról
	private Integer selectedRoleId;

	@EJB
	private UzytkownicyDAO userDAO;

	@EJB
	private RoleDAO roleDAO;

	@PostConstruct

	public void init() {
		loadUser();
		setAvailableRoles(roleDAO.findAll()); // Wczytanie dostępnych ról
		if (user.getRole() != null) {
			selectedRoleId = user.getRole().getRolaId(); // Ustawienie aktualnie wybranej roli
		}
	}

	public void loadUser() {
		if (userId > 0) {
			user = userDAO.find(userId);
		} else {
			user = new Uzytkownicy();
		}
	}

	public String saveUser() {
		try {
			Role newRole = roleDAO.find(selectedRoleId);
			user.setRole(newRole);
			userDAO.merge(user);
			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, "Sukces", "Dane zostały zaktualizowane."));

		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd",
					"Aktualizacja danych użytkownika nie powiodła się."));
			return null;
		}

		return "/admin/userList.xhtml";

	}

	public String returnToList() {
		return "/admin/userList.xhtml";
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Uzytkownicy getUser() {
		return user;
	}

	public void setUser(Uzytkownicy user) {
		this.user = user;
	}

	public Integer getSelectedRoleId() {
		return selectedRoleId;
	}

	public void setSelectedRoleId(Integer selectedRoleId) {
		this.selectedRoleId = selectedRoleId;
	}

	public List<Role> getAvailableRoles() {
		return availableRoles;
	}

	public void setAvailableRoles(List<Role> availableRoles) {
		this.availableRoles = availableRoles;
	}
}
