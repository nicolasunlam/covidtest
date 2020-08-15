package ar.edu.unlam.tallerweb1.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import ar.edu.unlam.tallerweb1.modelo.*;
import ar.edu.unlam.tallerweb1.servicios.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ControladorInstitucion {

	private ServicioInstitucion servicioInstitucion;
	private ServicioCama servicioCama;
	private ServicioUsuario servicioUsuario;
	private ServicioDomicilio servicioDomicilio;
	private ServicioLocalidad servicioLocalidad;
	private ServicioPartido servicioPartido;
	private ServicioZona servicioZona;
	private ServicioAtajo servicioAtajo;
	private ServicioMapa servicioMapa;
	private ServicioPiso servicioPiso;
	private ServicioSector servicioSector;
	private ServicioSala servicioSala;
	private ServicioPaciente servicioPaciente;

	@Autowired
	public ControladorInstitucion(ServicioInstitucion servicioInstitucion, ServicioCama servicioCama,
			ServicioPaciente servicioPaciente, ServicioUsuario servicioUsuario, ServicioDomicilio servicioDomicilio,
			ServicioPartido servicioPartido, ServicioLocalidad servicioLocalidad, ServicioZona servicioZona,
			ServicioAtajo servicioAtajo, ServicioMapa servicioMapa, ServicioPiso servicioPiso,
			ServicioSector servicioSector, ServicioSala servicioSala) {

		this.servicioInstitucion = servicioInstitucion;
		this.servicioCama = servicioCama;
		this.servicioUsuario = servicioUsuario;
		this.servicioDomicilio = servicioDomicilio;
		this.servicioLocalidad = servicioLocalidad;
		this.servicioPartido = servicioPartido;
		this.servicioZona = servicioZona;
		this.servicioAtajo = servicioAtajo;
		this.servicioMapa = servicioMapa;
		this.servicioPiso = servicioPiso;
		this.servicioSector = servicioSector;
		this.servicioSala = servicioSala;
		this.servicioPaciente = servicioPaciente;
	}

	@RequestMapping("/registrarInstitucion")
	public ModelAndView registrarInstitucion(HttpServletRequest request) {

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
		// model.put("idAdmin", idAdmin);

		return new ModelAndView("registrarInstitucion", model);
	}

	@RequestMapping("/detalleRegistroInstitucion")
	public ModelAndView validarRegistroInstitucion(

			HttpServletRequest request, @ModelAttribute("usuario") Institucion institucion,
			@RequestParam(value = "calle") String calle, @RequestParam(value = "numero") Integer numero,
			@RequestParam(value = "nombreLocalidad") String nombreLocalidad,
			@RequestParam(value = "nombrePartido") String nombrePartido

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

		institucion.setTipoDocumento(TipoDocumento.CUIT);

		if (servicioUsuario.consultarUsuarioPorEmail(institucion.getEmail()) == null
				&& servicioInstitucion.consultarInstitucionPorCuit(institucion.getNumeroDocumento()) == null) {

			institucion.setRol(Rol.INSTITUCION);

			servicioInstitucion.registrarInstitucion(institucion);

			Domicilio domicilio = new Domicilio();

			domicilio.setCalle(calle);
			domicilio.setNumero(numero);
			servicioDomicilio.registrarDomicilio(domicilio);
			institucion.setDomicilio(domicilio);
			Localidad localidad = servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad);
			domicilio.setLocalidad(localidad);
			Partido partido = servicioPartido.obtenerPartidoPorNombre(nombrePartido);
			localidad.setPartido(partido);
			servicioInstitucion.actualizarInstitucion(institucion);
			servicioDomicilio.actualizarDomicilio(domicilio);
			servicioLocalidad.actualizarLocalidad(localidad);

			// Usuario admin = servicioUsuario.consultarUsuarioPorId(idAdmin);

			// request.getSession().setAttribute("ROL", admin.getRol());
			// .getSession().setAttribute("ID", idAdmin);

			return new ModelAndView("listaInstituciones", model);
		} else {

			model.put("error", "Ya existe un usuario registrado con su mail o cuit");

			return new ModelAndView("registrarInstitucion", model);
		}
	}

	@RequestMapping("/crearPiso")
	public ModelAndView crearPiso(HttpServletRequest request) {

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

		return new ModelAndView("crearPiso", model);
	}

	@RequestMapping("/registrarPiso")
	public ModelAndView registrarPiso(HttpServletRequest request,
			@RequestParam(value = "numeroPiso") Integer numeroPiso) {

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

		Institucion institucion = servicioInstitucion
				.obtenerInstitucionPorId((Long) request.getSession().getAttribute("ID"));

		Piso piso = new Piso();

		piso.setInstitucion(institucion);
		piso.setNumeroPiso(numeroPiso);

		servicioPiso.registrarPiso(piso);
		
		List<Sector> sectores = servicioSector.consultarSectoresPorPiso(piso);

		model.put("numeroPiso", numeroPiso);
		model.put("idPiso", piso.getId());
		model.put("sectores", sectores);

		return new ModelAndView("detallePiso", model);
	}
	
	@RequestMapping("/crearSector")
	public ModelAndView crearSector(HttpServletRequest request, @RequestParam(value = "idPiso") Long idPiso) {

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
		
		
		
		model.put("idPiso", idPiso);
		
		

		return new ModelAndView("crearSector", model);
	}

	@RequestMapping("/registrarSector")
	public ModelAndView registrarSector(HttpServletRequest request,
			@RequestParam(value = "tipoSector") TipoSector tipoSector, @RequestParam(value = "idPiso") Long idPiso) {

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

		Piso piso = servicioPiso.buscarPisoPorId(idPiso);
		

		Sector sector = new Sector();
		sector.setPiso(piso);
		sector.setTipoSector(tipoSector);

		servicioSector.registrarSector(sector);
		
		List <Sala> salas=servicioSala.listarSalasPorSector(sector);

	
		model.put("idSector", sector.getId());
		model.put("piso", sector.getPiso());
		model.put("tipoSector",sector.getTipoSector());
		model.put("salas", salas);

		return new ModelAndView("detalleSector", model);
	}
	
	
	@RequestMapping("/crearSala")
	public ModelAndView crearSala(HttpServletRequest request, @RequestParam(value = "idSector") Long idSector) {

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
		
		
		
		model.put("idSector", idSector);
		
		

		return new ModelAndView("crearSala", model);
	}
	
	

	@RequestMapping("/registrarSala")
	public ModelAndView registrarSala(HttpServletRequest request, @RequestParam(value = "tipoSala") TipoSala tipoSala,
			@RequestParam(value = "idSector") Long idSector) {

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

		Sector sector = servicioSector.buscarSectorPorId(idSector);

		Sala sala = new Sala();

		sala.setSector(sector);
		sala.setTipoSala(tipoSala);

		servicioSala.registrarSala(sala);

		model.put("idSala", sala.getId());
		model.put("descripcion", sala.getDescripcion());
		model.put("tipoSala",sala.getTipoSala());

		return new ModelAndView("detalleSala", model);

	}
	
	@RequestMapping("/crearCamas")
	public ModelAndView crearCamas(HttpServletRequest request, @RequestParam(value = "idSala") Long idSala) {

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
		
		
		
		model.put("idSala", idSala);
		
		

		return new ModelAndView("crearCamas", model);
	}

	@RequestMapping("crearCamaPorTipoSala")
	public ModelAndView crearCamaPorTipoSala(@RequestParam(value = "tipoCama") TipoCama tipoCama,
			@RequestParam(value = "idSala") Long idSala,
			@RequestParam(value = "cantidadDeCamas") Integer cantidadDeCamas, HttpServletRequest request) {

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

		Sala sala = servicioSala.buscarSalaPorId(idSala);

		for (int i = 0; i < cantidadDeCamas; i++) {

			Cama cama = new Cama();
			cama.setSala(sala);
			cama.setTipoCama(tipoCama);
			int numeroCama = i + 1;
			String descripcion = "" + numeroCama;
			cama.setDescripcion(descripcion);

			servicioCama.registrarCama(cama);
		}

		return new ModelAndView("confirmacion", model);
	}

	@RequestMapping("continuacionIngresoDatos")
	public ModelAndView continuacionIngresoDatos(@RequestParam(value = "eleccion") String eleccion,
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

		// String eleccion = request.getParameter("eleccion");

		model.put("eleccion", eleccion);

		switch (eleccion) {
		case "piso":
			return new ModelAndView("redirect:/registrarPiso", model);
		// break;
		case "sector":
			return new ModelAndView("redirect:/registrarSector", model);
		// break;
		case "sala":
			return new ModelAndView("redirect:/registrarSala", model);
		// break;
		case "cama":
			return new ModelAndView("redirect:/crearCamaPorTipoSala", model);
		// break;
		default:
			return new ModelAndView("confirmacionPrueba", model);
		}

//		if (eleccion == "piso") {
//			return new ModelAndView("redirect:/crearPiso", model);
//		}
//		if (eleccion == "sector") {
//			return new ModelAndView("redirect:/crearSector", model);
//			// return new ModelAndView("crearSector", model);
//		}
//		if (eleccion == "sala") {
//			return new ModelAndView("redirect:/crearSala", model);
//			// return new ModelAndView("crearSala", model);
//		}
//		if (eleccion == "camas") {
//			return new ModelAndView("redirect:/crearCamas", model);
//			// return new ModelAndView("crearCamas", model);
//		}

	}

	@RequestMapping("/listaInstituciones")
	public ModelAndView listarInstituciones(HttpServletRequest request) {

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

		List<Institucion> listaInstituciones = servicioInstitucion.obtenerListaInstituciones();

		Long idAdmin = (Long) request.getSession().getAttribute("ID");

		model.put("idAdmin", idAdmin);
		model.put("listaInstituciones", listaInstituciones);

		return new ModelAndView("listaInstituciones", model);
	}

	@RequestMapping("/pisosInstitucion")
	public ModelAndView pisosInstitucion(HttpServletRequest request) {

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

		Long idInstitucion = (Long) request.getSession().getAttribute("ID");

		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);

		List<Piso> listaPisos = servicioPiso.listarPisosPorInstitucion(institucion);
		model.put("listaPisos", listaPisos);
		
		List<Cama> listaCamasDisponibles = servicioCama.obtenerCamasDisponiblesPorInstitucion(institucion);
		model.put("listaCamasDisponibles", listaCamasDisponibles);

		return new ModelAndView("pisosInstitucion", model);
	}
	
	@RequestMapping("/listarSectoresPorPiso")
	public ModelAndView listarSectoresPorPiso(HttpServletRequest request, @RequestParam(value = "idPiso") Long idPiso) {

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

		Long idInstitucion = (Long) request.getSession().getAttribute("ID");

		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		
		Piso piso = servicioPiso.buscarPisoPorId(idPiso);

		List<Sector> listaSectoresPorPiso = servicioSector.consultarSectoresPorPiso(piso);

		model.put("listaSectoresPorPiso", listaSectoresPorPiso);

		return new ModelAndView("sectoresInstitucion", model);
	}
	
	@RequestMapping("/listarSalasPorSector")
	public ModelAndView listarSalasPorSector(HttpServletRequest request, @RequestParam(value = "idSector") Long idSector) {

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

		Long idInstitucion = (Long) request.getSession().getAttribute("ID");

		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);
		
		Sector sector = servicioSector.buscarSectorPorId(idSector);

		List<Sala> listaSalasPorSector = servicioSala.listarSalasPorSector(sector);

		model.put("listaSalasPorSector", listaSalasPorSector);

		return new ModelAndView("salasInstitucion", model);
	}

	@RequestMapping("bienvenido")
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
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(id);

		String nombre = institucion.getNombre();
		Integer camas = (int) servicioCama.obtenerCamasPorInstitucion(institucion).size();

		model.put("nombre", nombre);
		model.put("camas", camas);

		return new ModelAndView("bienvenido", model);
	}

	@RequestMapping("detalleInstitucion")
	public ModelAndView detalleInstitucion(@RequestParam(value = "idInstitucion") Long idInstitucion,
			HttpServletRequest request) {

//    	Institucion institucion =servicioInstitucion.obtenerInstitucionPorId((Long) request.getSession().getAttribute("ID"));
//    	
//    	 for (int i = 0; i < cantidadDeCamas; i++) {
//
//             Cama cama = new Cama();
//             cama.setInstitucion(institucion);
//             cama.setTipoCama(tipoCama);
//             cama.setTipoSala(tipoSala);
//             
//             
//             int numeroCama = i+1;
//             String descripcion = "" + numeroCama;
//             cama.setDescripcion(descripcion);
//
//           
//             servicioCama.registrarCama(cama);
//         }
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
		Usuario usuario = servicioUsuario.consultarUsuarioPorId(id);
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);

		Double distancia = servicioMapa.calcularDistanciaEntreDosPuntos(usuario.getLatitud(), usuario.getLongitud(),
				institucion.getLatitud(), institucion.getLongitud());

		Integer camasDisponibles = servicioCama.obtenerCamasDisponiblesPorInstitucion(institucion).size();

		Double latitudInstitucion = institucion.getLatitud();
		Double longitudInstitucion = institucion.getLongitud();
		Double latitudPaciente = usuario.getLatitud();
		Double longitudPaciente = usuario.getLongitud();

		model.put("distancia", distancia);
		model.put("nombre", institucion.getNombre());
		model.put("email", institucion.getEmail());
		model.put("calle", institucion.getDomicilio().getCalle());
		model.put("numero", institucion.getDomicilio().getNumero());
		model.put("localidad", institucion.getDomicilio().getLocalidad().getNombreLocalidad());
		model.put("camas", servicioCama.obtenerCamasPorInstitucion(institucion).size());
		model.put("camasDisponibles", camasDisponibles);
		model.put("latitudInstitucion", latitudInstitucion);
		model.put("longitudInstitucion", longitudInstitucion);
		model.put("latitudPaciente", latitudPaciente);
		model.put("longitudPaciente", longitudPaciente);

		return new ModelAndView("fichaInstitucion", model);

	}

	// Muestra imagenes de las camas
	@RequestMapping("/listarCamasDeInstitucion")
	public ModelAndView listarCamasDeInstitucion(HttpServletRequest request) {
		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long idInstitucion = (Long) request.getSession().getAttribute("ID");
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);

		List<Cama> listadoCamas = servicioCama.obtenerCamasPorInstitucion(institucion);

		Integer cantidadCamas = listadoCamas.size();

		model.put("listadoCamas", listadoCamas);
		model.put("cantidadCamas", cantidadCamas);

		return new ModelAndView("disponibilidadCamasPrueba", model);
	}
	
	// Muestra imagenes de los pisos
	@RequestMapping("/listarPisosDeInstitucion")
	public ModelAndView listarPisosDeInstitucion(HttpServletRequest request) {
		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long idInstitucion = (Long) request.getSession().getAttribute("ID");
		Institucion institucion = servicioInstitucion.obtenerInstitucionPorId(idInstitucion);

		List<Piso> listadoPisos = servicioPiso.listarPisosPorInstitucion(institucion);

		Integer cantidadPisos = listadoPisos.size();

		model.put("listadoPisos", listadoPisos);
		model.put("cantidadPisos", cantidadPisos);

		return new ModelAndView("listarPisosDeInstitucion", model);
	}

}
