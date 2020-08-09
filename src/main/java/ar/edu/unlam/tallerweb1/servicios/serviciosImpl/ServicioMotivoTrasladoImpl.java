package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.MotivoTraslado;
import ar.edu.unlam.tallerweb1.servicios.ServicioMotivoTraslado;

@Service("servicioMotivoTraslado")
@Transactional
public class ServicioMotivoTrasladoImpl implements ServicioMotivoTraslado {

	@Override
	public List<MotivoTraslado> obtenerListaDeMotivoDeTraslado() {

		List<MotivoTraslado> listaMotivoTraslados = new LinkedList<MotivoTraslado>();
		
        for (MotivoTraslado motivoTraslado : listaMotivoTraslados) {
            	listaMotivoTraslados.add(motivoTraslado);
		}
        
        return listaMotivoTraslados;
	}

}
