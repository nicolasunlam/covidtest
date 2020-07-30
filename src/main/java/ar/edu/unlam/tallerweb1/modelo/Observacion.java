package ar.edu.unlam.tallerweb1.modelo;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Observacion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long Id;

	private LocalDateTime hora;
	private String descripcion;

	@ManyToOne
	private Tratamiento tratamiento;

	@ManyToOne
	private EmpleadoSalud empleadoSalud;
	
	public Long getId() {
		return Id;
	}

	public void setId(Long id) {
		Id = id;
	}

	public LocalDateTime getHora() {
		return hora;
	}

	public void setHora(LocalDateTime hora) {
		this.hora = hora;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Tratamiento getTratamiento() {
		return tratamiento;
	}

	public void setTratamiento(Tratamiento tratamiento) {
		this.tratamiento = tratamiento;
	}

	public EmpleadoSalud getEmpleadoSalud() {
		return empleadoSalud;
	}

	public void setEmpleadoSalud(EmpleadoSalud empleadoSalud) {
		this.empleadoSalud = empleadoSalud;
	}

}
