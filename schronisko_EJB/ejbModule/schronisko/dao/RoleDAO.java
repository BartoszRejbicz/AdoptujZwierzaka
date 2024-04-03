package schronisko.dao;

import java.io.Serializable;
import jakarta.persistence.*;
import java.util.List;

import jakarta.ejb.Stateless;
import schronisko.entities.Role;
import schronisko.entities.Uzytkownicy;

@Stateless
public class RoleDAO {

	private final static String UNIT_NAME = "projekt";

	@PersistenceContext(unitName = UNIT_NAME)
	protected EntityManager em;

	public void create(Role rola) {
		em.persist(rola);
	}

	public Role merge(Role rola) {
		return em.merge(rola);
	}

	public void remove(Role rola) {
		em.remove(rola);
	}

	public Role find(Object id) {
		return em.find(Role.class, id);
	}

	public List<Role> findAll() {
		TypedQuery<Role> query = em.createNamedQuery("Role.findAll", Role.class);
		return query.getResultList();
	}

	public Role findByName(String role) {
		Role r = null;
		Query query = em.createQuery("SELECT r FROM Role r WHERE nazwaRoli=:role");
		if (role != null) {
			query.setParameter("role", role);
		}

		try {
			r = (Role) query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return r;
	}

}