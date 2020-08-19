package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Paciente;
import ar.edu.unlam.tallerweb1.modelo.Usuario;

public interface ServicioMail {
	
	public void SendEmail(String to, String subject, String path, Paciente usuario);
}