package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.listas.PisoConSectores;

public interface ServicioPiso {

	public void registrarPiso(Piso piso);

	public void actualizarPiso(Piso piso);

	public Piso buscarPisoPorId(Long id);

	List<Piso> listarPisosPorInstitucion(Institucion institucion);

	public PisoConSectores pisoConSectoresSalasYCamas(Piso piso);

	public List<PisoConSectores> listarPisosConSectoresSalasYCamasDeUnaInstitucion(Institucion institucion);

	public PisoConSectores obtenerDetalleDePiso(Piso piso);
}
