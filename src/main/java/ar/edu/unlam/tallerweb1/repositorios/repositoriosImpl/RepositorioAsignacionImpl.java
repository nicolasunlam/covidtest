package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioAsignacion;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble;

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

    @Override
    public void eliminarAsignacion(Asignacion asignacion) {

        sessionFactory.getCurrentSession().remove(asignacion);

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
    
    /*--------------- RESERVAS SOLICITADAS-------------------*/

    @SuppressWarnings({"unchecked" })
    @Override
    public List<AsignacionDoble> reservasSolicitadasPorTrasladoConAsignacionActualPorInstitucion(Institucion institucion) {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble(a, a2) " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec " 
					+ "JOIN Piso as p ON sec.piso = p "
					+ "JOIN Institucion as i ON p.institucion = i " 
					+ "JOIN Asignacion as a ON a.cama = c "
					+ "JOIN Asignacion a2 ON a.paciente = a2.paciente "
					+ "WHERE i = :institucion " 
					+ "AND a.horaEgreso IS NULL "
					+ "AND a.horaIngreso IS NOT NULL "
					+ "AND a2.horaIngreso IS NULL "
					+ "AND a2.horaEgreso IS NULL "
					+ "AND a2.motivoTraslado IS NOT NULL ";  

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
    }
    
    @SuppressWarnings({"unchecked" })
    @Override
    public List<AsignacionDoble> reservasSolicitadasPorInternacionConAsignacionActualPorInstitucion(Institucion institucion) {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble(a, a2) " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec " 
					+ "JOIN Piso as p ON sec.piso = p "
					+ "JOIN Institucion as i ON p.institucion = i " 
					+ "JOIN Asignacion as a ON a.cama = c "
					+ "JOIN Asignacion a2 ON a.paciente = a2.paciente "
					+ "WHERE i = :institucion " 
					+ "AND a.horaEgreso IS NULL "
					+ "AND a.horaIngreso IS NOT NULL "
					+ "AND a2.horaIngreso IS NULL "
					+ "AND a2.horaEgreso IS NULL "
					+ "AND a2.motivoTraslado IS NULL ";  

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
    }
    
    @SuppressWarnings({"unchecked" })
    @Override
    public List<AsignacionDoble> reservasSolicitadasConAsignacionActualPorInstitucion(Institucion institucion) {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble(a, a2) " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec " 
					+ "JOIN Piso as p ON sec.piso = p "
					+ "JOIN Institucion as i ON p.institucion = i " 
					+ "JOIN Asignacion as a ON a.cama = c "
					+ "JOIN Asignacion a2 ON a.paciente = a2.paciente "
					+ "WHERE i = :institucion " 
					+ "AND a.horaEgreso IS NULL "
					+ "AND a.horaIngreso IS NOT NULL "
					+ "AND a2.horaIngreso IS NULL "
					+ "AND a2.horaEgreso IS NULL ";  

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
    }
    
    /*--------------- RESERVAS A RECIBIR SIN ASIGNACION ACTUAL-------------------*/

    @SuppressWarnings({"unchecked" })
    @Override
    public List<Asignacion> reservasARecibirPorInstitucion(Institucion institucion) {

		String hql = "SELECT a " 
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
    
    /*--------------- RESERVAS A RECIBIR CON ASIGNACION ACTUAL-------------------*/
    
    @SuppressWarnings({"unchecked" })
    @Override
    public List<AsignacionDoble> reservasARecibirPorTrasladoConAsignacionActualPorInstitucion(Institucion institucion) {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble(a, a2) " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec " 
					+ "JOIN Piso as p ON sec.piso = p "
					+ "JOIN Institucion as i ON p.institucion = i " 
					+ "JOIN Asignacion as a2 ON a2.cama = c "
					+ "JOIN Asignacion as a ON a.paciente = a2.paciente "
					+ "WHERE i = :institucion " 
					+ "AND a.horaEgreso IS NULL "
					+ "AND a.horaIngreso IS NOT NULL "
					+ "AND a2.horaIngreso IS NULL "
					+ "AND a2.horaEgreso IS NULL "
					+ "AND a2.motivoTraslado IS NOT NULL ";  

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
    }
    
    @SuppressWarnings({"unchecked" })
    @Override
    public List<AsignacionDoble> reservasARecibirPorInternacionConAsignacionActualPorInstitucion(Institucion institucion) {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble(a, a2) " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec " 
					+ "JOIN Piso as p ON sec.piso = p "
					+ "JOIN Institucion as i ON p.institucion = i " 
					+ "JOIN Asignacion as a2 ON a2.cama = c "
					+ "JOIN Asignacion as a ON a.paciente = a2.paciente "
					+ "WHERE i = :institucion " 
					+ "AND a.horaEgreso IS NULL "
					+ "AND a.horaIngreso IS NOT NULL "
					+ "AND a2.horaIngreso IS NULL "
					+ "AND a2.horaEgreso IS NULL "
					+ "AND a2.motivoTraslado IS NULL ";  

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
    }
    
    @SuppressWarnings({"unchecked" })
    @Override
    public List<AsignacionDoble> reservasARecibirConAsignacionActualPorInstitucion(Institucion institucion) {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble(a, a2) " 
					+ "FROM Cama as c " 
					+ "JOIN Sala as sal ON c.sala = sal "
					+ "JOIN Sector as sec ON sal.sector = sec " 
					+ "JOIN Piso as p ON sec.piso = p "
					+ "JOIN Institucion as i ON p.institucion = i " 
					+ "JOIN Asignacion as a2 ON a2.cama = c "
					+ "JOIN Asignacion as a ON a.paciente = a2.paciente "
					+ "WHERE i = :institucion " 
					+ "AND a.horaEgreso IS NULL "
					+ "AND a.horaIngreso IS NOT NULL "
					+ "AND a2.horaIngreso IS NULL "
					+ "AND a2.horaEgreso IS NULL ";  

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
    }
}
