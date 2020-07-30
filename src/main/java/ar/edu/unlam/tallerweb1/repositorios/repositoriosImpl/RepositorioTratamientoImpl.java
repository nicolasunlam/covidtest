package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.modelo.Tratamiento;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioTratamiento;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;


@Repository("repositorioTratamiento")
@Transactional
public class RepositorioTratamientoImpl implements RepositorioTratamiento {

    @Inject
    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioTratamientoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void registrarTratamiento(Tratamiento tratamiento) {
        sessionFactory.getCurrentSession().save(tratamiento);
    }

    @Override
    public void actualizarTratamiento(Tratamiento tratamiento) {
        sessionFactory.getCurrentSession().update(tratamiento);
    }

}
