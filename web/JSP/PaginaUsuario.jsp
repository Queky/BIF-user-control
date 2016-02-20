<%-- 
    Document   : PaginaUsuario
    Created on : 20-feb-2016, 12:12:25
    Author     : inakisanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tu pagina</title>
        <link href="../CSS/Estilo.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="../CSS/bootstrap.min.css">
        <script src="../js/jquery.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <div style="text-align: center">
                <h1>Bizkaiko Igeriketa Federazioa</h1>
            </div>
        </header>
        <section style="text-align: center">
            <h3>Bienvenido/a a tu perfil,</h3>
        </section>
        <section>
            <div class="container" style="text-align: center">
                    <ul class="nav nav-pills centered">
                        <li class="active"><a data-toggle="pill" href="#disponibles">Competiciones disponibles</a></li>
                        <li><a data-toggle="pill" href="#asistidas">Competiciones asistidas</a></li>
                    </ul>
                <div class="tab-content">
                    <div id="disponibles" class="tab-pane fade in active">
                    </div>
                    <div id="asistidas" class="tab-pane fade">
                    </div>
                </div>
            </div>
        </section>        
    </body>
</html>