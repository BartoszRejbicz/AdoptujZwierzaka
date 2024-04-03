package schronisko.beans;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.primefaces.PrimeFaces;
import org.primefaces.model.file.UploadedFile;
import org.primefaces.shaded.commons.io.FilenameUtils;

import jakarta.annotation.security.DeclareRoles;
import jakarta.annotation.security.RolesAllowed;
import jakarta.ejb.EJB;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.FacesContext;
import jakarta.faces.event.AjaxBehaviorEvent;
import jakarta.faces.view.ViewScoped;
import jakarta.inject.Named;
import jakarta.servlet.http.HttpSession;
import schronisko.dao.SchroniskaDAO;
import schronisko.dao.ZwierzetaDAO;
import schronisko.entities.Schroniska;
import schronisko.entities.Zwierzeta;

@Named
@ViewScoped

public class addAnimalBB implements Serializable {
	private static final long serialVersionUID = 1L;

	private UploadedFile file;
	private Zwierzeta newAnimal = new Zwierzeta();
	private List<String> dostepneRasy;

	private Integer schroniskoId;
	private String typ;
	private String imie;
	private String rasaPsa;
	private String rasaKota;
	private String wiek;
	private BigDecimal waga;
	private String wielkosc;
	private String rodzajWlosia;
	private String plec;
	private String kolor;
	private String kastrowany;
	private String cechyZachowania;
	private String przebyteChoroby;
	private String opis;

	private boolean redirecting;

	@EJB
	private ZwierzetaDAO zwierzeDAO;
	@EJB
	private SchroniskaDAO schroniskaDAO;

	private Integer getSessionSchroniskoId() {
		HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
		return (Integer) session.getAttribute("schroniskoId");
	}

	public void onTypeChange(AjaxBehaviorEvent event) {
		dostepneRasy = new ArrayList<>();
		if (Objects.equals(newAnimal.getTyp(), "Pies")) {

			dostepneRasy.add("Mieszaniec");
			dostepneRasy.add("Labrador");
			dostepneRasy.add("Golden Retriever");
			dostepneRasy.add("Buldog");
			dostepneRasy.add("Beagle");
			dostepneRasy.add("Yorkshire Terrier");
			dostepneRasy.add("Shih Tzu");
			dostepneRasy.add("Maltańczyk");
			dostepneRasy.add("Owczarek Niemiecki");
			dostepneRasy.add("Husky");
			dostepneRasy.add("Akita");
			dostepneRasy.add("Border Collie");
			dostepneRasy.add("Jack Russell Terrier");
			dostepneRasy.add("West Highland White Terrier");
			dostepneRasy.add("Fox Terrier");
			dostepneRasy.add("Cocker Spaniel");

		} else if (Objects.equals(newAnimal.getTyp(), "Pies")) {

			dostepneRasy.add("Mieszaniec");
			dostepneRasy.add("Rasowy");

		}
	}

