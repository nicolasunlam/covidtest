package ar.edu.unlam.tallerweb1.servicios;


import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Notificacion;
import ar.edu.unlam.tallerweb1.modelo.Usuario;

public interface ServicioNotificacion {
	
	public void registrarNotificacion(Notificacion notificacion);
	
	public List<Notificacion> buscarNotificacionPorId(Usuario usuario);

	public Notificacion buscarNotificacionPorSuId(Long id);

	public List<Notificacion> buscarNotificacionesEnviadasPorUsuario(Usuario usuario);

	

}
