<%--
    Document   : PaginaAdmin
    Created on : 20-feb-2016, 12:50:15
    Author     : inakisanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de administracion</title>
        <link href="CSS/Estilo.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <%
        HttpSession s = request.getSession();
    %>
    <body>
        <header>
            <div style="text-align: center">
                <h1>Bizkaiko Igeriketa Federazioa</h1>
            </div>
        </header>
        <%
            if(s.getAttribute("logged")==null){
                %><p>No se a identificado.</p>
                <a href="../Inicio"><p>Volver a la pagina de inicio</p></a>
                <%}else{
        %>
        <section style="text-align: center">
            <h3>Bienvenido/a a tu perfil, <%=s.getAttribute("usuario")%></h3>
        </section>
        <section>
            <div class="container" style="text-align: center">
                    <ul class="nav nav-pills centered">
                        <li class="active"><a data-toggle="pill" href="#administrar">Administrar competiciones</a></li>
                        <li><a data-toggle="pill" href="#disponibles">Competiciones disponibles</a></li>
                        <li><a data-toggle="pill" href="#asistidas">Asistencia</a></li>
                        <li><a data-toggle="pill" href="#salir">Salir</a></li>
                    </ul>
                <div class="tab-content">
                    <div id="administrar" class="tab-pane fade in active">
                        <a class="bajar nav nav-tabs"><p>Añadir competición</p></a>
                        <div class="desplegable">
                            <form method="POST" action="CrearCompeti">
                                <label>Título de la competición:</label>
                                <input type="text" name="nombre" >
                                <label>Tipo de competición:</label>
                                <input type="radio" name="tipoComp">Manual<br>
                                <input type="radio" name="tipoComp">Electrónico<br>
                                <label>Número de calles:</label>
                                <input type="number" name="numCalles">
                                <label>Fecha límite de inscripción</label>
                                <input type="date" name="fechaFin">
                                <input type="submit" name="crear" value="Añadir">
                                
                            </form>
                            
                        </div>
                    </div>
                    <div id="disponibles" class="tab-pane fade">
                    
                    </div>
                    <div id="asistidad" class="tab-pane fade">
                    
                    </div>
                    <div id="salir" class="tab-pane fade">
                        <br><p>¿Está seguro de que desea salir?</p>
                        <a href="Inicio" ><p>Salir</p></a>
                        <%
                            s.setAttribute("logged", null);}
                        %>
                    </div>
                </div>
            </div>
        </section>        
    </body>
</html>