	public void addAnimal() {
		Integer schroniskoId = getSessionSchroniskoId();
		Schroniska schronisko = schroniskaDAO.find(schroniskoId);
		if (schroniskoId != null) {
			Zwierzeta newAnimal = new Zwierzeta();
			newAnimal.setSchroniska(schronisko);
			newAnimal.setTyp(typ);
			newAnimal.setImie(imie);
			if ("Kot".equals(newAnimal.getTyp())) {
				newAnimal.setRasaPsa(null);

			} else if ("Pies".equals(newAnimal.getTyp())) {
				newAnimal.setRasaKota(null);

			}
			newAnimal.setWiek(wiek);
			newAnimal.setWaga(waga);
			newAnimal.setRasaPsa(rasaPsa);
			newAnimal.setRasaKota(rasaKota);
			newAnimal.setWielkosc(wielkosc);
			newAnimal.setRodzajWlosia(rodzajWlosia);
			newAnimal.setPlec(plec);
			newAnimal.setKolor(kolor);
			newAnimal.setKastrowany(kastrowany);
			newAnimal.setCechyZachowania(cechyZachowania);
			newAnimal.setPrzebyteChoroby(przebyteChoroby);
			newAnimal.setOpis(opis);

			zwierzeDAO.createZwierze(newAnimal);
			if (newAnimal.getZwierzeId() > 0 && file != null && !file.getFileName().isEmpty()) {
				try {

					String folderName = "resources/template/image/";
					String uploadDir = FacesContext.getCurrentInstance().getExternalContext().getRealPath("")
							+ File.separator + folderName;
					File folder = new File(uploadDir);
					System.out.println("Upload dir: " + uploadDir);
					if (!folder.exists()) {
						folder.mkdirs();
					}

					String fileName = (newAnimal.getTyp().equals("Pies") ? "pies" : "kot") + newAnimal.getZwierzeId()
							+ "." + FilenameUtils.getExtension(file.getFileName());
					String filePath = "C:/Users/barto/git/inz/schronisko_Web/src/main/webapp/resources/template/image"
							+ File.separator + fileName;
					File targetFile = new File(filePath);

					InputStream inputStream = file.getInputStream();
					Files.copy(inputStream, targetFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

					newAnimal.setZdjecieURL(fileName);
					zwierzeDAO.mergeZwierze(newAnimal);
					System.out.println("Upload dir: " + uploadDir);
					FacesMessage message = new FacesMessage("Sukces", "Plik " + fileName + " został przesłany.");
					FacesContext.getCurrentInstance().addMessage(null, message);

					redirecting = true;
					PrimeFaces.current().executeScript(
							"setTimeout(function(){window.location.href='/schronisko_Web/schronisko/shelterAnimalsList.xhtml';}, 1500);");

				} catch (IOException e) {
					FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR,
							"Błąd podczas przesyłania zdjęcia", e.getMessage()));
				}
			}

		}
	}

	public String returnToList() {
		return "/schronisko/shelterAnimalsList.xhtml?faces-redirect=true";
	}

	public int getSchroniskoId() {
		return schroniskoId;
	}

	public void setSchroniskoId(int schroniskoId) {
		this.schroniskoId = schroniskoId;
	}

	public UploadedFile getFile() {
		return file;
	}

	public void setFile(UploadedFile file) {
		this.file = file;
	}

	public Zwierzeta getNewAnimal() {
		return newAnimal;
	}

	public void setNewAnimal(Zwierzeta newAnimal) {
		this.newAnimal = newAnimal;
	}

	public String getTyp() {
		return typ;
	}

	public void setTyp(String typ) {
		this.typ = typ;
	}

	public String getImie() {
		return imie;
	}

	public void setImie(String imie) {
		this.imie = imie;
	}

	public String getRasaPsa() {
		return rasaPsa;
	}

	public void setRasaPsa(String rasaPsa) {
		this.rasaPsa = rasaPsa;
	}

	public String getRasaKota() {
		return rasaKota;
	}

	public void setRasaKota(String rasaKota) {
		this.rasaKota = rasaKota;
	}

	public String getWiek() {
		return wiek;
	}

	public void setWiek(String wiek) {
		this.wiek = wiek;
	}

	public BigDecimal getWaga() {
		return waga;
	}

	public void setWaga(BigDecimal waga) {
		this.waga = waga;
	}

	public String getWielkosc() {
		return wielkosc;
	}

	public void setWielkosc(String wielkosc) {
		this.wielkosc = wielkosc;
	}

	public String getRodzajWlosia() {
		return rodzajWlosia;
	}

	public void setRodzajWlosia(String rodzajWlosia) {
		this.rodzajWlosia = rodzajWlosia;
	}

	public String getPlec() {
		return plec;
	}

	public void setPlec(String plec) {
		this.plec = plec;
	}

	public String getKolor() {
		return kolor;
	}

	public void setKolor(String kolor) {
		this.kolor = kolor;
	}

	public String getKastrowany() {
		return kastrowany;
	}

	public void setKastrowany(String kastrowany) {
		this.kastrowany = kastrowany;
	}

	public String getCechyZachowania() {
		return cechyZachowania;
	}

	public void setCechyZachowania(String cechyZachowania) {
		this.cechyZachowania = cechyZachowania;
	}

	public String getPrzebyteChoroby() {
		return przebyteChoroby;
	}

	public void setPrzebyteChoroby(String przebyteChoroby) {
		this.przebyteChoroby = przebyteChoroby;
	}

	public String getOpis() {
		return opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}
}