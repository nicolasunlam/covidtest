package ar.edu.unlam.tallerweb1.modelo;

public enum MotivoEgreso {
	
	CURADO("Curado"), 
	TRASLADADO("Trasladado"), 
	FALLECIDO("Fallecido");
	
    private final String descripcion;

    private MotivoEgreso (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
