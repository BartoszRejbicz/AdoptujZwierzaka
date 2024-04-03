package schronisko.beans;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.security.DeclareRoles;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.SessionScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.servlet.http.HttpSession;
import schronisko.entities.Zwierzeta;
import schronisko.dao.SchroniskaDAO;
import schronisko.dao.ZwierzetaDAO;

import java.io.Serializable;
import java.util.List;

@Named
@ViewScoped

public class EditAnimalBB implements Serializable {
	private static final long serialVersionUID = 1L;

	private List<Zwierzeta> zwierzetaList;
	private Zwierzeta selectedAnimal;
	private int zwierzeId;

	@EJB
	private ZwierzetaDAO zwierzetaDAO;

	@PostConstruct

	public void init() {
//	    	selectedAnimal = new Zwierzeta();
		FacesContext context = FacesContext.getCurrentInstance();
		String idParam = context.getExternalContext().getRequestParameterMap().get("zwierzeId");
		if (idParam != null && !idParam.isEmpty()) {
			this.zwierzeId = Integer.parseInt(idParam);
			this.selectedAnimal = zwierzetaDAO.findZwierze(this.zwierzeId);
			if (this.selectedAnimal == null) {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
						"Ostrzeżenie", "Nie znaleziono zwierzęcia o podanym ID."));

			}
		}

	}

	public String saveEdit() {
		try {
			zwierzetaDAO.mergeZwierze(selectedAnimal);
			FacesContext.getCurrentInstance().addMessage(null,
					new FacesMessage(FacesMessage.SEVERITY_INFO, "Sukces", "Dane zostały zaktualizowane."));
		} catch (Exception e) {
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd",
					"Aktualizacja danych zwierzęcia nie powiodła się."));
			return null;
		}

		return "/schronisko/shelterAnimalsList.xhtml?faces-redirect=true";
	}

	public String returnToList() {
		return "/schronisko/shelterAnimalsList.xhtml?faces-redirect=true";
	}

	public int getZwierzeId() {
		return zwierzeId;
	}

	public void setZwierzeId(int zwierzeId) {
		this.zwierzeId = zwierzeId;
	}

	public List<Zwierzeta> getZwierzetaList() {
		return zwierzetaList;
	}

	public void setZwierzetaList(List<Zwierzeta> zwierzetaList) {
		this.zwierzetaList = zwierzetaList;
	}

	public Zwierzeta getSelectedAnimal() {
		return selectedAnimal;
	}

	public void setSelectedAnimal(Zwierzeta selectedAnimal) {
		this.selectedAnimal = selectedAnimal;
	}

}