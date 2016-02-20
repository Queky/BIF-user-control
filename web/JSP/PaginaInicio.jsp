<%-- 
    Document   : PaginaInicio
    Created on : 20-feb-2016, 4:02:17
    Author     : inakisanchez
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BIF</title>
        <link href="CSS/Estilo.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
    <header>
        <div style="text-align: center">
            <h1>Bizkaiko Igeriketa Federazioa</h1>
        </div>
    </header>
    <section>
        <div class="container" style="text-align: center">
                <ul class="nav nav-pills centered">
                    <li class="active"><a data-toggle="pill" href="#sesion">Iniciar Sesion</a></li>
                    <li><a data-toggle="pill" href="#registro">Registrate</a></li>
                </ul>
            <div class="tab-content">
                <div id="sesion" class="tab-pane fade in active">
                    <br><p>Correo:</p><input class="boxes" type="text" id="email" placeholder="Correo" /><br>
                    <br><p>Contraseña:</p><input class="boxes" type="password" id="contrasena" placeholder="Contraseña" />
                </div>
                <div id="registro" class="tab-pane fade">
                    <br><p>Correo:</p><input class="boxes" type="text" id="email" placeholder="Correo" />
                </div>
            </div>
        </div>
    </section>
    </body>
</html>
