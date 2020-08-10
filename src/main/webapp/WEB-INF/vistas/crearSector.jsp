<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Disponibilidad De Camas</title>
    
<jsp:include page="../../partial/${armarHeader}2.jsp" />

<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">


<div class="container">

    
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h4>Registrar sector</h4>

    </div>
    
        <div>

            <form action="registrarSector" method="POST"  role="form"
                  class="contactForm">

              

                <div class="form-group">
                    <label for="descripcion" class="h6 my-3">Descripcion<span
                            class="text-primary font-weight-bold">*</span></label>
                    <input type="text" name="descripcion" class="form-control br-radius-zero" id="descripcion"
                           placeholder="Ingrese descripcion" data-rule="minlen:1"
                           data-msg="Ingrese descripcion valido"/>
                    <div class="validation"></div>
                </div>
                
                    <input type="hidden" value="${idPiso}" name="idPiso">
                    
                    
                    
                <div class="form-group">
                    <label for="tipoSector" class="h6 my-3">Tipo de sector <span
                            class="text-primary font-weight-bold">*</span></label>
                    <select name="tipoSector" id="tipoSector" class="form-control br-radius-zero"
                            required onchange="ShowSelected();">
                        <option id="tipoSectorCIRUJIA" value="CIRUJIA" >Sector cirujia
                        <option id="tipoSectorDIALISIS" value="DIALISIS"  >Sector dialisis
                       
                        
                    </select>
                </div>
                
                
       

               

              

                <br>
                <div class="form-action">
                    <button type="submit" class="btn btn-outline-secondary">
                        Registrar sector
                    </button>
                </div>
                <br>
                <div class="form-group">
                    <c:if test="${not empty error}">
                    <h6><span>${error}</span></h6>
                    <br>
                </div>
                </c:if>

            </form>

        </div>
    </div>


</body>
</html>