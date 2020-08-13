package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Sala;
import ar.edu.unlam.tallerweb1.modelo.TipoCama;
import ar.edu.unlam.tallerweb1.modelo.TipoSala;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.modelo.listas.CamaCantidad;
import ar.edu.unlam.tallerweb1.modelo.listas.InstitucionDistanciaSalas;
import ar.edu.unlam.tallerweb1.modelo.listas.SalaCantidad;

import java.util.List;
import java.util.TreeSet;

public interface ServicioInstitucion {

    public void registrarInstitucion(Usuario usuario);

    public Institucion consultarInstitucionPorCuit(String numeroCuit);

    public List<Institucion> obtenerListaInstituciones();
    //Para panel
    public Institucion obtenerInstitucionPorId(Long idInstitucion);

    void actualizarInstitucion(Institucion institucion);

    List<Institucion> listarInstitucionesPorLocalidad(Long id);

	public List<InstitucionDistanciaSalas> obtenerInstitucionesConDistanciaYDisponibilidadDeCamasPorTipoDeSala(Institucion institucion, TipoCama tipoCama, TipoSala tipoSala);

	List<SalaCantidad> obtenerEstadisticaDeSalasDeUnaInstitucion(Institucion institucion);

	List<CamaCantidad> obtenerEstadisticaDeCamasDeUnTipoDeSalaDeUnaInstitucion(Institucion institucion, Sala sala);

    //List<Institucion> listarInstitucionesPorZona(Zona zona);
}
