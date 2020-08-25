package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.modelo.Localidad;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Partido;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.servicios.ServicioAtajo;
import ar.edu.unlam.tallerweb1.servicios.ServicioLocalidad;
import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioTest;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ControladorPermiso {

	@Autowired
	ServicioPaciente servicioPaciente;
	@Autowired
	ServicioAtajo servicioAtajo;
	@Autowired
	ServicioLocalidad servicioLocalidad;
	@Autowired
	ServicioTest servicioTest;
	@Autowired
	ServicioUsuario servicioUsuario;

	@RequestMapping("/generarPermiso")
	public ModelAndView generarPermiso(HttpServletRequest request,
			@RequestParam(value = "idPaciente", required = false) Long idPaciente) {

		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}

		if (idPaciente == -1) {
			model.put("usuarioNoRegistrado", true);
		} else {
			if (rol.name() == "PACIENTE") {
				Paciente paciente = servicioPaciente.consultarPacientePorId(idPaciente);

				if (paciente.getInfectado() == null || paciente.getPosibleInfectado() == null) {
					model.put("otorgarPermiso", true);
				} else {
					model.put("otorgarPermiso", false);
				}
			}
		}

		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("generarPermiso", model);

	}

	@RequestMapping(value = "/validarPermiso", method = RequestMethod.POST)
	public ModelAndView validarPermiso(HttpServletRequest request,
			@RequestParam(value = "nombre", required = false) String nombre,
			@RequestParam(value = "apellido", required = false) String apellido,
			@RequestParam(value = "edad", required = false) Integer edad,
			@RequestParam(value = "tipoDocumento", required = false) String tipoDocumento,
			@RequestParam(value = "numeroDocumento", required = false) Integer numeroDocumento,
			@RequestParam(value = "numeroCalle", required = false) Integer numeroCalle,
			@RequestParam(value = "calle", required = false) String calle,
			@RequestParam(value = "nombreLocalidad") String nombreLocalidad,
			@RequestParam(value = "telefono", required = false) Integer telefono,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "motivo", required = false) String motivo) {

		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		if (servicioTest.realizarPermiso(nombre, apellido, edad, tipoDocumento, numeroDocumento, motivo)) {

			Localidad localidad = servicioLocalidad.obtenerLocalidadPorNombre(nombreLocalidad);
			Partido partido = localidad.getPartido();
			String nombrePartido = partido.getNombrePartido();

			model.put("nombre", nombre);
			model.put("apellido", apellido);
			model.put("edad", edad);
			model.put("tipoDocumento", tipoDocumento);
			model.put("numeroDocumento", numeroDocumento);
			model.put("nombreLocalidad", nombreLocalidad);
			model.put("nombrePartido", nombrePartido);
			model.put("calle", calle);
			model.put("numeroCalle", numeroCalle);
			model.put("telefono", telefono);
			model.put("email", email);
			model.put("motivo", motivo);
			return new ModelAndView("permisoAceptado", model);
		} else {
			return new ModelAndView("permisoDenegado", model);
		}

	}

	@RequestMapping("/permisoPositivo")
	public ModelAndView permisoPositivo(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("permisoAceptado", model);

	}

	@RequestMapping("/permisoDenegado")
	public ModelAndView permisoDenegado(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		Rol rol = (Rol) request.getSession().getAttribute("ROL");
		if (rol != null) {
			model.put("rol", rol.name());
		}
		model.put("armarHeader", servicioAtajo.armarHeader(request));

		return new ModelAndView("permisoDenegado", model);

	}
}
