package ar.edu.unlam.tallerweb1.controladores;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Rol;

import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioPaciente;

@Controller
public class ControladorTratamiento {

	@Autowired
	private ServicioPaciente servicioPaciente;
	
	@RequestMapping("tratamiento")
	public ModelAndView verTratamiento(
			
			@RequestParam Long idPaciente,
			HttpServletRequest request
			
			) {

		ModelMap model = new ModelMap();
		if (request.getSession().getAttribute("ID") == null) {
			
			model.put("error", "Debe iniciar sesión.");
			return new ModelAndView("redirect:/home", model);
		}
		
		if (request.getSession().getAttribute("ROL") == Rol.PACIENTE) {
			return new ModelAndView("redirect:/denied");
		}
		
			Usuario paciente = servicioPaciente.consultarPacientePorId(idPaciente);
			
			String nombre = paciente.getNombre();
			
			model.put("nombre", nombre);

			return new ModelAndView("tratamiento", model);
			
	}

//	@RequestMapping(path = "/denied", method = RequestMethod.GET)
//	public ModelAndView denegarAcceso() {
//		return new ModelAndView("denied");
//	}

}

