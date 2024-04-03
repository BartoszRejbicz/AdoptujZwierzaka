package schronisko.dao;

import java.io.Serializable;
import jakarta.persistence.*;
import schronisko.entities.Ulubione;
import schronisko.entities.UlubionePK;
import schronisko.entities.Uzytkownicy;
import schronisko.entities.Zwierzeta;

import java.util.ArrayList;
import java.util.List;
import jakarta.ejb.Stateless;

@Stateless
public class UlubioneDAO {

	private final static String UNIT_NAME = "projekt";

	@PersistenceContext(unitName = UNIT_NAME)
	protected EntityManager em;

	public void addUlubione(Ulubione ulubione) {
		em.persist(ulubione);
	}

	public Ulubione getUlubioneById(UlubionePK id) {
		return em.find(Ulubione.class, id);
	}

	public void updateUlubione(Ulubione ulubione) {
		em.merge(ulubione);
	}

	public void removeUlubione(UlubionePK id) {
		Ulubione ulubione = getUlubioneById(id);
		if (ulubione != null) {
			em.remove(ulubione);
		}
	}

	public List<Ulubione> getAllUlubione() {
		TypedQuery<Ulubione> query = em.createNamedQuery("Ulubione.findAll", Ulubione.class);
		return query.getResultList();
	}

	public boolean isAnimalFavorite(int userId, int animalId) {
		String queryStr = "SELECT COUNT(u) FROM Ulubione u WHERE u.id.uzytkownikId = :userId AND u.id.zwierzeId = :animalId";
		Query query = em.createQuery(queryStr);
		query.setParameter("userId", userId);
		query.setParameter("animalId", animalId);
		long count = (long) query.getSingleResult();
		return count > 0;
	}

	public void addAnimalToFavorites(int uzytkownikId, int zwierzeId) {
		Uzytkownicy user = em.find(Uzytkownicy.class, uzytkownikId);
		Zwierzeta animal = em.find(Zwierzeta.class, zwierzeId);

		if (!user.getZwierzetas().contains(animal)) {
			user.getZwierzetas().add(animal);
			animal.getUzytkownicies().add(user);
			em.merge(user);
			em.merge(animal);
		}

	}

	public void removeAnimalFromFavorites(int uzytkownikId, int zwierzeId) {
		Uzytkownicy user = em.find(Uzytkownicy.class, uzytkownikId);
		Zwierzeta animal = em.find(Zwierzeta.class, zwierzeId);

		if (user.getZwierzetas().contains(animal)) {
			user.getZwierzetas().remove(animal);
			animal.getUzytkownicies().remove(user);
			em.merge(user);
			em.merge(animal);
		}
	}

	public List<Zwierzeta> findFavoritesByUserId(int userId) {
		Uzytkownicy user = em.find(Uzytkownicy.class, userId);
		return user != null ? user.getZwierzetas() : new ArrayList<>();
	}
}