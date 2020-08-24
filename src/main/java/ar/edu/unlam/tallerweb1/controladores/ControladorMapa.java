package ar.edu.unlam.tallerweb1.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Domicilio;
import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Localidad;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Partido;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioAtajo;
import ar.edu.unlam.tallerweb1.servicios.ServicioDomicilio;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioLocalidad;
import ar.edu.unlam.tallerweb1.servicios.ServicioMapa;
import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioPartido;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

@Controller
public class ControladorMapa {

	@Autowired
	ServicioAtajo servicioAtajo;
	@Autowired
	ServicioPaciente servicioPaciente;
	@Autowired
	ServicioMapa servicioMapa;
	@Autowired
	ServicioUsuario servicioUsuario;
	@Autowired
	ServicioInstitucion servicioInstitucion;
	@Autowired
	ServicioDomicilio servicioDomicilio;
	@Autowired
	ServicioLocalidad servicioLocalidad;
	@Autowired
	ServicioPartido servicioPartido;

	@RequestMapping("/mapaPaciente")
	public ModelAndView mapaPaciente(HttpServletRequest request) {
		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("mapaPaciente", model);
	}

	@RequestMapping("/validarMapa")
	public ModelAndView validarMapa(HttpServletRequest request, @RequestParam(value = "latitud") Double latitud,
			@RequestParam(value = "longitud") Double longitud, @RequestParam(value = "calle") String calle,
			@RequestParam(value = "numero") Integer numero,
			@RequestParam(value = "nombreLocalidad") String nombreLocalidad,
			@RequestParam(value = "nombrePartido") String nombrePartido) {
		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long id = (Long) request.getSession().getAttribute("ID_PACIENTE");
		Usuario usuario = servicioUsuario.consultarUsuarioPorId(id);

		usuario.setLatitud(latitud);
		usuario.setLongitud(longitud);

		Domicilio domicilio = new Domicilio();
		domicilio.setCalle(calle);
		domicilio.setNumero(numero);
		servicioDomicilio.registrarDomicilio(domicilio);
		usuario.setDomicilio(domicilio);

		Localidad localidad = new Localidad();
		Partido partido = new Partido();

		if (servicioPartido.obtenerPartidoPorNombre(nombrePartido) == null) {
			servicioPartido.registrarPartido(partido);
			partido.setNombrePartido(nombrePartido);
			localidad.setPartido(partido);
		} else {
			partido = servicioPartido.obtenerPartidoPorNombre(nombrePartido);
			localidad.setPartido(partido);
		}

		if (servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad) == null) {
			servicioLocalidad.registrarLocalidad(localidad);
			localidad.setNombreLocalidad(nombreLocalidad);
			domicilio.setLocalidad(localidad);
		} else {
			localidad = servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad);
			domicilio.setLocalidad(localidad);
		}

		servicioLocalidad.actualizarLocalidad(localidad);
		servicioDomicilio.actualizarDomicilio(domicilio);

		servicioUsuario.actualizarUsuario(usuario);

		return new ModelAndView("validarMapa", model);
	}

	@RequestMapping("/calcularDistanciaEntreDosPuntos")
	public ModelAndView calcularDistanciaEntreDosPuntos(HttpServletRequest request) {
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

		Double latitud1 = -34.70211051937402;
		Double longitud1 = -58.573554607284514;
		Double latitud2 = -34.72840647959868;
		Double longitud2 = -58.61369019379556;

		Double distancia = servicioMapa.calcularDistanciaEntreDosPuntos(latitud1, longitud1, latitud2, longitud2);

		/*
		 * List<Institucion> instituciones =
		 * servicioInstitucion.obtenerListaInstituciones();
		 * 
		 * for(int i=0; i<instituciones.size(); i++) { Double distanciaInstitucion =
		 * servicioMapa.calcularDistanticiaEntreDosPuntos(latitud1, longitud1, latitud2,
		 * longitud2) }
		 */

		model.put("distancia", distancia);

		return new ModelAndView("calcularDistanciaEntreDosPuntos", model);
	}

	@RequestMapping("/validarMapaInstitucion")
	public ModelAndView validarMapaInstitucion(HttpServletRequest request, @RequestParam(value = "latitud") Double latitud,
			@RequestParam(value = "longitud") Double longitud, @RequestParam(value = "calle") String calle,
			@RequestParam(value = "numero") Integer numero,
			@RequestParam(value = "nombreLocalidad") String nombreLocalidad,
			@RequestParam(value = "nombrePartido") String nombrePartido) {
		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		Long id = (Long) request.getSession().getAttribute("ID_INSTITUCION");
		Usuario usuario = servicioUsuario.consultarUsuarioPorId(id);

		usuario.setLatitud(latitud);
		usuario.setLongitud(longitud);

		Domicilio domicilio = new Domicilio();
		domicilio.setCalle(calle);
		domicilio.setNumero(numero);
		servicioDomicilio.registrarDomicilio(domicilio);
		usuario.setDomicilio(domicilio);

		Localidad localidad = new Localidad();
		Partido partido = new Partido();

		if (servicioPartido.obtenerPartidoPorNombre(nombrePartido) == null) {
			servicioPartido.registrarPartido(partido);
			partido.setNombrePartido(nombrePartido);
			localidad.setPartido(partido);
		} else {
			partido = servicioPartido.obtenerPartidoPorNombre(nombrePartido);
			localidad.setPartido(partido);
		}

		if (servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad) == null) {
			servicioLocalidad.registrarLocalidad(localidad);
			localidad.setNombreLocalidad(nombreLocalidad);
			domicilio.setLocalidad(localidad);
		} else {
			localidad = servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad);
			domicilio.setLocalidad(localidad);
		}

		servicioLocalidad.actualizarLocalidad(localidad);
		servicioDomicilio.actualizarDomicilio(domicilio);

		servicioUsuario.actualizarUsuario(usuario);

		return new ModelAndView("validarMapa", model);
	}

}
