package ar.edu.unlam.tallerweb1.servicios.serviciosImpl;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Institucion;
import ar.edu.unlam.tallerweb1.modelo.Piso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioPiso;
import ar.edu.unlam.tallerweb1.servicios.ServicioPiso;

@Service("servicioPiso")
@Transactional
public class ServicioPisoImpl implements ServicioPiso {

    @Autowired
    private RepositorioPiso repositorioPiso;

    @Override
    public void registrarPiso(Piso piso) {
        repositorioPiso.registrarPiso(piso);
    }

    @Override
    public void actualizarPiso(Piso piso) {
        repositorioPiso.actualizarPiso(piso);
    }

	@Override
	public Piso buscarPisoPorId(Long id) {
		return repositorioPiso.buscarPisoPorId(id);
	}
    
    
}
