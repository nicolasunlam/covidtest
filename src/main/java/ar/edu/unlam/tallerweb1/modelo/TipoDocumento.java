package ar.edu.unlam.tallerweb1.modelo;

public enum TipoDocumento {
	
	DNI("Documento Nacional de Identidad"), 
	LIBRETA_CIVICA("Libreta Cívica"), 
	PASAPORTE("Pasaporte"), 
	CUIT("Clave Única de Identificación Tributaria");
	
    private final String descripcion;

    private TipoDocumento (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
