package schronisko.dao;

import java.util.List;
import java.util.Map;

import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;
import schronisko.entities.Role;
import schronisko.entities.Ulubione;
import schronisko.entities.Uzytkownicy;
import schronisko.entities.Zwierzeta;
import schronisko.entities.Schroniska;
import jakarta.persistence.Entity;

@Stateless

public class UzytkownicyDAO {

	private final static String UNIT_NAME = "projekt";

	@PersistenceContext(unitName = UNIT_NAME)
	protected EntityManager em;

	public void create(Uzytkownicy uzytkownik) {
		em.persist(uzytkownik);
	}

	public Uzytkownicy merge(Uzytkownicy uzytkownik) {
		return em.merge(uzytkownik);
	}

	public void remove(Uzytkownicy uzytkownik) {

		Uzytkownicy userToRemove = em.find(Uzytkownicy.class, uzytkownik.getUzytkownikId());
		if (userToRemove != null) {
			em.remove(userToRemove);
		}
	}

	public Uzytkownicy find(Object id) {
		return em.find(Uzytkownicy.class, id);
	}

	@EJB
	private RoleDAO roleDAO;

	public List<String> getRolesFromDB(Uzytkownicy uzytkownik) {
		List<String> roles = null;

		if (uzytkownik != null) {

			Query query = em.createQuery("SELECT r.nazwaRoli FROM Role r WHERE :uzytkownik MEMBER OF r.uzytkownicies");
			query.setParameter("uzytkownik", uzytkownik);

			roles = query.getResultList();
		}

		return roles;
	}

	public List<Uzytkownicy> findAll() {
		TypedQuery<Uzytkownicy> query = em.createNamedQuery("Uzytkownicy.findAll", Uzytkownicy.class);
		return query.getResultList();
	}

	public List<Uzytkownicy> getList(Map<String, Object> searchParams) {

		List<Uzytkownicy> list = null;

		String select = "select u ";
		String from = "from Uzytkownicy u ";
		String where = "";
		String orderby = "order by u.email asc, u.uzytkownikId";

		String email = (String) searchParams.get("email");
		if (email != null) {
			if (where.isEmpty()) {
				where = "where ";
			} else {
				where += "and ";
			}
			where += "u.email like :email ";
		}

		Query query = em.createQuery(select + from + where + orderby);

		if (email != null) {
			query.setParameter("email", email + "%");
		}

		try {
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void removeUlubioneForUser(Uzytkownicy uzytkownik) {
		// Używam klasy UlubionePK do odwołania się do uzytkownikId
		em.createQuery("DELETE FROM Ulubione u WHERE u.id.uzytkownikId = :userId")
				.setParameter("userId", uzytkownik.getUzytkownikId()).executeUpdate();
	}

	public void removeSchroniskoForUser(Uzytkownicy uzytkownik) {
		// Wyszukanie schroniska po e-mailu użytkownika
		Schroniska schronisko = em.createQuery("SELECT s FROM Schroniska s WHERE s.email = :email", Schroniska.class)
				.setParameter("email", uzytkownik.getEmail()).getSingleResult();

		if (schronisko != null) {
			em.remove(schronisko);
		}
	}

	public String getRoleNameForUser(Uzytkownicy uzytkownik) {
		if (uzytkownik != null && uzytkownik.getRole() != null) {
			return uzytkownik.getRole().getNazwaRoli();
		}
		return null;
	}

	public Uzytkownicy getUserByEmail(String email) {
		try {
			Uzytkownicy uzytkownik = em
					.createQuery("SELECT u FROM Uzytkownicy u LEFT JOIN FETCH u.zwierzetas WHERE u.email = :email",
							Uzytkownicy.class)
					.setParameter("email", email).getSingleResult();
			return uzytkownik;
		} catch (NoResultException e) {
			return null;
		}
	}

	public Uzytkownicy getUserById(int userId) {
		try {
			Uzytkownicy uzytkownik = em
					.createQuery("SELECT u FROM Uzytkownicy u WHERE u.uzytkownikId = :userId", Uzytkownicy.class)
					.setParameter("userId", userId).getSingleResult();

			return uzytkownik;
		} catch (NoResultException e) {
			return null;
		}
	}

	public Uzytkownicy findUserWithFavoritesById(int userId) {
		try {
			return em.createQuery("SELECT u FROM Uzytkownicy u JOIN FETCH u.zwierzetas WHERE u.uzytkownikId = :userId",
					Uzytkownicy.class).setParameter("userId", userId).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public Uzytkownicy getUserWithFavorites(int userId) {
		Uzytkownicy user = em.find(Uzytkownicy.class, userId);
		user.getZwierzetas().size();
		return user;
	}

	public List<Uzytkownicy> findAllSchroniskoUsers() {
		Role schroniskoRole = roleDAO.findByName("schronisko");
		return em.createQuery("SELECT u FROM Uzytkownicy u WHERE u.role = :role", Uzytkownicy.class)
				.setParameter("role", schroniskoRole).getResultList();
	}

	public Uzytkownicy findByEmail(String email) {
		try {
			return em.createQuery("SELECT u FROM Uzytkownicy u WHERE u.email = :email", Uzytkownicy.class)
					.setParameter("email", email).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

}