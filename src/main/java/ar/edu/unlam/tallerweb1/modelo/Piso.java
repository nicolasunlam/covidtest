package ar.edu.unlam.tallerweb1.modelo;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Piso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(cascade= CascadeType.ALL)
    private Institucion institucion;

    private String descripcion;
    
    private Integer numeroPiso;

	@Enumerated(EnumType.STRING)
    private TipoPiso tipoPiso;

    public Long getId() {
		return id;
	}
    

	public Integer getNumeroPiso() {
		return numeroPiso;
	}


	public void setNumeroPiso(Integer numeroPiso) {
		this.numeroPiso = numeroPiso;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public Institucion getInstitucion() {
		return institucion;
	}

	public void setInstitucion(Institucion institucion) {
		this.institucion = institucion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public TipoPiso getTipoPiso() {
		return tipoPiso;
	}

	public void setTipoPiso(TipoPiso tipoPiso) {
		this.tipoPiso = tipoPiso;
	}
    
}
