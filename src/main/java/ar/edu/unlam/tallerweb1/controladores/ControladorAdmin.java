package ar.edu.unlam.tallerweb1.controladores;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Asignacion;
import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.MotivoIngreso;
import ar.edu.unlam.tallerweb1.modelo.MotivoTraslado;
import ar.edu.unlam.tallerweb1.modelo.Notificacion;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.TipoCama;
import ar.edu.unlam.tallerweb1.modelo.TipoSala;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDistancia;
import ar.edu.unlam.tallerweb1.modelo.listas.AsignacionDoble;
import ar.edu.unlam.tallerweb1.modelo.listas.InstitucionDistanciaSalasCamas;
import ar.edu.unlam.tallerweb1.servicios.ServicioAsignacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioAtajo;
import ar.edu.unlam.tallerweb1.servicios.ServicioCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioInternacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioMapa;
import ar.edu.unlam.tallerweb1.servicios.ServicioNotificacion;
import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioTipoCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioTipoSala;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

@Controller
public class ControladorAdmin {

	@Autowired
	private ServicioUsuario servicioUsuario;
	@Autowired
	private ServicioPaciente servicioPaciente;
	@Autowired
	private ServicioAtajo servicioAtajo;
	@Autowired
	private ServicioCama servicioCama;
	@Autowired
	private ServicioInstitucion servicioInstitucion;
	@Autowired
	private ServicioNotificacion servicioNotificacion;
	@Autowired
	private ServicioInternacion servicioInternacion;
	@Autowired
	private ServicioTipoCama servicioTipoCama;
	@Autowired
	private ServicioTipoSala servicioTipoSala;
	@Autowired
	private ServicioAsignacion servicioAsignacion;
	@Autowired
	private ServicioMapa servicioMapa;
	
	@RequestMapping("admin")
	public ModelAndView irAadmin(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long id = (long) request.getSession().getAttribute("ID");
		Usuario admin = servicioUsuario.consultarUsuarioPorId(id);

		String nombre = admin.getNombre();

		model.put("nomb-re", nombre);

		/**/

		Integer cantidadTotalCamas = servicioCama.obtenerCamas().size();
		Integer cantidadCamasOcupadas = servicioCama.obtenerTotalDeCamasOcupadas().size();
		Integer cantidadCamasDisponibles = servicioCama.obtenerTotalDeCamasDisponibles().size();
		Integer cantidadCamasReservadas = cantidadTotalCamas - (cantidadCamasDisponibles + cantidadCamasOcupadas);

		model.put("cantidadTotalCamas", cantidadTotalCamas);
		model.put("cantidadCamasOcupadas", cantidadCamasOcupadas);
		model.put("cantidadCamasDisponibles", cantidadCamasDisponibles);
		model.put("cantidadCamasReservadas", cantidadCamasReservadas);
		/**/

		return new ModelAndView("admin", model);
	}

	@RequestMapping("homeAdmin")
	public ModelAndView irAhomeAdmin(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("homeAdmin", model);

	}

	@RequestMapping("/panel")
	public ModelAndView irApanel(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		List<Paciente> poInfectados = servicioPaciente.posiblesInfectados();

		model.put("poInfectados", poInfectados);

		return new ModelAndView("panel", model);

	}

	// PAGINA DE ACCESO DENEGADO POR DEFAULT
	@RequestMapping(path = "/denied", method = RequestMethod.GET)
	public ModelAndView denied(

			HttpServletRequest request) {

		ModelMap model = new ModelMap();

		if (servicioAtajo.validarInicioDeSesion(request) != null) {
			return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
		}
		if (servicioAtajo.validarPermisoAPagina(request) != null) {
			return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
		}
		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("denied", model);
	}

	/*------------------------------ ASIGNAR (ADMIN)-------------------------------------*/
	@RequestMapping("asignar")
	public ModelAndView asignar(
			
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
			return new ModelAndView("redirect:/listaPacientesInternados");	
		}
		
    	List<String> listaEnfermedades = servicioPaciente.obtenerListaDeEnfermedadesDeUnPaciente(paciente);
		model.put("listaEnfermedades", listaEnfermedades);
		
    	List<TipoSala> listaTipoSalas = servicioTipoSala.obtenerListaTipoSalas();
		model.put("listaTipoSalas", listaTipoSalas); 
		
    	List<TipoCama> listaTipoCamas = servicioTipoCama.obtenerListaTipoCamas();
		model.put("listaTipoCamas", listaTipoCamas);   
		
