package ar.edu.unlam.tallerweb1.repositorios.repositoriosImpl;

import ar.edu.unlam.tallerweb1.repositorios.RepositorioInstitucion;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.TipoSala;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad;
import ar.edu.unlam.tallerweb1.modelo.listas.OrdenarPorPrioridad;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;

import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;

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

}
