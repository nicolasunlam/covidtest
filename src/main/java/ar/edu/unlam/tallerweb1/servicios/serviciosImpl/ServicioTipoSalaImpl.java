package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.TipoSala;
import ar.edu.unlam.tallerweb1.servicios.ServicioTipoSala;

@Service("servicioTipoSala")
@Transactional
public class ServicioTipoSalaImpl implements ServicioTipoSala {

	@Override
	public List<TipoSala> obtenerListaTipoSalas() {

		LinkedList<TipoSala> listaTipoSalas = new LinkedList<TipoSala>();
		
        for (TipoSala tipoSalas : listaTipoSalas) {
        	listaTipoSalas.add(tipoSalas);
		}
        
        return listaTipoSalas;
	}


}
