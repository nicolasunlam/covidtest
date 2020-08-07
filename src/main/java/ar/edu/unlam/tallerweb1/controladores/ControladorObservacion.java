package ar.edu.unlam.tallerweb1.controladores;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;

@Controller
public class ControladorObservacion {


	@Autowired
	private ServicioPaciente servicioPaciente;
	@Autowired
	private ServicioUsuario servicioUsuario;
	
	
	@RequestMapping("realizarObservacion")
	public ModelAndView realizarObservacion(HttpServletRequest request) {

		ModelMap model = new ModelMap();

		return new ModelAndView("tratamiento", model);	
	}
	
	@RequestMapping("detalleObservacion")
	public ModelAndView detalleObservacion(
			
			@RequestParam Long idPaciente,
			@RequestParam String descripcion,
			HttpServletRequest request
			
			) {

		ModelMap model = new ModelMap();
		
//		Long idUsuario = (long) request.getSession().getAttribute("ID");
//		EmpleadoSalud empleadoSalud = servicioEmpleadoSalud.consultarUsuarioPorId(idUsuario);
//	
//		Usuario paciente = servicioPaciente.consultarPacientePorId(idPaciente);
//		Tratamiento tratamiento = servicioTratamiento.consultarTratamientoPorIdDePaciente(idPaciente);
//		
//		Observacion observacion = new Observacion();
//		
//		LocalDateTime hora = LocalDateTime.now();
//		observacion.setHora(hora);
//		observacion.setDescripcion(descripcion);
//		observacion.setEmpleadoSalud(empleadoSalud);
//		observacion.setTratamiento(tratamiento);
//		
//		servicioObservacion.guardarObservacion(observacion);
//
//		model.put("tratamiento", tratamiento);
//		model.put("paciente", paciente);

		return new ModelAndView("detalleObservacion", model);
	}
	
}

