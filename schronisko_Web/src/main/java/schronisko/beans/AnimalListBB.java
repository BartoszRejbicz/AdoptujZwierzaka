package schronisko.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.primefaces.PrimeFaces;
import org.primefaces.PrimeFaces.Ajax;

import jakarta.faces.context.Flash;
import jakarta.faces.view.ViewScoped;
import jakarta.faces.application.FacesMessage;
import jakarta.faces.context.ExternalContext;
import jakarta.faces.context.FacesContext;
import jakarta.annotation.PostConstruct;
import jakarta.ejb.EJB;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.inject.Named;
import jakarta.persistence.Query;
import jakarta.servlet.http.HttpSession;
import schronisko.dao.*;
import schronisko.entities.Uzytkownicy;
import schronisko.entities.Zwierzeta;

@Named
@ViewScoped
public class AnimalListBB implements Serializable {

	private static final long serialVersionUID = 1L;

	private String typ;
	private String miasto;
	private String rasaPsa;
	private String rasaKota;
	private BigDecimal waga;
	private String kolor;
	private String selectedWiek;
	private String selectedWielkosc;
	private String selectedPlec;
	private String selectedKastrowany;
	private String selectedRodzajWlosia;
	private String selectedKolor;

	private List<String> uniqueCities; 
	private String selectedCity;

	private String selectedRasaKota;
	private String selectedRasaPsa;
	private String selectedTyp;
	private boolean disableRasaKota;
	private boolean disableRasaPsa;

	@EJB
	ZwierzetaDAO ZwierzetaDAO;

	@EJB
	SchroniskaDAO SchroniskaDAO;

	@EJB
	UlubioneDAO UlubioneDAO;

	@EJB
	UzytkownicyDAO UzytkownicyDAO;

	private List<Zwierzeta> zwierzetaList;

	@PostConstruct
	public void init() {
		selectedTyp = "Pies"; // Ustawienie domyślnej wartości
	}

	public List<Zwierzeta> getList() {
		Map<String, Object> searchParams = new HashMap<>();

		if (selectedCity != null && !selectedCity.isEmpty()) {
			searchParams.put("miasto", selectedCity);
		}

		if (selectedTyp != null && !selectedTyp.isEmpty()) {
			searchParams.put("typ", selectedTyp);
		}
		if (selectedRasaPsa != null && !selectedRasaPsa.isEmpty()) {
			searchParams.put("rasaPsa", selectedRasaPsa);
		}
		if (selectedRasaKota != null && !selectedRasaKota.isEmpty()) {
			searchParams.put("rasaKota", selectedRasaKota);
		}
		if (selectedPlec != null && !selectedPlec.isEmpty()) {
			searchParams.put("plec", selectedPlec);
		}
		if (selectedWiek != null && !selectedWiek.isEmpty()) {
			searchParams.put("wiek", selectedWiek);
		}
		if (waga != null) {
			try {
				searchParams.put("waga", waga);
			} catch (NumberFormatException e) {
				
			}
		}
		if (selectedWielkosc != null && !selectedWielkosc.isEmpty()) {
			searchParams.put("wielkosc", selectedWielkosc);
		}
		if (selectedRodzajWlosia != null && !selectedRodzajWlosia.isEmpty()) {
			searchParams.put("rodzajWlosia", selectedRodzajWlosia);
		}
		if (selectedKastrowany != null && !selectedKastrowany.isEmpty()) {
			searchParams.put("kastrowany", selectedKastrowany);
		}

		if (selectedKolor != null && !selectedKolor.isEmpty()) {
			searchParams.put("kolor", selectedKolor);
		}

		List<Zwierzeta> list = ZwierzetaDAO.filtrZwierzeta(searchParams);

		return list;
	}

	public List<Zwierzeta> getFullList() {
		return ZwierzetaDAO.getFullList();
	}

	public List<String> getListMiasto() {
		return SchroniskaDAO.getMiasto();
	}

	public void handleTypChange() {
		if ("Pies".equals(selectedTyp)) {
			disableRasaKota = true;
			selectedRasaKota = null; // Możesz wyczyścić wybraną rasę kota, gdy typ to "Pies"

			disableRasaPsa = false;
		} else if ("Kot".equals(selectedTyp)) {
			disableRasaPsa = true;
			selectedRasaPsa = null; // Możesz wyczyścić wybraną rasę psa, gdy typ to "Kot"

			disableRasaKota = false;
		} else {
			disableRasaKota = false;
			disableRasaPsa = false;
		}
	}

