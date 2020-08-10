package ar.edu.unlam.tallerweb1.controladores;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.MotivoTraslado;
import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Rol;
import ar.edu.unlam.tallerweb1.modelo.TipoCama;
import ar.edu.unlam.tallerweb1.modelo.TipoSala;
import ar.edu.unlam.tallerweb1.servicios.ServicioAtajo;
import ar.edu.unlam.tallerweb1.servicios.ServicioInstitucion;
import ar.edu.unlam.tallerweb1.servicios.ServicioMotivoTraslado;
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

		List<Institucion> listaInstitucions = servicioInstitucion.obtenerListaInstituciones();
		model.put("listaInstitucions", listaInstitucions);
		
		return new ModelAndView("trasladarAInstitucion", model);
			
	}

}

