package ar.edu.unlam.tallerweb1.modelo;


public enum TipoSala {
	
	TERAPIA_INTENSIVA("Terapia Intensiva", 1), 
	TERAPIA_INTERMEDIA("Terapia Intermedia", 2), 
	SALA_AISLAMIENTO("Sala de Aislamiento", 3),
	HABITACION_HOTEL("Habitacion de Hotel", 5), 
	AULA_UNIVERSITARIA("Aula Universitaria", 5), 
	CLUB("Club", 5);
	
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
