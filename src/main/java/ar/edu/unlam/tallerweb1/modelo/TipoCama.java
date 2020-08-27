package ar.edu.unlam.tallerweb1.modelo;

public enum TipoCama {

	FIJA("Fija", 5),
	ARTICULADA_MANUAL("Articulada manual", 3),
	ARTICULADA_ELECTRICA("Articulada electrica", 1);
	
    private final String descripcion;
    private final Integer prioridad;

    private TipoCama (String descripcion, Integer prioridad) {
        this.descripcion = descripcion;
        this.prioridad = prioridad;
    }

    public String getDescripcion() {
        return descripcion;
    }

	public Integer getPrioridad() {
		return prioridad;
	}
	
}
