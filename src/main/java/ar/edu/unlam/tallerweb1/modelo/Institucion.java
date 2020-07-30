package ar.edu.unlam.tallerweb1.modelo;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Institucion extends Usuario{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
    private Integer cantidadCamas;
    
    @Enumerated(EnumType.STRING)
    private TipoInstitucion tipo;
	
	
	public TipoInstitucion getTipo() {
		return tipo;
	}

	public void setTipo(TipoInstitucion tipo) {
		this.tipo = tipo;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getCantidadCamas() {
		return cantidadCamas;
	}

	public void setCantidadCamas(Integer cantidadCamas) {
		this.cantidadCamas = cantidadCamas;
	}



}
