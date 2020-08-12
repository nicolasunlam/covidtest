package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioPiso;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.inject.Inject;

@Repository("repositorioPiso")
@Transactional
public class RepositorioPisoImpl implements RepositorioPiso {

	@Inject
	private SessionFactory sessionFactory;

	@Autowired
	public RepositorioPisoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void registrarPiso(Piso piso) {
		sessionFactory.getCurrentSession().save(piso);
	}

	@Override
	public void actualizarPiso(Piso piso) {
		sessionFactory.getCurrentSession().update(piso);
	}

	@Override
	public Piso buscarPisoPorId(Long id) {

		return (Piso) sessionFactory.getCurrentSession().createCriteria(Piso.class).add(Restrictions.eq("id", id))
				.uniqueResult();
	}

	@Override
	public List<Piso> listarPisos() {

		return sessionFactory.getCurrentSession().createCriteria(Piso.class).list();
	}

}
