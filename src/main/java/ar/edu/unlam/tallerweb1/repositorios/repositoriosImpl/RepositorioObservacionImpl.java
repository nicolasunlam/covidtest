package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.modelo.Observacion;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioObservacion;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;


@Repository("repositorioObservacion")
@Transactional
public class RepositorioObservacionImpl implements RepositorioObservacion {

    @Inject
    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioObservacionImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void registrarObservacion(Observacion observacion) {
        sessionFactory.getCurrentSession().save(observacion);
    }

    @Override
    public void actualizarObservacion(Observacion observacion) {
        sessionFactory.getCurrentSession().update(observacion);
    }

}
