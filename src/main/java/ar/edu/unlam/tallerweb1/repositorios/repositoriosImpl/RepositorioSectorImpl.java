package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.Query;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioPiso;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioSector;

@Repository("repositorioSector")
@Transactional
public class RepositorioSectorImpl implements RepositorioSector {
	
	 @Inject
	    private SessionFactory sessionFactory;

	    @Autowired
	    public RepositorioSectorImpl(SessionFactory sessionFactory) {
	        this.sessionFactory = sessionFactory;
	    }


	@Override
	public void registrarSector(Sector sector) {
		
		sessionFactory.getCurrentSession().save(sector);

	}

	@Override
	public void actualizarSector(Sector sector) {
		
		sessionFactory.getCurrentSession().update(sector);

	}

	@Override
	public Sector buscarSectorPorId(Long id) {
		return (Sector) sessionFactory.getCurrentSession().createCriteria(Sector.class)
                .add(Restrictions.eq("id", id)).uniqueResult();
	}


	@Override
	public List<Sector> consultarSectoresPorPiso(Piso piso) {
        String hql = "SELECT sec "
    		    + "FROM Sector as sec "
				+ "JOIN Piso as p ON sec.piso = p "
    		    + "WHERE p = :piso ";

    Query query = sessionFactory.getCurrentSession().createQuery(hql);
    query.setParameter("piso", piso);
    
    return query.getResultList();
	}
	
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<Cama> listarCamasOcupadasPorSector(Sector sector) {

		String hql = "SELECT c " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec "
					+ "JOIN Asignacion as a ON a.cama = c "
					+ "WHERE sec = :sector " 
					+ "AND a.horaEgreso IS NULL "
					+ "AND a.horaIngreso IS NOT NULL "; 

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sector", sector);

		return query.getResultList();
	}
	
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<Cama> listarCamasReservadasPorSector(Sector sector) {

		String hql = "SELECT c " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec "
					+ "JOIN Asignacion as a ON a.cama = c "
					+ "WHERE sec = :sector " 
					+ "AND a.horaReserva IS NOT NULL "
					+ "AND a.horaIngreso IS NULL "; 

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sector", sector);

		return query.getResultList();
	}
	
	@SuppressWarnings({ "unchecked" })
	@Override
	public List<Cama> listarCamasDisponiblesPorSector(Sector sector) {

		String hql = "SELECT c " 
					+ "FROM Cama as c "
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec "
					+ "WHERE sec = :sector "
					+ "AND c NOT IN (SELECT a.cama " 
							+ "FROM Asignacion as a " 
							+ "WHERE a.cama = c "
							+ "AND a.horaEgreso IS NULL)";
					
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sector", sector);
	
		return query.getResultList();
	
	}

}
