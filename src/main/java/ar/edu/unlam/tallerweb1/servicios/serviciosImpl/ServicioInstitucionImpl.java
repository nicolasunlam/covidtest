package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.LinkedList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.modelo.listas.InstitucionDistanciaSalas;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioInstitucion;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioUsuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioMapa;

@Service
@Transactional
public class ServicioInstitucionImpl implements ServicioInstitucion {

    @Autowired
    private RepositorioInstitucion repositorioInstitucion;
    @Autowired
    private RepositorioUsuario repositorioUsuario;
    @Autowired
    private ServicioMapa servicioMapa;

    @Override
    public void registrarInstitucion(Usuario usuario){

        repositorioUsuario.registrarInstitucion(usuario);
    }

    @Override
    public Institucion consultarInstitucionPorCuit(String numeroCuit) {

        return repositorioInstitucion.consultarInstitucionPorCuit(numeroCuit);
    }

    @Override
    public List<Institucion> obtenerListaInstituciones() {
        return repositorioInstitucion.obtenerListaInstituciones();
    }

	@Override
	public Institucion obtenerInstitucionPorId(Long idInstitucion) {
		
		return repositorioInstitucion.obtenerInstitucionPorId(idInstitucion);
	}

    @Override
    public void actualizarInstitucion(Institucion institucion) {
        repositorioInstitucion.actualizarInstitucion(institucion);
    }

    @Override
    public List<Institucion> listarInstitucionesPorLocalidad(Long id) {
        return repositorioInstitucion.listarInstitucionesPorLocalidad(id);
    }

    @Override
    public List<SalaCantidad> obtenerEstadisticaDeSalasDeUnaInstitucion(Institucion institucion) {
       
    	return repositorioInstitucion.obtenerEstadisticaDeSalasDeUnaInstitucion(institucion);	
    }

    
	@Override
	public List<InstitucionDistanciaSalas> obtenerInstitucionesConDistanciaYDisponibilidadDeCamasPorTipoDeSala(Institucion institucion) {

    	List <InstitucionDistanciaSalas> listaInstitucionDistanciaSalas = new LinkedList<InstitucionDistanciaSalas>();
    	
		List <Institucion> instituciones = repositorioInstitucion.obtenerListaInstituciones();
		
    	for(int i = 0; i < instituciones.size(); ++i) {
    		
    		if (instituciones.get(i) != institucion) {
			
    		List <SalaCantidad> listaSala = repositorioInstitucion.obtenerEstadisticaDeSalasDeUnaInstitucion(instituciones.get(i));
    		
    		Double distancia = servicioMapa.calcularDistanciaEntreDosPuntos(instituciones.get(i).getLatitud(), 
    																		instituciones.get(i).getLongitud(), 
																			institucion.getLatitud(), institucion.getLongitud());
    		
    		InstitucionDistanciaSalas institucionDistanciaSalas = new InstitucionDistanciaSalas(instituciones.get(i), distancia, listaSala);
    		
    		listaInstitucionDistanciaSalas.add(institucionDistanciaSalas);	
			}
	    }
	    
	    return listaInstitucionDistanciaSalas;
	}

}
