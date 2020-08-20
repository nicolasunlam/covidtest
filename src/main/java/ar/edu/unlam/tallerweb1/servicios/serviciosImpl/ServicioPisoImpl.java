package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.modelo.Sector;
import ar.edu.unlam.tallerweb1.modelo.listas.PisoConSectores;
import ar.edu.unlam.tallerweb1.modelo.listas.SectorConSalas;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioPiso;
import ar.edu.unlam.tallerweb1.servicios.ServicioPiso;
import ar.edu.unlam.tallerweb1.servicios.ServicioSector;

@Service("servicioPiso")
@Transactional
public class ServicioPisoImpl implements ServicioPiso {

	@Autowired
	private RepositorioPiso repositorioPiso;

	@Autowired
	private ServicioSector servicioSector;

	@Override
	public void registrarPiso(Piso piso) {
		repositorioPiso.registrarPiso(piso);
	}

	@Override
	public void actualizarPiso(Piso piso) {
		repositorioPiso.actualizarPiso(piso);
	}

	@Override
	public Piso buscarPisoPorId(Long id) {
		return repositorioPiso.buscarPisoPorId(id);
	}

	@Override
	public List<Piso> listarPisosPorInstitucion(Institucion institucion) {
		return repositorioPiso.listarPisosPorInstitucion(institucion);

	}

	@Override
	public PisoConSectores pisoConSectoresSalasYCamas(Piso piso) {
		
			return obtenerDetalleDePiso(piso);
	}
	
	@Override
	public List<PisoConSectores> listarPisosConSectoresSalasYCamasDeUnaInstitucion(Institucion institucion) {
		List<Piso> listaPisos = listarPisosPorInstitucion(institucion);
		List<PisoConSectores> listaPisosConDetalle = new ArrayList<PisoConSectores>();
		for (int i = 0; i < listaPisos.size(); i++) {
			listaPisosConDetalle.add(obtenerDetalleDePiso(listaPisos.get(i)));
		}
		return listaPisosConDetalle;
	}

	@Override
	public PisoConSectores obtenerDetalleDePiso(Piso piso) {
		List<Sector> listaSectores = servicioSector.consultarSectoresPorPiso(piso);
		List<SectorConSalas> listaSectoresConDetalle = new ArrayList<SectorConSalas>();
		for (int i = 0; i < listaSectores.size(); i++) {
			listaSectoresConDetalle.add(servicioSector.obtenerDetalleDeSector(listaSectores.get(i)));
		}

		PisoConSectores pisoConSectores = new PisoConSectores();
		pisoConSectores.setListaDeSectores(listaSectoresConDetalle);
		pisoConSectores.setPiso(piso);
		return pisoConSectores;

	}

}
