package schronisko.dao;

import jakarta.ejb.Stateless;
import jakarta.persistence.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import jakarta.persistence.Query;

import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import schronisko.entities.Schroniska;
import schronisko.entities.Uzytkownicy;
import schronisko.entities.Zwierzeta;

@Stateless
public class ZwierzetaDAO {

	private final static String UNIT_NAME = "projekt";

	@PersistenceContext(unitName = UNIT_NAME)
	protected EntityManager em;

	public void createZwierze(Zwierzeta zwierze) {
		em.persist(zwierze);
	}

	public Zwierzeta findZwierze(int zwierzeId) {
		return em.find(Zwierzeta.class, zwierzeId);
	}

	public List<Zwierzeta> findAllZwierzeta() {
		TypedQuery<Zwierzeta> query = em.createNamedQuery("Zwierzeta.findAll", Zwierzeta.class);
		return query.getResultList();
	}

	public void mergeZwierze(Zwierzeta zwierze) {
		em.merge(zwierze);
	}

	public void removeZwierze(Zwierzeta zwierze) {
		em.remove(em.contains(zwierze) ? zwierze : em.merge(zwierze));
	}

	public List<Zwierzeta> getFullList() {
		List<Zwierzeta> list = null;

		Query query = em.createQuery("select z from Zwierzeta z");

		try {
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Zwierzeta> getListZwierzeta(Map<String, Object> searchParams) {
		List<Zwierzeta> list = null;

		String select = "select z ";
		String from = "from Zwierzeta z ";
		String where = "";
		String orderby = "order by z.typ asc, z.rasaPsa";

		String typ = (String) searchParams.get("typ");
		if (typ != null && !typ.isEmpty()) {
			if (where.isEmpty()) {
				where = "where ";
			} else {
				where += "and ";
			}
			where += "z.typ = :typ ";
		}

		String rasaPsa = (String) searchParams.get("rasaPsa");
		if (rasaPsa != null && !typ.isEmpty()) {
			if (where.isEmpty()) {
				where = "where ";
			} else {
				where += "and ";
			}
			where += "z.rasaPsa = :rasaPsa";
		}

		Query query = em.createQuery(select + from + where + orderby);

		if (typ != null && !typ.isEmpty()) {
			query.setParameter("typ", typ + "%");
		}

		if (rasaPsa != null && !typ.isEmpty()) {
			query.setParameter("rasaPsa", rasaPsa + "%");
		}

		try {
			list = query.getResultList();
//	    	        System.out.println("ZwierzetaDAO - Pobrano listę zwierząt: " + list.size() + " elementów.");
		} catch (Exception e) {
			e.printStackTrace();
//	    	        System.out.println("ZwierzetaDAO - Błąd podczas pobierania listy zwierząt.");
		}
		return list;
	}

	public List<Zwierzeta> filtrZwierzeta(Map<String, Object> searchParams) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Zwierzeta> cq = cb.createQuery(Zwierzeta.class);
		Root<Zwierzeta> zwierzeta = cq.from(Zwierzeta.class);
		List<Predicate> predicates = new ArrayList<>();

		searchParams.forEach((key, value) -> {
			switch (key) {

			case "miasto":

				Join<Zwierzeta, Schroniska> schroniskoJoin = zwierzeta.join("schroniska");
				predicates.add(cb.equal(schroniskoJoin.get("miasto"), value));
				break;
			case "typ":
			case "rasaPsa":
			case "rasaKota":
				predicates.add(cb.equal(zwierzeta.get(key), value));
				break;
			case "waga":

				BigDecimal wagaMax = (BigDecimal) value;
				predicates.add(cb.lessThanOrEqualTo(zwierzeta.get("waga"), wagaMax));
				break;
			case "plec":
				predicates.add(cb.equal(zwierzeta.get("plec"), value));
				break;
			case "wiek":
				predicates.add(cb.equal(zwierzeta.get("wiek"), value));
				break;
			case "wielkosc":
				predicates.add(cb.equal(zwierzeta.get("wielkosc"), value));
				break;
			case "rodzajWlosia":
				predicates.add(cb.equal(zwierzeta.get("rodzajWlosia"), value));
				break;
			case "kastrowany":
				predicates.add(cb.equal(zwierzeta.get("kastrowany"), value));
				break;
			case "kolor":
				predicates.add(cb.equal(zwierzeta.get("kolor"), value));
				break;

			
			}
		});

		cq.where(cb.and(predicates.toArray(new Predicate[0])));
		TypedQuery<Zwierzeta> query = em.createQuery(cq);

		return query.getResultList();
	}

}
