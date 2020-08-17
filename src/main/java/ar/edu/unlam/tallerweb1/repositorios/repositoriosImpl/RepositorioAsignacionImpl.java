package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioAsignacion;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;

import java.util.List;

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

}
