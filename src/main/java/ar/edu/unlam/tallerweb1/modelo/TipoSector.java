package ar.edu.unlam.tallerweb1.modelo;


public enum TipoSector {
	
	CIRUJIA("Cirujia"),
	DIALISIS("Dialisis");
	
    private final String descripcion;

    private TipoSector (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
