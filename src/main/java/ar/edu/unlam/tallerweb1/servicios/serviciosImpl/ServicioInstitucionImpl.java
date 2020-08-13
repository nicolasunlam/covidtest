package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.TreeSet;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.TipoCama;
import ar.edu.unlam.tallerweb1.modelo.TipoSala;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad;
import ar.edu.unlam.tallerweb1.modelo.listas.InstitucionDistanciaSalas;
import ar.edu.unlam.tallerweb1.modelo.listas.OrdenarPorPrioridad;
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
    public List<CamaCantidad> obtenerEstadisticaDeCamasDeUnTipoDeSalaDeUnaInstitucion(Institucion institucion, Sala sala) {
        return repositorioInstitucion.obtenerEstadisticaDeCamasDeUnTipoDeSalaDeUnaInstitucion(institucion, sala);
    }

	@Override
    public List<SalaCantidad> obtenerEstadisticaDeSalasDeUnaInstitucion(Institucion institucion) {
       
    	List<SalaCantidad> lista = repositorioInstitucion.obtenerEstadisticaDeSalasDeUnaInstitucion(institucion);	

    	for(int i = 0; i < lista.size(); ++i) {

    		List<CamaCantidad> listaCamas = obtenerEstadisticaDeCamasDeUnTipoDeSalaDeUnaInstitucion(institucion, lista.get(i).getSala());

    		lista.get(i).setListaCama(listaCamas);
    	}
    	
    	return lista;
//    	OrdenarPorPrioridad orden = new OrdenarPorPrioridad();
//    	TreeSet<SalaCantidad> listaOrdenada = new TreeSet<SalaCantidad>(orden);
//    	listaOrdenada.addAll(lista);
//
//    	return listaOrdenada;
    }

    
	@Override
	public List<InstitucionDistanciaSalas> obtenerInstitucionesConDistanciaYDisponibilidadDeCamasPorTipoDeSala(Institucion institucion, TipoCama tipoCama, TipoSala tipoSala) {

    	List <InstitucionDistanciaSalas> listaInstitucionDistanciaSalas = new LinkedList<InstitucionDistanciaSalas>();
    	
		List <Institucion> instituciones = repositorioInstitucion.obtenerListaInstituciones();
		
    	for(int i = 0; i < instituciones.size(); ++i) {
    		
    		if (instituciones.get(i).getId() != institucion.getId()) {
			
    		List<SalaCantidad> listaSala = obtenerEstadisticaDeSalasDeUnaInstitucion(instituciones.get(i));
    		
    		Boolean camaRequerida = tieneCamaRequerida(tipoCama, listaSala);
    		Boolean salaRequerida = tieneSalaRequerida(tipoSala, listaSala);
    		
    		Double distancia = servicioMapa.calcularDistanciaEntreDosPuntos(instituciones.get(i).getLatitud(), 
    																		instituciones.get(i).getLongitud(), 
																			institucion.getLatitud(), institucion.getLongitud());
    		
    		InstitucionDistanciaSalas institucionDistanciaSalas = new InstitucionDistanciaSalas(instituciones.get(i), distancia, listaSala, camaRequerida, salaRequerida);
    		
    		listaInstitucionDistanciaSalas.add(institucionDistanciaSalas);	
			}
	    }
	    
	    return listaInstitucionDistanciaSalas;
	}

	private Boolean tieneCamaRequerida(TipoCama tipoCama, List<SalaCantidad> listaSala) {
    	
		for(int i = 0; i < listaSala.size(); ++i) {
			
			for(int j = 0; j < listaSala.get(i).getListaCama().size(); ++j) {	
				
				if (listaSala.get(i).getListaCama().get(j).getCama().getTipoCama() == tipoCama) {
					return true;
				}
			}
    	}
		return false;
	}

	private Boolean tieneSalaRequerida(TipoSala tipoSala, List<SalaCantidad> listaSala) {

	for(int i = 0; i < listaSala.size(); ++i) {	
		
		if (listaSala.get(i).getSala().getTipoSala() == tipoSala) {
			return true;
		}
	}
	return false;
	}
}
