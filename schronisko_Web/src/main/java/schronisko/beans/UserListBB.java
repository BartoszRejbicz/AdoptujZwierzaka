package schronisko.beans;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.security.DeclareRoles;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.RequestScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import schronisko.dao.UzytkownicyDAO;
import schronisko.entities.Role;
import schronisko.entities.Ulubione;
import schronisko.entities.Uzytkownicy;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Named
@RequestScoped
//@ViewScoped
public class UserListBB implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<Uzytkownicy> users;
	private Uzytkownicy selectedUser;
	private String email;

	@EJB
	private UzytkownicyDAO userDAO;

	@PostConstruct
	public void init() {
		users = userDAO.findAll();

	}

	public void refreshUserList() {
		users = userDAO.findAll();
	}

	public void editUser(int userId) {

		selectedUser = userDAO.find(userId);

	}

	public void deleteUser() {
		try {
			if ("schronisko".equals(selectedUser.getRole().getNazwaRoli())) {
				userDAO.removeSchroniskoForUser(selectedUser);
			}
			userDAO.removeUlubioneForUser(selectedUser);
			userDAO.remove(selectedUser);
			users.remove(selectedUser);
			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage("SUKCES!", "Użytkownik został usunięty."));
			refreshUserList();

		} catch (Exception e) {
			e.printStackTrace();
			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd podczas usuwania użytkownika.", null));
		}

	}

	public List<Uzytkownicy> getList() {
		List<Uzytkownicy> list = null;

		// 1. Prepare search params
		Map<String, Object> searchParams = new HashMap<String, Object>();

		if (email != null && email.length() > 0) {
			searchParams.put("email", email);
		}

		// 2. Get list
		list = userDAO.getList(searchParams);

		return list;
	}

	public String getEditPageUrl(Uzytkownicy user) {

		return "/admin/editUser?faces-redirect=true&userId=" + user.getUzytkownikId();
	}

	public List<Uzytkownicy> getUsers() {
		return users;
	}

	public void setUsers(List<Uzytkownicy> users) {
		this.users = users;
	}

	public Uzytkownicy getSelectedUser() {
		return selectedUser;
	}

	public void setSelectedUser(Uzytkownicy selectedUser) {
		this.selectedUser = selectedUser;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
