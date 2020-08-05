package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.modelo.Cama;
import ar.edu.unlam.tallerweb1.modelo.Domicilio;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Localidad;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Partido;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.TipoDocumento;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.modelo.listas.PacienteDistancia;
import ar.edu.unlam.tallerweb1.servicios.ServicioAtajo;
import ar.edu.unlam.tallerweb1.servicios.ServicioCama;
import ar.edu.unlam.tallerweb1.servicios.ServicioDomicilio;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioLocalidad;
import ar.edu.unlam.tallerweb1.servicios.ServicioMail;
import ar.edu.unlam.tallerweb1.servicios.ServicioMapa;
import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioPartido;
import ar.edu.unlam.tallerweb1.servicios.ServicioTest;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ControladorPaciente {

	@Autowired
	ServicioMail servicioMail;
	@Autowired
	ServicioPaciente servicioPaciente;
	@Autowired
	ServicioCama servicioCama;
	@Autowired
	ServicioAtajo servicioAtajo;
	@Autowired
	ServicioUsuario servicioUsuario;
	@Autowired
	ServicioDomicilio servicioDomicilio;
	@Autowired
	ServicioLocalidad servicioLocalidad;
	@Autowired
	ServicioPartido servicioPartido;
	@Autowired
	ServicioTest servicioTest;
	@Autowired
	ServicioInstitucion servicioInstitucion;
	@Autowired
	ServicioMapa servicioMapa;

	
	/* Pantalla de bienvenido al paciente cuando inicia sesiÃ³n */
	@RequestMapping("bienvenidoPaciente")
	public ModelAndView irAbienvenido(HttpServletRequest request) {

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

		Long id = (Long) request.getSession().getAttribute("ID");
		if (servicioPaciente.consultarPacientePorId(id) == null) {
			return new ModelAndView("redirect:/login");
		}
		Paciente paciente = servicioPaciente.consultarPacientePorId(id);
		String nombre = paciente.getNombre();

		model.put("nombre", nombre);

		return new ModelAndView("bienvenidoPaciente", model);
	}

	@RequestMapping("/registrarPaciente")
	public ModelAndView registrarPaciente(HttpServletRequest request) {

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

		return new ModelAndView("registrarPaciente", model);
	}

	@RequestMapping("/detalleRegistroPaciente")
	public ModelAndView validarRegistroPaciente(

			@ModelAttribute("paciente") Paciente paciente, HttpServletRequest request
	/*
	 * @RequestParam(value = "calle") String calle,
	 * 
	 * @RequestParam(value = "numero") Integer numero,
	 * 
	 * @RequestParam(value = "nombreLocalidad") String nombreLocalidad,
	 * 
	 * @RequestParam(value = "nombrePartido") String nombrePartido
	 */

	) {

		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		if (paciente == null) {
			return new ModelAndView("redirect:/denied");
		}

		if (servicioUsuario.consultarUsuarioPorEmail(paciente.getEmail()) == null && servicioPaciente
				.consultarPacientePorDoc(paciente.getNumeroDocumento(), paciente.getTipoDocumento()) == null) {

			paciente.setPosibleInfectado(true);
			paciente.setRol(Rol.PACIENTE);

			servicioPaciente.registrarPaciente(paciente);

			// request.getSession().setAttribute("ROL", paciente.getRol());

			String nombre = paciente.getNombre();
			String documento = paciente.getNumeroDocumento();
			String email = paciente.getEmail();
			TipoDocumento tipoDocumento = paciente.getTipoDocumento();

			Paciente pacienteBuscado = servicioPaciente.consultarPacientePorDoc(documento, tipoDocumento);
			// Cambiar, posiblemente, a ID_USUARIO
			request.getSession().setAttribute("ID_PACIENTE", pacienteBuscado.getId());

			model.put("nombre", nombre);
			model.put("documento", documento);
			model.put("tipoDocumento", tipoDocumento);
			model.put("email", email);

			/*
			 * Domicilio domicilio = new Domicilio(); domicilio.setCalle(calle);
			 * domicilio.setNumero(numero); servicioDomicilio.registrarDomicilio(domicilio);
			 * paciente.setDomicilio(domicilio); Localidad localidad =
			 * servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad);
			 * domicilio.setLocalidad(localidad); Partido partido =
			 * servicioPartido.obtenerPartidoPorNombre(nombrePartido);
			 * localidad.setPartido(partido); servicioPaciente.actualizarPaciente(paciente);
			 * servicioDomicilio.actualizarDomicilio(domicilio);
			 * servicioLocalidad.actualizarLocalidad(localidad);
			 */

			String path = "http://localhost:" + request.getLocalPort();
			servicioMail.SendEmail(paciente.getEmail(), "Confirmación de registro: AsignAr" + paciente.getNombre(),
					path);

			return new ModelAndView("enfermedades", model);
		} else {

			model.put("error", "Ya existe un usuario registrado con su mail o documento");

			return new ModelAndView("registrarPaciente", model);
		}
	}

	/* Consultar paciente por Nro y Tipo de Documento */
	@RequestMapping("/consultarPaciente")
	public ModelAndView consultarPaciente(HttpServletRequest request) {

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

		Paciente paciente = new Paciente();
		model.put("paciente", paciente);

		return new ModelAndView("consultarPaciente", model);
	}

	/* Detalle por consultar paciente por Nro y Tipo de Documento */
	@RequestMapping(path = "/detalle", method = RequestMethod.POST)
	public ModelAndView validarConsulta(

			@ModelAttribute("paciente") Paciente paciente, HttpServletRequest request) {

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

		paciente = servicioPaciente.consultarPacientePorDoc(paciente.getNumeroDocumento(), paciente.getTipoDocumento());

		if (paciente != null) {

			model.put("paciente", paciente);
			model.put("detalleVista", "detallePaciente");

			return new ModelAndView("detalle", model);
		}

		model.put("error", "No existe el paciente");

		return new ModelAndView("consultarPaciente", model);
	}

	@RequestMapping("/listaPacientes")
	public ModelAndView pacientes(HttpServletRequest request) {

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

		List<Paciente> pacientes = servicioPaciente.pacientes();

		model.put("listaPacientes", pacientes);

		return new ModelAndView("listaPacientes", model);
	}

	@RequestMapping("/grafico-pacientes")
	public ModelAndView graficoPacientes(HttpServletRequest request) {

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

		Integer cantidadPacientes = servicioPaciente.pacientes().size();
		Integer cantidadPacientesInfectados = servicioPaciente.pacientesInfectados().size();
		Integer cantidadPacientesNoInfectados = cantidadPacientes - cantidadPacientesInfectados;

		List<Cama> camasOcupadas = servicioCama.obtenerTotalDeCamasOcupadas();
		Integer cantidadCamasOcupadas = camasOcupadas.size();

		List<Cama> camasDisponibles = servicioCama.obtenerTotalDeCamasDisponibles();
		Integer cantidadCamasDisponibles = camasDisponibles.size();

		model.put("cantidadPacientes", cantidadPacientes);
		model.put("cantidadPacientesInfectados", cantidadPacientesInfectados);
		model.put("cantidadPacientesNoInfectados", cantidadPacientesNoInfectados);
		model.put("cantidadCamasOcupadas", cantidadCamasOcupadas);
		model.put("cantidadCamasDisponibles", cantidadCamasDisponibles);

		return new ModelAndView("grafico-pacientes", model);
	}

	@RequestMapping("/mapa-paciente")
	public ModelAndView mapaPaciente(HttpServletRequest request) {

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

		return new ModelAndView("detalleRegistroPaciente", model);
	}

	@RequestMapping("/posiblesinfectados")
	public ModelAndView posiblesinfectados(HttpServletRequest request) {

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

		List<Paciente> posiblesInfectados = servicioPaciente.posiblesInfectados();

		Boolean admin = false;
		if (request.getSession().getAttribute("ROL") == Rol.ADMIN) {
			admin = true;
		}

		model.put("posiblesInfectados", posiblesInfectados);
		model.put("admin", admin);

		return new ModelAndView("posiblesinfectados", model);
	}

	@RequestMapping("/listaPacientesInfectados")
	public ModelAndView listaPacientesInfectados(

			HttpServletRequest request

	) {

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

		List<Paciente> listaPacientesInfectados = servicioPaciente.pacientesInfectados();

		model.put("listaPacientesInfectados", listaPacientesInfectados);

		return new ModelAndView("listaPacientesInfectados", model);
	}

	@RequestMapping("/listaPacientesInfectadosPasoDos")
	public ModelAndView listaPacientesInfectadosPasoDos(

			@RequestParam(value = "idCama") Long idCama, HttpServletRequest request

	) {

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

		Cama cama = servicioCama.consultarCamaPorId(idCama);
		List<Paciente> listaPacientesInfectados = servicioPaciente.pacientesInfectados();

		model.put("cama", cama);
		model.put("listaPacientesInfectados", listaPacientesInfectados);

		return new ModelAndView("listaPacientesInfectadosPasoDos", model);
	}

	@RequestMapping("/listaPacientesInternados")
	public ModelAndView listaPacientesInternados(

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

		List<Paciente> listaPacientesInternados = new ArrayList<Paciente>();

		if (request.getSession().getAttribute("ROL") == Rol.ADMIN) {
			listaPacientesInternados = servicioPaciente.pacientesInternados();
		}

		if (request.getSession().getAttribute("ROL") == Rol.INSTITUCION) {
			Long id = (long) request.getSession().getAttribute("ID");
			listaPacientesInternados = servicioPaciente.pacientesInternadosPorInstitucion(id);
		}

		Boolean admin = false;
		if (request.getSession().getAttribute("ROL") == Rol.ADMIN) {
			admin = true;
		}

		model.put("admin", admin);
		model.put("listaPacientesInternados", listaPacientesInternados);

		return new ModelAndView("listaPacientesInternados", model);
	}

	@RequestMapping("/listaPacientesInternadosDeInstitucion")
	public ModelAndView listaPacientesInternadosDeInstitucion(

			HttpServletRequest request, @RequestParam(value = "idInstitucion") Long idInstitucion) {

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

		List<Paciente> listaPacientesInternadosDeInstitucion = new ArrayList<Paciente>();

		listaPacientesInternadosDeInstitucion = servicioPaciente.pacientesInternadosPorInstitucion(idInstitucion);

		model.put("listaPacientesInternados", listaPacientesInternadosDeInstitucion);

		return new ModelAndView("listaPacientesInternadosDeInstitucion", model);
	}

	@RequestMapping("/listapacientes2")
	public ModelAndView listapacientes2(HttpServletRequest request) {

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

		List<Paciente> pacientes = servicioPaciente.pacientes();

		model.put("listaPacientes", pacientes);

		return new ModelAndView("listapacientes2", model);
	}
	
	@RequestMapping("/pacienteDistancia")
	public ModelAndView pacienteDistancia (HttpServletRequest request) {
		
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
		
		
		
		List<Institucion> instituciones=servicioInstitucion.obtenerListaInstituciones();
		Long id = (long) request.getSession().getAttribute("ID");
		Usuario usuario=servicioUsuario.consultarUsuarioPorId(id);
		ArrayList <PacienteDistancia> listaPacienteDistancia=new ArrayList<>();
		
		
	    for(int i = 0; i < instituciones.size(); ++i) {

			Double latitudInstitucion = instituciones.get(i).getLatitud();
			Double longitudInstitucion = instituciones.get(i).getLongitud();
			Double latitudPaciente = usuario.getLatitud();
			Double longitudPaciente =usuario.getLongitud();
			
		
			Double distancia = servicioMapa.calcularDistanciaEntreDosPuntos(latitudInstitucion, longitudInstitucion, latitudPaciente, longitudPaciente);
	    	PacienteDistancia pacienteDistancia=new PacienteDistancia(usuario,distancia);
	    	
	    	listaPacienteDistancia.add(pacienteDistancia);
	        model.put("nombre"+i,instituciones.get(i).getNombre());
	        model.put("distancia"+i,distancia);
	        model.put("id"+i,instituciones.get(i).getId());

		    model.put("listaInstituciones", listaPacienteDistancia);
	        }
	  	
	    
	     
	    
		
		return new ModelAndView("pacienteDistancia", model);
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	/* ----- Getters and Setters ----- */
	public ServicioPaciente getServicioPaciente() {
		return servicioPaciente;
	}

	public void setServicioPaciente(ServicioPaciente servicioPaciente) {
		this.servicioPaciente = servicioPaciente;
	}

	public ServicioCama getServicioCama() {
		return servicioCama;
	}

	public void setServicioCama(ServicioCama servicioCama) {
		this.servicioCama = servicioCama;
	}

	public ServicioLocalidad getServicioLocalidad() {
		return servicioLocalidad;
	}

	public void setServicioLocalidad(ServicioLocalidad servicioLocalidad) {
		this.servicioLocalidad = servicioLocalidad;
	}

	public ServicioMail getServicioMail() {
		return servicioMail;
	}

	public void setServicioMail(ServicioMail servicioMail) {
		this.servicioMail = servicioMail;
	}

	public ServicioAtajo getServicioAtajo() {
		return servicioAtajo;
	}

	public void setServicioAtajo(ServicioAtajo servicioAtajo) {
		this.servicioAtajo = servicioAtajo;
	}

	public ServicioUsuario getServicioUsuario() {
		return servicioUsuario;
	}

	public void setServicioUsuario(ServicioUsuario servicioUsuario) {
		this.servicioUsuario = servicioUsuario;
	}

	public ServicioDomicilio getServicioDomicilio() {
		return servicioDomicilio;
	}

	public void setServicioDomicilio(ServicioDomicilio servicioDomicilio) {
		this.servicioDomicilio = servicioDomicilio;
	}

	public ServicioPartido getServicioPartido() {
		return servicioPartido;
	}

	public void setServicioPartido(ServicioPartido servicioPartido) {
		this.servicioPartido = servicioPartido;
	}

	public ServicioTest getServicioTest() {
		return servicioTest;
	}

	public void setServicioTest(ServicioTest servicioTest) {
		this.servicioTest = servicioTest;
	}

	public ServicioInstitucion getServicioInstitucion() {
		return servicioInstitucion;
	}

	public void setServicioInstitucion(ServicioInstitucion servicioInstitucion) {
		this.servicioInstitucion = servicioInstitucion;
	}
	
}

