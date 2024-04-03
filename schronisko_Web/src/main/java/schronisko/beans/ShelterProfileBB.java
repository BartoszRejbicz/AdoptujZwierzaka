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
import schronisko.entities.Schroniska;
import schronisko.entities.Zwierzeta;
import schronisko.dao.SchroniskaDAO;
import schronisko.dao.ZwierzetaDAO;

import java.io.File;
import java.io.Serializable;
import java.util.List;

@Named
@ViewScoped

public class ShelterProfileBB implements Serializable {
	private static final long serialVersionUID = 1L;

	private List<Zwierzeta> zwierzetaList;
	private Zwierzeta selectedAnimal;
	private int zwierzeId;

	private Schroniska schronisko;
	private int schroniskoId;

	@EJB
	private SchroniskaDAO schroniskaDAO;

	@EJB
	private ZwierzetaDAO zwierzetaDAO;

	@PostConstruct

	public void init() {
//	    	selectedAnimal = new Zwierzeta();
		loadAnimalsForLoggedShelter();

	}

	private void loadAnimalsForLoggedShelter() {
		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
		Integer schroniskoId = (Integer) session.getAttribute("schroniskoId");

		if (schroniskoId != null) {

			zwierzetaList = schroniskaDAO.getZwierzetaForSchronisko(schroniskoId);

		}
	}

	public void loadSchronisko() {
		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
		Integer schroniskoId = (Integer) session.getAttribute("schroniskoId");
		if (schroniskoId != null) {
			schronisko = schroniskaDAO.find(schroniskoId);
		}

	}

	public String editAnimal(int zwierzeId) {
		this.selectedAnimal = zwierzetaDAO.findZwierze(zwierzeId);
		return "/schronisko/editAnimal.xhtml?faces-redirect=true&zwierzeId=" + zwierzeId;
	}

	public void removeFromShelter(int zwierzeId) {
		this.selectedAnimal = zwierzetaDAO.findZwierze(zwierzeId);
		Zwierzeta animal = zwierzetaDAO.findZwierze(zwierzeId);
		if (animal != null) {

			String folderPath = "C:/Users/barto/git/inz/schronisko_Web/src/main/webapp/resources/template/image";
			String fileName = animal.getZdjecieURL();
			String filePath = folderPath + File.separator + fileName;

			File photoFile = new File(filePath);
			if (photoFile.exists() && photoFile.delete()) {
				FacesContext.getCurrentInstance().addMessage(null,
						new FacesMessage(FacesMessage.SEVERITY_INFO, "Sukces", "Zdjęcie zwierzęcia zostało usunięte."));
			} else {
				FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_WARN,
						"Ostrzeżenie", "Nie udało się usunąć zdjęcia zwierzęcia."));
			}

			zwierzetaDAO.removeZwierze(animal);
			zwierzetaList.remove(animal);
			loadAnimalsForLoggedShelter();
			// Aktualizacja widoku
			FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Zwierzę zostało usunięte."));
		}
	}

	public Schroniska getSchronisko() {
		return schronisko;
	}

	public void setSchronisko(Schroniska schronisko) {
		this.schronisko = schronisko;
	}

	public int getSchroniskoId() {
		return schroniskoId;
	}

	public void setSchroniskoId(int schroniskoId) {
		this.schroniskoId = schroniskoId;
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