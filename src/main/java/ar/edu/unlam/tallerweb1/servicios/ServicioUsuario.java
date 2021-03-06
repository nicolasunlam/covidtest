package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Usuario;

public interface ServicioUsuario {

	public Usuario consultarUsuarioPorEmail(String email);

	public Usuario consultarUsuarioPorId(Long id);

	void actualizarUsuario(Usuario usuario);

}
