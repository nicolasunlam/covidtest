package ar.edu.unlam.tallerweb1.modelo;


public enum TipoPiso {
	
	TIPO_PISO("Tipo de Piso");
	
    private final String descripcion;

    private TipoPiso (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
