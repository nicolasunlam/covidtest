package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioPiso;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.Query;

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
	public List<Piso> listarPisosPorInstitucion(Institucion institucion) {
		        String hql = "SELECT p "
    		    + "FROM Piso as p "
				+ "JOIN Institucion as i ON p.institucion = i "
    		    + "WHERE i = :institucion ";

    Query query = sessionFactory.getCurrentSession().createQuery(hql);
    query.setParameter("institucion", institucion);
    
    return query.getResultList();

	}

}
