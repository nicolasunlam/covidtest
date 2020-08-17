package ar.edu.unlam.tallerweb1.modelo;

public enum MotivoIngreso {
	
	TRASLADO("Traslado"), 
	ENFERMO("Enfermo");
	
    private final String descripcion;

    private MotivoIngreso (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
