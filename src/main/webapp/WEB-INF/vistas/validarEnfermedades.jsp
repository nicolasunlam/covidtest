<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../../partial/${armarHeader}1.jsp" />

<title>Inserte T�tulo Aqu�</title>
    
<jsp:include page="../../partial/${armarHeader}2.jsp" />

<h2 class="text-center">Contador: ${contador}</h2>
<h2 class="text-center">Estatura: ${estatura}</h2>
<h2 class="text-center">Peso: ${peso}</h2>
<h2 class="text-center">Categoria IMC: ${categoriaIMC}</h2>
<h2 class="text-center">Prioridad: ${prioridad}</h2>

</body>
</html>
