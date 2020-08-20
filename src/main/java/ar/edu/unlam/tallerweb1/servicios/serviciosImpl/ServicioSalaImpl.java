package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaConAsignacion;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaConCamas;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioSala;
import ar.edu.unlam.tallerweb1.servicios.ServicioCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioSala;

@Service("servicioSala")
@Transactional
public class ServicioSalaImpl implements ServicioSala {

	@Autowired
	RepositorioSala repositorioSala;
	@Autowired
	ServicioCama servicioCama;

	@Override
	public void registrarSala(Sala sala) {
		repositorioSala.registrarSala(sala);

	}

	@Override
	public void actualizarSala(Sala sala) {
		repositorioSala.actualizarSala(sala);

	}

	@Override
	public Sala buscarSalaPorId(Long id) {

		return repositorioSala.buscarSalaPorId(id);
	}

	@Override
	public List<Sala> listarSalasPorSector(Sector sector) {
		// TODO Auto-generated method stub
		return repositorioSala.listarSalasPorSector(sector);
	}

	@Override
	public List<SalaCantidad> obtenerSalasConCantidadDeCamasDisponiblesDeUnaInstitucion(Institucion institucion) {

		List<SalaCantidad> lista = repositorioSala
				.obtenerSalasConCantidadDeCamasDisponiblesDeUnaInstitucion(institucion);

		for (int i = 0; i < lista.size(); ++i) {

			List<CamaCantidad> listaCamas = servicioCama
					.obtenerCamasDisponiblesDeUnTipoDeSalaDeUnaInstitucion(institucion, lista.get(i).getSala());

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
	public SalaConCamas obtenerDetalleDeSala(Sala sala) {
		List<Cama> listaCamas = servicioCama.obtenerCamasPorSala(sala);
		List<CamaConAsignacion> listaCamasConAsignacion = servicioCama.obtenerListaDetalladaDeCamasPorSala(sala);

		SalaConCamas salaConCamas = new SalaConCamas();
		salaConCamas.setListaDeCamasConAsignacion(listaCamasConAsignacion);
		salaConCamas.setSala(sala);

		return salaConCamas;
	}

}
