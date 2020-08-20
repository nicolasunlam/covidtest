package ar.edu.unlam.tallerweb1.modelo;


public enum TipoSala {
	
	TERAPIA_INTENSIVA("Terapia Intensiva", 1), 
	TERAPIA_INTERMEDIA("Terapia Intermedia", 2), 
	TERAPIA_COMUN("Terapia común", 3),
	AISLAMIENTO("Aislamiento", 4),
	HABITACION("Habitacion", 5), 
	AULA("Aula", 5);
	
    private final String descripcion;
    private final Integer prioridad;

    private TipoSala (String descripcion, Integer prioridad) {
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
