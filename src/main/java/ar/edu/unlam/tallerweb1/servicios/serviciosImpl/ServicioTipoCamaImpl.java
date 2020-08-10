package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.TipoCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioTipoCama;

@Service("servicioTipoCama")
@Transactional
public class ServicioTipoCamaImpl implements ServicioTipoCama {

	@Override
	public List<TipoCama> obtenerListaTipoCamas() {

		List<TipoCama> listaTipoCamas = new LinkedList<TipoCama>();
		
        for (TipoCama tipoCamas : TipoCama.values()) {
        	listaTipoCamas.add(tipoCamas);
		}
        
        return listaTipoCamas;
	}
	
	

}
