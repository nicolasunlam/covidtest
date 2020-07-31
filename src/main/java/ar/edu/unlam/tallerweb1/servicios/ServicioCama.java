package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad;

public interface ServicioCama {

    void registrarCama(Cama cama);

    Cama consultarCamaPorId(Long id);

	List<Cama> obtenerCamas();

	List<Cama> obtenerCamasPorInstitucion(Institucion institucion);

	List<Cama> obtenerCamasDisponiblesPorInstitucion(Institucion institucion);

	List<Cama> obtenerCamasOcupadasPorInstitucion(Institucion institucion);
	
	List<Cama> obtenerTotalDeCamasOcupadas();

	List<Cama> obtenerTotalDeCamasDisponibles();
	
	List<CamaCantidad> obtenerCantidadDeCamasOcupadasDeCadaInstitucion();

	List<CamaCantidad> obtenerCantidadDeCamasDisponiblesDeCadaInstitucion();
}