	// FILTER

	public void filter() {
		Map<String, Object> searchParams = new HashMap<>();

		if (selectedCity != null && !selectedCity.isEmpty()) {
			searchParams.put("miasto", selectedCity);
		}

		if (selectedTyp != null && !selectedTyp.isEmpty()) {
			searchParams.put("typ", selectedTyp);
		}
		if (selectedRasaPsa != null && !selectedRasaPsa.isEmpty()) {
			searchParams.put("rasaPsa", selectedRasaPsa);
		}
		if (selectedRasaKota != null && !selectedRasaKota.isEmpty()) {
			searchParams.put("rasaKota", selectedRasaKota);
		}
		if (selectedPlec != null && !selectedPlec.isEmpty()) {
			searchParams.put("plec", selectedPlec);
		}
		if (selectedWiek != null && !selectedWiek.isEmpty()) {
			searchParams.put("wiek", selectedWiek);
		}
		if (waga != null) {
			searchParams.put("waga", waga);
		}
		if (selectedWielkosc != null && !selectedWielkosc.isEmpty()) {
			searchParams.put("wielkosc", selectedWielkosc);
		}
		if (selectedRodzajWlosia != null && !selectedRodzajWlosia.isEmpty()) {
			searchParams.put("rodzajWlosia", selectedRodzajWlosia);
		}
		if (selectedKastrowany != null && !selectedKastrowany.isEmpty()) {
			searchParams.put("kastrowany", selectedKastrowany);
		}
		if (selectedKolor != null && !selectedKolor.isEmpty()) {
			searchParams.put("kolor", selectedKolor);
		}
		zwierzetaList = ZwierzetaDAO.filtrZwierzeta(searchParams);
	}

//    CLEAR FORM

	public void resetForm() {
		this.selectedCity = null;
		this.selectedTyp = null;
		this.selectedKastrowany = null;
		this.selectedPlec = null;
		this.selectedRasaKota = null;
		this.selectedRasaPsa = null;
		this.selectedRodzajWlosia = null;
		this.selectedTyp = null;
		this.selectedWiek = null;
		this.selectedWielkosc = null;
		this.waga = null;
		this.kolor = null;

	}

	public void addToFavorites(int zwierzeId) {
		FacesContext ctx = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) ctx.getExternalContext().getSession(false);
		Uzytkownicy loggedInUser = (Uzytkownicy) session.getAttribute("loggedInUser");

