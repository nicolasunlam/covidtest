package ar.edu.unlam.tallerweb1.modelo;

public enum MotivoTraslado {
	
	FALTA_DE_MAQUINARIA("Falta de maquinaria"), 
	DESEO_PERSONAL("Deseo Personal"), 
	DESEO_FAMILIAR("Deseo Familiar"), 
	OTRO("Otro");
	
    private final String descripcion;

    private MotivoTraslado (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
