package ar.edu.unlam.tallerweb1.repositorios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;


public interface RepositorioInstitucion {

    Institucion consultarInstitucionPorCuit(String numeroCuit);

    List<Institucion> obtenerListaInstituciones();

	Institucion obtenerInstitucionPorId(Long id);

    void actualizarInstitucion(Institucion institucion);

    List<Institucion> listarInstitucionesPorLocalidad(Long id);

    List<SalaCantidad> obtenerEstadisticaDeSalasDeUnaInstitucion(Institucion institucion);

//    List<Institucion> listarInstitucionesPorZona(Zona zona);
}