		if (loggedInUser != null) {
			int userId = loggedInUser.getUzytkownikId();

			try {
				UlubioneDAO.addAnimalToFavorites(userId, zwierzeId);
				FacesMessage messages = new FacesMessage(FacesMessage.SEVERITY_INFO, "Sukces",
						"Zwierzę zostało dodane do ulubionych.");
				FacesContext.getCurrentInstance().addMessage(null, messages);
				System.out.println("Dodawanie zwierzęcia do ulubionych: " + zwierzeId + " dla użytkownika: " + userId);
//				PrimeFaces.current().ajax().update("");
			} catch (Exception e) {
				e.printStackTrace();
				FacesMessage messages = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Błąd",
						"Nie udało się dodać zwierzęcia do ulubionych.");
				FacesContext.getCurrentInstance().addMessage(null, messages);
			}
		} else {
			// Użytkownik nie jest zalogowany
			FacesMessage messages = new FacesMessage(FacesMessage.SEVERITY_WARN, "Uwaga",
					"Musisz być zalogowany, aby dodać zwierzę do ulubionych.");
			FacesContext.getCurrentInstance().addMessage(null, messages);
		}
	}

	public void removeFromFavorites(int zwierzeId) {
		FacesContext ctx = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) ctx.getExternalContext().getSession(false);
		Uzytkownicy loggedInUser = (Uzytkownicy) session.getAttribute("loggedInUser");

		if (loggedInUser != null) {
			int userId = loggedInUser.getUzytkownikId();

			try {
				UlubioneDAO.removeAnimalFromFavorites(userId, zwierzeId);
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

	public boolean isFavorite(Integer zwierzeId) {
		FacesContext ctx = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) ctx.getExternalContext().getSession(false);
		Uzytkownicy loggedInUser = (Uzytkownicy) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {			
			return UlubioneDAO.isAnimalFavorite(loggedInUser.getUzytkownikId(), zwierzeId);
		} else {
			return false;
		}
	}

	public void toggleFavorite(Integer zwierzeId) {
		FacesContext ctx = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) ctx.getExternalContext().getSession(false);
		Uzytkownicy loggedInUser = (Uzytkownicy) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			if (isFavorite(zwierzeId)) {
				removeFromFavorites(zwierzeId);
				loggedInUser.getZwierzetas().stream()
						.anyMatch(zwierze -> Objects.equals(zwierze.getZwierzeId(), zwierzeId));
			} else {
				addToFavorites(zwierzeId);

			}
		} else {
			FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "Uwaga",
					"Musisz być zalogowany, aby dodać zwierzę do ulubionych.");
			FacesContext.getCurrentInstance().addMessage(null, message);
			System.out.println("Dodano komunikat: " + message.getDetail());

		}
	}

	public List<String> getUniqueCities() {
		return uniqueCities;
	}

	public void setUniqueCities(List<String> uniqueCities) {
		this.uniqueCities = uniqueCities;
	}

	public String getSelectedCity() {
		return selectedCity;
	}

	public void setSelectedCity(String selectedCity) {
		this.selectedCity = selectedCity;
	}

	public String getMiasto() {
		return miasto;
	}

	public void setMiasto(String miasto) {
		this.miasto = miasto;
	}

	public String getTyp() {
		return typ;
	}

	public void setTyp(String typ) {
		this.typ = typ;
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

	public BigDecimal getWaga() {
		return waga;
	}

	public void setWaga(BigDecimal waga) {
		this.waga = waga;
	}

	public String getSelectedWiek() {
		return selectedWiek;
	}

	public void setSelectedWiek(String selectedWiek) {
		this.selectedWiek = selectedWiek;
	}

	public String getSelectedWielkosc() {
		return selectedWielkosc;
	}

	public void setSelectedWielkosc(String selectedWielkosc) {
		this.selectedWielkosc = selectedWielkosc;
	}

	public String getSelectedPlec() {
		return selectedPlec;
	}

	public void setSelectedPlec(String selectedPlec) {
		this.selectedPlec = selectedPlec;
	}

	public String getSelectedKastrowany() {
		return selectedKastrowany;
	}

	public void setSelectedKastrowany(String selectedKastrowany) {
		this.selectedKastrowany = selectedKastrowany;
	}

	public String getSelectedRodzajWlosia() {
		return selectedRodzajWlosia;
	}

	public void setSelectedRodzajWlosia(String selectedRodzajWlosia) {
		this.selectedRodzajWlosia = selectedRodzajWlosia;
	}

	public void setSelectedRasaKota(String selectedRasaKota) {
		this.selectedRasaKota = selectedRasaKota;
	}

	public String getSelectedRasaKota() {
		return selectedRasaKota;
	}

	public void setSelectedRasaPsa(String selectedRasaPsa) {
		this.selectedRasaPsa = selectedRasaPsa;
	}

	public String getSelectedRasaPsa() {
		return selectedRasaPsa;
	}

	public void setSelectedTyp(String selectedTyp) {
		this.selectedTyp = selectedTyp;
	}

	public String getSelectedTyp() {
		return selectedTyp;
	}

	public void setDisableRasaKota(boolean disableRasaKota) {
		this.disableRasaKota = disableRasaKota;
	}

	public void setDisableRasaPsa(boolean disableRasaPsa) {
		this.disableRasaPsa = disableRasaPsa;
	}

	public boolean getDisableRasaKota() {
		return disableRasaKota;
	}

	public boolean getDisableRasaPsa() {
		return disableRasaPsa;
	}

	public String getKolor() {
		return kolor;
	}

	public void setKolor(String kolor) {
		this.kolor = kolor;
	}

	public String getSelectedKolor() {
		return selectedKolor;
	}

	public void setSelectedKolor(String selectedKolor) {
		this.selectedKolor = selectedKolor;
	}

}