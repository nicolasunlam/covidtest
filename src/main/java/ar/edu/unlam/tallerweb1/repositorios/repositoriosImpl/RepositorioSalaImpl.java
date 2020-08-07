package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
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
		return (Sala) sessionFactory.getCurrentSession().createCriteria(Sala.class)
                .add(Restrictions.eq("id", id)).uniqueResult();
	}

}
