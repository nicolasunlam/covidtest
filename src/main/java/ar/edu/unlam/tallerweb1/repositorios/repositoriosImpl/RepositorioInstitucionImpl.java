package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioInstitucion;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;

import java.util.List;

import javax.persistence.Query;


@Repository("repositorioInstitucion")
public class RepositorioInstitucionImpl implements RepositorioInstitucion {

    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioInstitucionImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @SuppressWarnings({ "deprecation" })
    @Override
    public Institucion consultarInstitucionPorCuit(String numeroCuit) {

        return (Institucion) sessionFactory.getCurrentSession().createCriteria(Institucion.class)
                .add(Restrictions.eq("numeroDocumento", numeroCuit)).uniqueResult();
    }

    @SuppressWarnings({ "unchecked", "deprecation" })
    @Override
    public List<Institucion> obtenerListaInstituciones() {
        return sessionFactory.getCurrentSession().createCriteria(Institucion.class)
        		.add(Restrictions.eq("rol", Rol.INSTITUCION))
                .list();
    }

    @SuppressWarnings({ "deprecation" })
    @Override
    public Institucion obtenerInstitucionPorId(Long id) {

        return (Institucion) sessionFactory.getCurrentSession().createCriteria(Institucion.class)
                .add(Restrictions.eq("id", id)).uniqueResult();
    }

    @Override
    public void actualizarInstitucion(Institucion institucion) {
        sessionFactory.getCurrentSession().update(institucion);
    }

    @SuppressWarnings({ "unchecked", "deprecation" })
    @Override
    public List<Institucion> listarInstitucionesPorLocalidad(Long id) {
        return sessionFactory.getCurrentSession().createCriteria(Institucion.class).add(Restrictions.eq("localidad_id", id)).list();
    }

	@SuppressWarnings("unchecked")
	@Override
	public List<SalaCantidad> obtenerEstadisticaDeSalasDeUnaInstitucion(Institucion institucion) {
	      
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
	    		   							   + "AND a.horaEgreso IS NULL) "
	    		    + "GROUP BY i, sal.tipoSala";

      Query query = sessionFactory.getCurrentSession().createQuery(hql);
      query.setParameter("institucion", institucion);
      
      return query.getResultList();
	}

}
