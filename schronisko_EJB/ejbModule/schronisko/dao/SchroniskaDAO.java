package schronisko.dao;

import jakarta.ejb.Stateless;
import jakarta.persistence.*;
import schronisko.entities.Schroniska;
import schronisko.entities.Zwierzeta;

import java.util.ArrayList;
import java.util.List;

@Stateless
public class SchroniskaDAO {

	private final static String UNIT_NAME = "projekt";

	@PersistenceContext(unitName = UNIT_NAME)
	protected EntityManager em;

	public void create(Schroniska schroniska) {
		em.persist(schroniska);
	}

	public Schroniska merge(Schroniska schroniska) {
		return em.merge(schroniska);
	}

	public void remove(Schroniska schroniska) {
		em.remove(schroniska);
	}

	public Schroniska find(Object id) {
		return em.find(Schroniska.class, id);
	}

	public List<String> getAdres(String searchAdres) {
		List<String> addresses = new ArrayList<>();

		String select = "SELECT s.adres ";
		String from = "FROM Schroniska s ";
		String where = "";
		if (searchAdres != null && !searchAdres.isEmpty()) {
			where = "WHERE s.adres LIKE :searchAdres ";
		}

		String orderby = "ORDER BY s.schroniskoId ASC";

		Query query = em.createQuery(select + from + where + orderby);

		if (searchAdres != null && !searchAdres.isEmpty()) {
			query.setParameter("searchAdres", "%" + searchAdres + "%");
		}

		try {
			List<String> resultList = query.getResultList(); 

			addresses.addAll(resultList);

			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return addresses;
	}

	public List<String> getMiasto() {
		List<String> cities = new ArrayList<>();
		// Zapytanie do pobrania unikalnych miast
		String queryStr = "SELECT DISTINCT s.miasto FROM Schroniska s ORDER BY s.miasto ASC";
		Query query = em.createQuery(queryStr);
		try {
			cities = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cities;
	}

	public Schroniska getSchroniskoByEmail(String email) {
		try {
			return em.createQuery("SELECT s FROM Schroniska s WHERE s.email = :email", Schroniska.class)
					.setParameter("email", email).getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	public List<Zwierzeta> getZwierzetaForSchronisko(int schroniskoId) {
		return em
				.createQuery("SELECT z FROM Zwierzeta z WHERE z.schroniska.schroniskoId = :schroniskoId",
						Zwierzeta.class)
				.setParameter("schroniskoId", schroniskoId)

				.getResultList();
	}

}