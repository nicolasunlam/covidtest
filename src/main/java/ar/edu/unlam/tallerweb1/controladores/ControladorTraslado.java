package ar.edu.unlam.tallerweb1.controladores;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.MotivoTraslado;
import ar.edu.unlam.tallerweb1.modelo.Notificacion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.TipoCama;
import ar.edu.unlam.tallerweb1.modelo.TipoSala;
import ar.edu.unlam.tallerweb1.modelo.listas.InstitucionDistanciaSalas;
import ar.edu.unlam.tallerweb1.servicios.ServicioAsignacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioAtajo;
import ar.edu.unlam.tallerweb1.servicios.ServicioCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioInternacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioMotivoTraslado;
import ar.edu.unlam.tallerweb1.servicios.ServicioNotificacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioTipoCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioTipoSala;

@Controller
public class ControladorTraslado {

	@Autowired
	private ServicioPaciente servicioPaciente;
	@Autowired
	private ServicioInstitucion servicioInstitucion;
	@Autowired
	private ServicioAtajo servicioAtajo;
	@Autowired
	private ServicioTipoSala servicioTipoSala;
	@Autowired
	private ServicioTipoCama servicioTipoCama;
	@Autowired
	private ServicioMotivoTraslado servicioMotivoTraslado;
	@Autowired
	private ServicioInternacion servicioInternacion;	
	@Autowired
	private ServicioCama servicioCama;
	@Autowired
	private ServicioNotificacion servicioNotificacion;
	@Autowired
	private ServicioAsignacion servicioAsignacion;
	
	@RequestMapping("trasladar")
	public ModelAndView trasladar(
			
			@RequestParam Long idPaciente,
			HttpServletRequest request
			
			) {

    	ModelMap model = new ModelMap();
		
    	/*---------- Validaciones -----------*/
    	if(servicioAtajo.validarInicioDeSesion(request) != null) {
    		return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
    	}
    	if(servicioAtajo.validarPermisoAPagina(request) != null) {
    		return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
    	}
    	Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if(rol != null) {
			model.put("rol", rol.name());	
		}
    	model.put("armarHeader", servicioAtajo.armarHeader(request));
    	/*-----------------------------------*/
		
    	Paciente paciente = servicioPaciente.consultarPacientePorId(idPaciente);
		model.put("paciente", paciente);
		
    	Asignacion reserva = servicioAsignacion.consultarReservaAsignacionPaciente(paciente);
		if(reserva != null) {
			return new ModelAndView("redirect:/listaPacienteInternados");	
		}
		
    	List<String> listaEnfermedades = servicioPaciente.obtenerListaDeEnfermedadesDeUnPaciente(paciente);
		model.put("listaEnfermedades", listaEnfermedades);
		
    	List<TipoSala> listaTipoSalas = servicioTipoSala.obtenerListaTipoSalas();
		model.put("listaTipoSalas", listaTipoSalas); 
		
    	List<TipoCama> listaTipoCamas = servicioTipoCama.obtenerListaTipoCamas();
		model.put("listaTipoCamas", listaTipoCamas);   
		
		List<MotivoTraslado> listaMotivoTraslado = servicioMotivoTraslado.obtenerListaDeMotivoDeTraslado();
		model.put("listaMotivoTraslado", listaMotivoTraslado);
		
		return new ModelAndView("trasladar", model);
			
	}
	
