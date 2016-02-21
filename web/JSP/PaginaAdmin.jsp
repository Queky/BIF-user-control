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
            %><div style="text-align: center"><p>No se a identificado.</p>
                <a href="Inicio"><p>Volver a la pagina de inicio</p></a></div>
                <%}else{
        %>
        <section style="text-align: center">
            <h3>Bienvenido/a a tu perfil, <%=s.getAttribute("usuario")%></h3>
        </section>
        <section>
            <div class="container" style="text-align: center">
                    <ul class="nav nav-pills centered">
                        <li class="active"><a data-toggle="pill" href="#anadir">Añadir competicion</a></li>
                        <li><a data-toggle="pill" href="#encurso">Competiciones en curso</a></li>
                        <li><a data-toggle="pill" href="#disponibles">Competiciones disponibles</a></li>
                        <li><a data-toggle="pill" href="#asistidas">Asistencia</a></li>
                        <li><a data-toggle="pill" href="#salir">Salir</a></li>
                    </ul>
                <div class="tab-content">
                    <div id="anadir" class="tab-pane fade in active">
                        <form method="POST" action="CrearCompeti">
                            <br><label>Nombre de la competición:</label><br>
                            <input type="text" name="nombreComp" ><br><br>
                            <label>Tipo de competición:</label><br>
                            <div style="text-align: center">
                                <input type="radio" value="manual" name="tipoComp">Manual<br>
                                <input type="radio" value="electronico" name="tipoComp">Electrónico<br><br>
                            </div>
                            <label>Número de calles:</label><br>
                            <input type="number" name="numCalles" min="0" max="10"><br><br>
                            <label>Fecha límite de inscripción</label><br>
                            <input type="date" name="fechaFin"><br><br>
                            <input type="submit" name="crear" value="Añadir"><br>
                        </form>
                    </div>
                    <div id="encurso" class="tab-pane fade">
                        <br><p>En contruccion</p>
                    </div>
                    <div id="disponibles" class="tab-pane fade">
                        <br><p>En contruccion</p>
                    </div>
                    <div id="asistidas" class="tab-pane fade">
                        <br><p>En contruccion</p>
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
