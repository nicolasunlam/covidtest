package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.Query;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioSala;

@Repository("repositorioSala")
@Transactional
public class RepositorioSalaImpl implements RepositorioSala {

	@Inject
	private SessionFactory sessionFactory;

	@Autowired
	public RepositorioSalaImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void registrarSala(Sala sala) {
		sessionFactory.getCurrentSession().save(sala);

	}

	@Override
	public void actualizarSala(Sala sala) {
		sessionFactory.getCurrentSession().update(sala);

	}

	@Override
	public Sala buscarSalaPorId(Long id) {
		return (Sala) sessionFactory.getCurrentSession().createCriteria(Sala.class).add(Restrictions.eq("id", id))
				.uniqueResult();
	}

	@Override
	public List<Sala> listarSalasPorSector(Sector sector) {

		String hql = "SELECT s " + "FROM Sala as s " + "JOIN Sector as i ON s.sector = i " + "WHERE i = :sector ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sector", sector);

		return query.getResultList();

	}
	

	@SuppressWarnings("unchecked")
	@Override
	public List<SalaCantidad> obtenerSalasConCantidadDeCamasDisponiblesDeUnaInstitucion(Institucion institucion) {
	      
		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad(sal, count(*)) "
	    		    + "FROM Cama as c "
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec "
					+ "JOIN Piso as p ON sec.piso = p "
					+ "JOIN Institucion as i ON p.institucion = i "
					+ "WHERE i = :institucion "
					+ "AND c NOT IN (SELECT a.cama "
	    		   							   + "FROM Asignacion as a "
	    		   							   + "WHERE a.cama = c "
	    		   							   + "AND a.horaEgreso IS NULL "
	    		   							   + "OR a.horaReserva IS NULL) "		   
	    		    + "GROUP BY i, sal.tipoSala ";
		
      Query query = sessionFactory.getCurrentSession().createQuery(hql);
      query.setParameter("institucion", institucion);

      return query.getResultList();
	}
	
	@Override
	public List<Sala> listarSalasPorPiso(Piso piso) {

		String hql = "SELECT sal " 
					+ "FROM Sala as sal " 
					+ "JOIN Sector as sec ON sec = sal.sector " 
					+ "JOIN Piso as p ON p = sec.piso " 
					+ "WHERE p = :piso ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("piso", piso);

		return query.getResultList();
	}
	
}
