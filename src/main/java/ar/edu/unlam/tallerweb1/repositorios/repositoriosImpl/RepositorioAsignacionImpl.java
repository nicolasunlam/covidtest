package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioAsignacion;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;

import java.util.List;

import javax.persistence.Query;

@Repository("repositorioAsignacion")
public class RepositorioAsignacionImpl implements RepositorioAsignacion {

    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioAsignacionImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    @SuppressWarnings({ "deprecation" })
    @Override
    public Asignacion consultarAsignacionPacienteInternado(Paciente paciente) {

        return (Asignacion) sessionFactory.getCurrentSession().createCriteria(Asignacion.class)
                .add(Restrictions.eq("paciente", paciente))
                .add(Restrictions.isNull("horaEgreso"))
                .add(Restrictions.isNotNull("horaIngreso"))
                .uniqueResult();
    }

    @Override
    public void actualizarAsignacion(Asignacion asignacion) {

        sessionFactory.getCurrentSession().update(asignacion);

    }

    @SuppressWarnings({ "deprecation" })
    public Asignacion consultarAsignacionPorId(Long nro) {

        return (Asignacion) sessionFactory.getCurrentSession().createCriteria(Asignacion.class)
                .add(Restrictions.eq("id", nro))
                .uniqueResult();
    }

    @SuppressWarnings({ "unchecked", "deprecation" })
	@Override
    public List<Asignacion> obtenerAsignacionesActuales() {
        return sessionFactory.getCurrentSession().createCriteria(Asignacion.class)
                .add(Restrictions.isNull("motivoEgreso"))
                .list();
    }
    
    @SuppressWarnings({ "deprecation" })
    @Override
    public Asignacion consultarReservaAsignacionPaciente(Paciente paciente) {

        return (Asignacion) sessionFactory.getCurrentSession().createCriteria(Asignacion.class)
                .add(Restrictions.eq("paciente", paciente))
                .add(Restrictions.isNotNull("horaReserva"))
                .add(Restrictions.isNull("horaIngreso"))
                .uniqueResult();
    }

    @SuppressWarnings({ "deprecation", "unchecked" })
    @Override
    public List<Asignacion> asignacionesReservadasPorInstitucion(Institucion institucion) {

		String hql = "SELECT c " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec " 
					+ "JOIN Piso as p ON sec.piso = p "
					+ "JOIN Institucion as i ON p.institucion = i " 
					+ "JOIN Asignacion as a ON a.cama = c "
					+ "WHERE i = :institucion " 
					+ "AND a.horaReserva IS NOT NULL "
					+ "AND a.horaIngreso IS NULL ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
    }
}
