package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.Query;

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

}
