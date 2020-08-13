package ar.edu.unlam.tallerweb1.modelo;

public enum TipoDocumento {
	
	DNI("D.N.I"), 
	LIBRETA_CIVICA("Libreta Cívica"), 
	PASAPORTE("Pasaporte"), 
	CUIT("C.U.I.T");
	
    private final String descripcion;

    private TipoDocumento (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }
}
