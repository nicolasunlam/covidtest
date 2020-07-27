


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">


            <div class="container">
            
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h4 class="h4">Detalle Paciente</h4>
            </div>

                <div>

				<h6>Nombre del Paciente: ${paciente.getApellido()}, ${paciente.getNombre()}</h6>
			
				<h6 class="">Documento: ${paciente.getNumeroDocumento()} (${paciente.getTipoDocumento().name()})</h6>
			
				<h6 class="">Correo electrónico: ${paciente.getEmail()}</h6>

                    <br>

                    <a href="" class="btn btn-sm btn-outline-secondary">Internar</a>

                    <a href="" class="btn btn-sm btn-outline-secondary">Egresar</a>
                    <br><br>

                    <a href="consultarPaciente" class="btn btn-sm btn-outline-secondary">Volver atrás</a>
                    
                    <a href="bienvenido" class="btn btn-sm btn-outline-secondary">Inicio</a>

                </div>


                <div class="form-group">

                    <c:if test="${not empty error}">
                    <h4><span>${error}</span></h4>
                    <br>
                </div>
                </c:if>

            </div>
    </div>


    </main>

