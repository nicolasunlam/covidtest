package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaConAsignacion;

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

	List<CamaCantidad> obtenerCamasDisponiblesDeUnTipoDeSalaDeUnaInstitucion(Institucion institucion, Sala sala);

	List<Cama> obtenerCamasPorSala(Sala sala);

	List<CamaConAsignacion> obtenerListaDeCamasDisponiblesPorSala(Sala sala);

	List<CamaConAsignacion> obtenerListaDeCamasOcupadasPorSala(Sala sala);

	List<CamaConAsignacion> obtenerListaDeCamasReservadasPorSala(Sala sala);

	List<CamaConAsignacion> obtenerListaDetalladaDeCamasPorSala(Sala sala);
}
