package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.LinkedList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.TipoCama;
import ar.edu.unlam.tallerweb1.modelo.TipoSala;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.modelo.listas.InstitucionDistanciaSalasCamas;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioInstitucion;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioUsuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioMapa;
import ar.edu.unlam.tallerweb1.servicios.ServicioSala;

@Service
@Transactional
public class ServicioInstitucionImpl implements ServicioInstitucion {

    @Autowired
    private RepositorioInstitucion repositorioInstitucion;
    @Autowired
    private RepositorioUsuario repositorioUsuario;
    @Autowired
    private ServicioMapa servicioMapa;
    @Autowired
    private ServicioSala servicioSala;
    
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
	public List<InstitucionDistanciaSalasCamas> obtenerInstitucionesConDistanciaYDisponibilidadDeCamasPorTipoDeSala(Institucion institucion, TipoCama tipoCama, TipoSala tipoSala) {

    	List <InstitucionDistanciaSalasCamas> listaInstitucionDistanciaSalas = new LinkedList<InstitucionDistanciaSalasCamas>();
    	
		List <Institucion> instituciones = repositorioInstitucion.obtenerListaInstituciones();
		
    	for(int i = 0; i < instituciones.size(); ++i) {
    		
    		if (instituciones.get(i).getId() != institucion.getId()) {
			
    		List<SalaCantidad> listaSala = servicioSala.obtenerSalasConCantidadDeCamasDisponiblesDeUnaInstitucion(instituciones.get(i));
    		
    		Boolean camaRequerida = tieneCamaRequerida(tipoCama, listaSala);
    		Boolean salaRequerida = tieneSalaRequerida(tipoSala, listaSala);
    		Boolean salaYCamaRequerida = tieneSalaYCamaRequerida(tipoSala, tipoCama, listaSala);
    		
    		Double distancia = servicioMapa.calcularDistanciaEntreDosPuntos(instituciones.get(i).getLatitud(), 
    																		instituciones.get(i).getLongitud(), 
																			institucion.getLatitud(), institucion.getLongitud());
    		
    		InstitucionDistanciaSalasCamas institucionDistanciaSalasCamas = new InstitucionDistanciaSalasCamas(instituciones.get(i), distancia, listaSala, camaRequerida, salaRequerida, salaYCamaRequerida);
    		
    		listaInstitucionDistanciaSalas.add(institucionDistanciaSalasCamas);	
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
	
	private Boolean tieneSalaYCamaRequerida(TipoSala tipoSala, TipoCama tipoCama, List<SalaCantidad> listaSala) {

		for(int i = 0; i < listaSala.size(); ++i) {
			
			if(listaSala.get(i).getSala().getTipoSala() == tipoSala) {
				
				for(int j = 0; j < listaSala.get(i).getListaCama().size(); ++j) {	
					
					if (listaSala.get(i).getListaCama().get(j).getCama().getTipoCama() == tipoCama) {
						return true;
					}
				}
			}
		}
		return false;
	}
	
	@Override
	public List<InstitucionDistanciaSalasCamas> obtenerInstitucionesConDistanciaYDisponibilidadDeCamasPorTipoDeSala(Paciente paciente, TipoCama tipoCama, TipoSala tipoSala) {

    	List <InstitucionDistanciaSalasCamas> listaInstitucionDistanciaSalas = new LinkedList<InstitucionDistanciaSalasCamas>();
    	
		List <Institucion> instituciones = repositorioInstitucion.obtenerListaInstituciones();
		
    	for(int i = 0; i < instituciones.size(); ++i) {
			
    		List<SalaCantidad> listaSala = servicioSala.obtenerSalasConCantidadDeCamasDisponiblesDeUnaInstitucion(instituciones.get(i));
    		
    		Boolean camaRequerida = tieneCamaRequerida(tipoCama, listaSala);
    		Boolean salaRequerida = tieneSalaRequerida(tipoSala, listaSala);
    		Boolean salaYCamaRequerida = tieneSalaYCamaRequerida(tipoSala, tipoCama, listaSala);
    		
    		Double distancia = servicioMapa.calcularDistanciaEntreDosPuntos(instituciones.get(i).getLatitud(), 
    																		instituciones.get(i).getLongitud(), 
																			paciente.getLatitud(), paciente.getLongitud());
    		
    		InstitucionDistanciaSalasCamas institucionDistanciaSalasCamas = new InstitucionDistanciaSalasCamas(instituciones.get(i), distancia, listaSala, camaRequerida, salaRequerida, salaYCamaRequerida);
    		
    		listaInstitucionDistanciaSalas.add(institucionDistanciaSalasCamas);	

	    }
	    
	    return listaInstitucionDistanciaSalas;
	}
}
