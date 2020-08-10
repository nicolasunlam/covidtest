package ar.edu.unlam.tallerweb1.modelo;

//Para creaci�n de Instituci�n.
public enum TipoInstitucion {
	
	CLUB("Club"), 
	UNIVERSIDAD("Universidad"), 
	HOSPITAL("Hospital"), 
	HOTEL("Hotel");
	
    private final String descripcion;

    private TipoInstitucion (String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

}
