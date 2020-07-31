package ar.edu.unlam.tallerweb1.modelo;


public enum TipoSala {
	
	TERAPIA_INTENSIVA("Terapia Intensiva"), 
	TERAPIA_INTERMEDIA("Terapia Intermedia"), 
	SALA_AISLAMIENTO("Sala de Aislamiento"),
	HABITACION_HOTEL("Habitaciión de Hotel"), 
	AULA_UNIVERSITARIA("Aula Universitaria"), 
	CLUB("Club");
	
    private final String descripcion;

    private TipoSala (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
