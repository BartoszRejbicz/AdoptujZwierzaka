package schronisko.beans;

import jakarta.annotation.PostConstruct;
import jakarta.faces.context.FacesContext;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import schronisko.entities.Zwierzeta;
import schronisko.dao.ZwierzetaDAO;

import java.io.Serializable;

@Named
@ViewScoped
public class AnimalProfileBB implements Serializable {
	private static final long serialVersionUID = 1L;
	private int zwierzeId;
	private Zwierzeta animal;
	private Integer selectedAnimalId;

	@Inject
	private ZwierzetaDAO zwierzetaDAO;

	@PostConstruct
	public void init() {
		FacesContext context = FacesContext.getCurrentInstance();
		String idParam = context.getExternalContext().getRequestParameterMap().get("zwierzeId");
		if (idParam != null) {
			zwierzeId = Integer.parseInt(idParam);
			loadAnimal();

		}
	}

	public void loadAnimal() {
		this.animal = zwierzetaDAO.findZwierze(zwierzeId);
	}

	public Zwierzeta getAnimal() {
		return animal;
	}

	public void setAnimal(Zwierzeta animal) {
		this.animal = animal;
	}

	public int getZwierzeId() {
		return zwierzeId;
	}

	public void setZwierzeId(int zwierzeId) {
		this.zwierzeId = zwierzeId;
	}

	public Integer getSelectedAnimalId() {
		return selectedAnimalId;
	}

	public void setSelectedAnimalId(Integer selectedAnimalId) {
		this.selectedAnimalId = selectedAnimalId;
	}

	public String viewAnimalProfile(int zwierzeId) {

		this.selectedAnimalId = zwierzeId;

		return "/animalProfile.xhtml?faces-redirect=true&zwierzeId=" + zwierzeId;
	}
}