		return new ModelAndView("asignar", model);
			
	}
	
	@RequestMapping("asignarAInstitucion")
	public ModelAndView asignarAInstitucion(
			
			@RequestParam Long idPaciente,
			@RequestParam TipoCama tipoCama,
			@RequestParam TipoSala tipoSala,
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
    	model.put("urgencia", urgencia);
    	
    	Paciente paciente = servicioPaciente.consultarPacientePorId(idPaciente);
    	if(paciente == null) {
			return new ModelAndView("redirect:/listaPacienteInternados");	
		}
    	model.put("paciente", paciente);
		
		List<InstitucionDistanciaSalasCamas> listaInstituciones = servicioInstitucion
				.obtenerInstitucionesConDistanciaYDisponibilidadDeCamasPorTipoDeSala(paciente, tipoCama, tipoSala);
		model.put("listaInstituciones", listaInstituciones);
		
		return new ModelAndView("asignarAInstitucion", model);
			
	}
	
	@RequestMapping("enviarAsignacion")
	public ModelAndView enviarAsignacion(
			
			@RequestParam Long idPaciente,
			@RequestParam Long idInstitucionAInternar,
			@RequestParam Long idCama,
			@RequestParam String urgencia,
			@RequestParam Integer distancia,
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
			return new ModelAndView("redirect:/listaPacientesInternados");	
		}
    	
    	ZoneId zone = ZoneId.of("America/Argentina/Buenos_Aires");
		LocalDateTime horaReserva = LocalDateTime.now(zone);
    	
    	Asignacion asignacionAReservar = new Asignacion();
    	asignacionAReservar.setCama(cama);
    	asignacionAReservar.setPaciente(paciente);
    	asignacionAReservar.setHoraReserva(horaReserva);
    	asignacionAReservar.setUrgencia(urgencia);
    	asignacionAReservar.setAutorizada(true);
    	
		servicioInternacion.registrarInternacion(asignacionAReservar);
    	
		Long idInstitucion = (long) request.getSession().getAttribute("ID");
		Institucion admin = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		
		Institucion institucionAInternar = servicioInstitucion.obtenerInstitucionPorId(idInstitucionAInternar);
		
		String asunto = "Asignación Reservada";
		String msg = "Se ha realizado una asignación por parte de la institución "
					+ admin.getNombre()
					+ " del paciente "
			        + paciente.getApellido() + ", " + paciente.getNombre() 
			        + " (" + paciente.getTipoDocumento().getDescripcion() + ":"  + paciente.getNumeroDocumento() + ") " 
			        + " en la cama " + cama.getDescripcion() + " "  + cama.getTipoCama().getDescripcion() 
			        + " de la sala de " + cama.getSala().getDescripcion() 
			        + " de " + cama.getSala().getTipoSala().getDescripcion() 
			        + " de la institución " + institucionAInternar.getNombre() 
			        + " ubicada en la localidad de " + institucionAInternar.getDomicilio().getLocalidad().getNombreLocalidad()
			        + " a " + distancia + " km de distancia del paciente."; 
		
		Notificacion notificacionAsignacion = new Notificacion();
		notificacionAsignacion.setRemitente(admin);
		notificacionAsignacion.setDestinatario(institucionAInternar);
		notificacionAsignacion.setFechaHora(horaReserva);
		notificacionAsignacion.setAsunto(asunto);
		notificacionAsignacion.setMsg(msg);
		servicioNotificacion.registrarNotificacion(notificacionAsignacion );
		
		return new ModelAndView("redirect:/verMensajesEnviados");	
			
	}

	@RequestMapping("asignacionesSolicitadas")
	public ModelAndView asignacionesSolicitadas(
			
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

		Long idInstitucion = (long) request.getSession().getAttribute("ID");
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		
		List<AsignacionDistancia> asignaciones = servicioAsignacion.reservasARecibirPorInternacionPorInstitucion(institucion);
		model.put("asignaciones", asignaciones);
		
		for (AsignacionDistancia asignacion : asignaciones) {
			
			Double latitud1 = asignacion.getAsignacion().getCama().getSala().getSector().getPiso().getInstitucion().getLatitud();
			Double longitud1 = asignacion.getAsignacion().getCama().getSala().getSector().getPiso().getInstitucion().getLongitud();
			Double latitud2 = asignacion.getAsignacion().getPaciente().getLatitud();
			Double longitud2 = asignacion.getAsignacion().getPaciente().getLongitud();
			
			asignacion.setDistancia(servicioMapa.calcularDistanciaEntreDosPuntos(latitud1, longitud1, latitud2, longitud2));
		}
		
		return new ModelAndView("asignacionesSolicitadas", model);
			
	}

	@RequestMapping(value = "decidirAsignacion", method = RequestMethod.POST)
	public ModelAndView decidirAsignacion(
			
			@RequestParam Long idAsignacionReservada,
			@RequestParam String decision,
			@RequestParam Double distancia,
			HttpServletRequest request
			
			) {
		
    	/*---------- Validaciones -----------*/
    	if(servicioAtajo.validarInicioDeSesion(request) != null) {
    		return new ModelAndView(servicioAtajo.validarInicioDeSesion(request));
    	}
    	if(servicioAtajo.validarPermisoAPagina(request) != null) {
    		return new ModelAndView(servicioAtajo.validarPermisoAPagina(request));
    	}
    	/*-----------------------------------*/
    	
    	Asignacion asignacionReservada = servicioAsignacion.consultarAsignacionPorId(idAsignacionReservada);
    	if(asignacionReservada == null) {
			return new ModelAndView("redirect:/listaPacienteInternados");	
		}
    	
		LocalDateTime hora = LocalDateTime.now();
    	
    	if(decision == "rechazar") {
			asignacionReservada.setAutorizada(false);
		}else {
			asignacionReservada.setHoraIngreso(hora);
			asignacionReservada.setMotivoIngreso(MotivoIngreso.ENFERMO);
		}
    	
		servicioAsignacion.actualizarAsignacion(asignacionReservada);
    	
		Long idInstitucion = (long) request.getSession().getAttribute("ID");
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		
		Institucion institucionOrigen = servicioInstitucion.obtenerInstitucionPorId(asignacionReservada.getCama()
				.getSala().getSector().getPiso().getInstitucion().getId());
		
		Paciente paciente = asignacionReservada.getPaciente();
		Cama cama = asignacionReservada.getCama();
		
		String asunto;
		String msg;
		if(decision == "aceptado") {
			 asunto = "Asignación Realizada";
			 msg = "Se le informa que se ha realizado la asignación exitosamente del paciente "
				        + paciente.getApellido() + ", " + paciente.getNombre() 
				        + " (" + paciente.getTipoDocumento().getDescripcion() + ":"  + paciente.getNumeroDocumento() + ") " 
		        		+ " en la institución " + institucion.getNombre() 
				        + " ubicada en la localidad de " + institucion.getDomicilio().getLocalidad().getNombreLocalidad()
				        + " a " + Math.round(distancia) + " km de distancia "
				        + " para realizar la internación correspondiente en la cama " + cama.getDescripcion() + " "  + cama.getTipoCama().getDescripcion() 
				        + " de la sala de " + cama.getSala().getDescripcion() 
				        + " de " + cama.getSala().getTipoSala().getDescripcion() + " ."; 
			
		}else {
			 asunto = "Asignación Denegado";
			 msg = "Se le informa que han denegado la asignación del paciente "
				        + paciente.getApellido() + ", " + paciente.getNombre() 
				        + " (" + paciente.getTipoDocumento().getDescripcion() + ": "  + paciente.getNumeroDocumento() + ") " 
		        		+ " a la institución " + institucion.getNombre() 
				        + " ubicada en la localidad de " + institucion.getDomicilio().getLocalidad().getNombreLocalidad()
				        + " a " + Math.round(distancia) + " km de distancia "
				        + " para realizar la internación correspondiente en la cama " + cama.getDescripcion() + " "  + cama.getTipoCama().getDescripcion() 
				        + " de la sala de " + cama.getSala().getDescripcion() 
				        + " de " + cama.getSala().getTipoSala().getDescripcion() + " ."; 		
		}
		
		Notificacion notificacionTraslado = new Notificacion();
		notificacionTraslado.setRemitente(institucion);
		notificacionTraslado.setDestinatario(institucionOrigen);
		notificacionTraslado.setFechaHora(hora);
		notificacionTraslado.setAsunto(asunto);
		notificacionTraslado.setMsg(msg);
		servicioNotificacion.registrarNotificacion(notificacionTraslado );
		
		return new ModelAndView("redirect:/verMensajesEnviados");	
			
	}

	/*------------------------ INSTITUCIÓN RECIBE A PACIENTES -------------------------*/
	@RequestMapping("asignacionesParaRecibir")
	public ModelAndView asignacionesParaRecibir(
			
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
    	Long idInstitucion = (long) request.getSession().getAttribute("ID");
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		
		List<AsignacionDoble> traslados = servicioAsignacion.reservasARecibirPorTrasladoConAsignacionActualPorInstitucion(institucion);
		model.put("traslados", traslados);
		
		for (AsignacionDoble asignacionDoble : traslados) {
			
			Double latitud1 = asignacionDoble.getAsignacionActual().getCama().getSala().getSector().getPiso().getInstitucion().getLatitud();
			Double longitud1 = asignacionDoble.getAsignacionActual().getCama().getSala().getSector().getPiso().getInstitucion().getLongitud();
			Double latitud2 = asignacionDoble.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getLatitud();
			Double longitud2 = asignacionDoble.getAsignacionReservada().getCama().getSala().getSector().getPiso().getInstitucion().getLongitud();
			
			asignacionDoble.setDistancia(servicioMapa.calcularDistanciaEntreDosPuntos(latitud1, longitud1, latitud2, longitud2));
		}
		
		return new ModelAndView("asignacionesParaRecibir", model);
			
	}

}
