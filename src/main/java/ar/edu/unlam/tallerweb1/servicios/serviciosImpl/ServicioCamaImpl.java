package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.List;

import javax.transaction.Transactional;

import ar.edu.unlam.tallerweb1.servicios.ServicioCama;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioCama;

@Service
@Transactional

public class ServicioCamaImpl implements ServicioCama {

    @Autowired
    private RepositorioCama repositorioCama;

    @Override
    public Cama consultarCamaPorId(Long id) {

        return repositorioCama.consultarCamaPorId(id);
    }

    @Override
    public void registrarCama(Cama cama) {
        repositorioCama.registrarCama(cama);
    }

    @Override
    public List<Cama> obtenerCamas() {
        return repositorioCama.obtenerCamas();
    }
    
	@Override
	public List<Cama> obtenerTotalDeCamasOcupadas() {
		
		return repositorioCama.obtenerTotalDeCamasOcupadas();
	}

    @Override
    public List<Cama> obtenerCamasPorInstitucion(Institucion institucion) {
        return repositorioCama.obtenerCamasPorInstitucion(institucion);
    }
    
    @Override
    public List<Cama> obtenerCamasOcupadasPorInstitucion(Institucion institucion) {
        return repositorioCama.obtenerCamasOcupadasPorInstitucion(institucion);
    }

	@Override
	public List<Cama> obtenerCamasDisponiblesPorInstitucion(Institucion institucion) {
	
		 return repositorioCama.obtenerCamasDisponiblesPorInstitucion(institucion);

	}
	
	@Override
	public List<Cama> obtenerTotalDeCamasDisponibles() {
	
		return repositorioCama.obtenerTotalDeCamasDisponibles();

	}
	
	@Override
	public List<CamaCantidad> obtenerCantidadDeCamasOcupadasDeCadaInstitucion() {
		return repositorioCama.obtenerCantidadDeCamasOcupadasDeCadaInstitucion();
	}

	@Override
	public List<CamaCantidad> obtenerCantidadDeCamasDisponiblesDeCadaInstitucion() {
		return repositorioCama.obtenerCantidadDeCamasDisponiblesDeCadaInstitucion();
	}
	
    @Override
    public List<CamaCantidad> obtenerCamasDisponiblesDeUnTipoDeSalaDeUnaInstitucion(Institucion institucion, Sala sala) {
        return repositorioCama.obtenerCamasDisponiblesDeUnTipoDeSalaDeUnaInstitucion(institucion, sala);
    }

}