	@RequestMapping("trasladarAInstitucion")
	public ModelAndView trasladarAInstitucion(
			
			@RequestParam Long idPaciente,
			@RequestParam TipoCama tipoCama,
			@RequestParam TipoSala tipoSala,
			@RequestParam MotivoTraslado motivoTraslado,
			@RequestParam String urgencia,
			HttpServletRequest request
			
			) {

    	ModelMap model = new ModelMap();
		
    	/*---------- Validaciones -----------*/
    	if(servicioAtajo.validarInicioDeSesion(request) != null) {
    		return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
    	}
    	if(servicioAtajo.validarPermisoAPagina(request) != null) {
    		return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
    	}
    	Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if(rol != null) {
			model.put("rol", rol.name());	
		}
    	model.put("armarHeader", servicioAtajo.armarHeader(request));
    	/*-----------------------------------*/

    	model.put("tipoCama", tipoCama);
    	model.put("tipoSala", tipoSala);
    	model.put("motivoTraslado", motivoTraslado);
    	model.put("urgencia", urgencia);
    	
    	Paciente paciente = servicioPaciente.consultarPacientePorId(idPaciente);
    	if(paciente == null) {
			return new ModelAndView("redirect:/listaPacienteInternados");	
		}
    	model.put("paciente", paciente);
		
		Long idInstitucion = (long) request.getSession().getAttribute("ID");
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		
		List<InstitucionDistanciaSalas> listaInstituciones = servicioInstitucion.obtenerInstitucionesConDistanciaYDisponibilidadDeCamasPorTipoDeSala(institucion, tipoCama, tipoSala);
		model.put("listaInstituciones", listaInstituciones);
		
		return new ModelAndView("trasladarAInstitucion", model);
			
	}
	
	@RequestMapping("enviarSolicitud")
	public ModelAndView enviarSolicitud(
			
			@RequestParam Long idPaciente,
			@RequestParam Long idInstitucionATrasladar,
			@RequestParam Long idCama,
			@RequestParam MotivoTraslado motivoTraslado,
			@RequestParam String urgencia,
			@RequestParam Integer distanciaTraslado,
			HttpServletRequest request
			
			) {

    	ModelMap model = new ModelMap();
		
    	/*---------- Validaciones -----------*/
    	if(servicioAtajo.validarInicioDeSesion(request) != null) {
    		return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
    	}
    	if(servicioAtajo.validarPermisoAPagina(request) != null) {
    		return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
    	}
    	Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if(rol != null) {
			model.put("rol", rol.name());	
		}
    	model.put("armarHeader", servicioAtajo.armarHeader(request));
    	/*-----------------------------------*/
    	
    	Paciente paciente = servicioPaciente.consultarPacientePorId(idPaciente);
    	Cama cama = servicioCama.consultarCamaPorId(idCama);
    	if(paciente == null || cama == null) {
			return new ModelAndView("redirect:/trasladar");	
		}
    	
    	ZoneId zone = ZoneId.of("America/Argentina/Buenos_Aires");
		LocalDateTime horaReserva = LocalDateTime.now(zone);
    	
    	Asignacion asignacionAReservar = new Asignacion();
    	asignacionAReservar.setCama(cama);
    	asignacionAReservar.setPaciente(paciente);
    	asignacionAReservar.setHoraReserva(horaReserva);
    	
		servicioInternacion.registrarInternacion(asignacionAReservar);
    	
		Long idInstitucion = (long) request.getSession().getAttribute("ID");
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		Institucion institucionATrasladar = servicioInstitucion.obtenerInstitucionPorId(idInstitucionATrasladar);
		String asunto = "Autorizar Traslado";
		String msg = "Solicitud de traslado del paciente "
			        + paciente.getApellido() + ", " + paciente.getNombre() 
			        + " (" + paciente.getTipoDocumento().getDescripcion() + ":"  + paciente.getNumeroDocumento() + ") " 
			        + " en la cama " + cama.getDescripcion() + cama.getTipoCama().getDescripcion() 
			        + " en una sala de " + cama.getSala().getTipoSala().getDescripcion() 
			        + " de la institución " + institucion.getNombre() 
			        + " ubicada en la localidad de " + institucion.getDomicilio().getLocalidad().getNombreLocalidad()
			        + " a " + distanciaTraslado + " km de distancia."; 
		
		Notificacion notificacionTraslado = new Notificacion();
		notificacionTraslado.setRemitente(institucion);
		notificacionTraslado.setDestinatario(institucionATrasladar);
		notificacionTraslado.setFechaHora(horaReserva);
		notificacionTraslado.setAsunto(asunto);
		notificacionTraslado.setMsg(msg);
		servicioNotificacion.registrarNotificacion(notificacionTraslado );
		
		return new ModelAndView("redirect:/verMensajes");	
			
	}
	
	//	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd, MMMM, yyyy HH:mm");

}

