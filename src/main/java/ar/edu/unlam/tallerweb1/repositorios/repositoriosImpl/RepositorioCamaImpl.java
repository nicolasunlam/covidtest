package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.Query;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioCama;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaConAsignacion;

@Repository("repositorioCama")
@Transactional
public class RepositorioCamaImpl implements RepositorioCama {

	@Inject
	private SessionFactory sessionFactory;

	@Autowired
	public RepositorioCamaImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@SuppressWarnings("deprecation")
	@Override
	public Cama consultarCamaPorId(Long id) {
		return (Cama) sessionFactory.getCurrentSession().createCriteria(Cama.class).add(Restrictions.eq("id", id))
				.uniqueResult();
	}

	@Override
	public void registrarCama(Cama cama) {
		sessionFactory.getCurrentSession().save(cama);
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Cama> obtenerCamas() {

		return sessionFactory.getCurrentSession().createCriteria(Cama.class).list();
	}

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<Cama> obtenerCamasPorInstitucion(Institucion institucion) {
		String hql = "SELECT c " + "FROM Cama as c " + "JOIN Sala as sal ON c.sala = sal "
				+ "JOIN Sector as sec ON sal.sector = sec " + "JOIN Piso as p ON sec.piso = p "
				+ "JOIN Institucion as i ON p.institucion = i " + "WHERE i = :institucion ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();

	}

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<Cama> obtenerTotalDeCamasOcupadas() {

		String hql = "SELECT c " + "FROM Cama as c " + "JOIN Sala as sal ON c.sala = sal "
				+ "JOIN Sector as sec ON sal.sector = sec " + "JOIN Piso as p ON sec.piso = p "
				+ "JOIN Institucion as i ON p.institucion = i " + "JOIN Asignacion as a ON a.cama = c "
				+ "WHERE a.cama = c " + "AND a.horaEgreso IS NULL ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cama> obtenerTotalDeCamasDisponibles() {

		String hql = "SELECT c " + "FROM Cama as c " + "WHERE c NOT IN (SELECT a.cama " + "FROM Asignacion as a "
				+ "WHERE a.cama = c " + "AND a.horaEgreso IS NULL) ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		return query.getResultList();
	}

	@SuppressWarnings({ "unchecked" })
	public List<Cama> obtenerCamasOcupadasPorInstitucion(Institucion institucion) {

		String hql = "SELECT c " + "FROM Cama as c " + "JOIN Sala as sal ON c.sala = sal "
				+ "JOIN Sector as sec ON sal.sector = sec " + "JOIN Piso as p ON sec.piso = p "
				+ "JOIN Institucion as i ON p.institucion = i " + "JOIN Asignacion as a ON a.cama = c "
				+ "WHERE i = :institucion " + "AND a.horaEgreso IS NULL";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
	}

	@SuppressWarnings({ "unchecked" })
	public List<CamaCantidad> obtenerCantidadDeCamasOcupadasDeCadaInstitucion() {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad(c, count(*)) " + "FROM Cama as c "
				+ "JOIN Sala as sal ON c.sala = sal " + "JOIN Sector as sec ON sal.sector = sec "
				+ "JOIN Piso as p ON sec.piso = p " + "JOIN Institucion as i ON p.institucion = i "
				+ "JOIN Asignacion as a ON a.cama = c " + "WHERE a.cama = c " + "AND a.horaEgreso IS NULL "
				+ "GROUP BY i";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		return query.getResultList();
	}

	@SuppressWarnings({ "unchecked" })
	@Override
	public List<CamaCantidad> obtenerCantidadDeCamasDisponiblesDeCadaInstitucion() {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad(c, count(*)) " + "FROM Cama as c "
				+ "JOIN Sala as sal ON c.sala = sal " + "JOIN Sector as sec ON sal.sector = sec "
				+ "JOIN Piso as p ON sec.piso = p " + "JOIN Institucion as i ON p.institucion = i "
				+ "WHERE c NOT IN (SELECT a.cama " + "FROM Asignacion as a " + "WHERE a.cama = c "
				+ "AND a.horaEgreso IS NULL) " + "GROUP BY i";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cama> obtenerCamasDisponiblesPorInstitucion(Institucion institucion) {

		String hql = "SELECT c " + "FROM Cama as c " + "JOIN Sala as sal ON c.sala = sal "
				+ "JOIN Sector as sec ON sal.sector = sec " + "JOIN Piso as p ON sec.piso = p "
				+ "JOIN Institucion as i ON p.institucion = i " + "WHERE i = :institucion "
				+ "AND c NOT IN (SELECT a.cama " + "FROM Asignacion as a " + "WHERE a.cama = c "
				+ "AND a.horaEgreso IS NULL) ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);

		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CamaCantidad> obtenerCamasDisponiblesDeUnTipoDeSalaDeUnaInstitucion(Institucion institucion,
			Sala sala) {

		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad(c, count(*)) " 
				+ "FROM Cama as c "
				+ "JOIN Sala as sal ON c.sala = sal " 
				+ "JOIN Sector as sec ON sal.sector = sec "
				+ "JOIN Piso as p ON sec.piso = p " 
				+ "JOIN Institucion as i ON p.institucion = i "
				+ "WHERE i = :institucion " 
				+ "AND sal.tipoSala = :tipoSala " 
				+ "AND c NOT IN (SELECT a.cama "
				+ "FROM Asignacion as a " 
				+ "WHERE a.cama = c " 
				+ "AND a.horaEgreso IS NULL) " 
				+ "GROUP BY c.tipoCama ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("institucion", institucion);
		query.setParameter("tipoSala", sala.getTipoSala());

		return query.getResultList();
	}

	@Override
	public List<Cama> obtenerCamasPorSala(Sala sala) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CamaConAsignacion> obtenerListaDeCamasDisponiblesPorSala(Sala sala) {
		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.CamaConAsignacion(c) " 
				+ "FROM Cama as c "
				+ "JOIN Sala as sal ON c.sala = sal "
				+ "JOIN Asignacion as a ON a.cama = c "
				+ "WHERE sal = :sala "
				+ "AND a.horaEgreso IS NULL "
				+ "AND a.horaIngreso IS NOT NULL "; 

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sala", sala);

		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CamaConAsignacion> obtenerListaDeCamasOcupadasPorSala(Sala sala) {
		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.CamaConAsignacion(c, a) " 
				+ "FROM Cama as c "
				+ "JOIN Sala as sal ON c.sala = sal "
				+ "JOIN Asignacion as a ON a.cama = c "
				+ "WHERE sal = :sala "
				+ "AND c NOT IN (SELECT a.cama " 
								+ "FROM Asignacion as a " 
								+ "WHERE a.cama = c "
								+ "AND a.horaEgreso IS NULL)";
		
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sala", sala);

		return query.getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CamaConAsignacion> obtenerListaDeCamasReservadasPorSala(Sala sala) {
		String hql = "SELECT new ar.edu.unlam.tallerweb1.modelo.listas.CamaConAsignacion(c, a) " 
				+ "FROM Cama as c "
				+ "JOIN Sala as sal ON c.sala = sal "
				+ "JOIN Asignacion as a ON a.cama = c "
				+ "WHERE sal = :sala " 
				+ "AND a.horaReserva IS NOT NULL "
				+ "AND a.horaIngreso IS NULL ";

		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("sala", sala);

		return query.getResultList();
	}
}
