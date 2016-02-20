<%-- 
    Document   : PaginaUsuario
    Created on : 20-feb-2016, 12:12:25
    Author     : inakisanchez
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.entidades.Competicion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.conexion.Conexion"%>
<%@page import="modelo.listas.ListaCompeticiones"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tu pagina</title>
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
            <div class="cabecera">
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
            <h3>Bienvenido/a a tu perfil, <%=s.getAttribute("usuario") %></h3>
        </section>
        <section>
            <div class="container" style="text-align: center">
                    <ul class="nav nav-pills centered">
                        <li class="active"><a data-toggle="pill" href="#disponibles">Competiciones disponibles</a></li>
                        <li><a data-toggle="pill" href="#asistidas">Asistencia</a></li>
                        <li><a data-toggle="pill" href="#salir">Salir</a></li>
                    </ul>
                <div class="tab-content">
                    <div id="disponibles" class="tab-pane fade in active">
                        <%
                        Conexion con = new Conexion();
                        ListaCompeticiones ls = con.getCompeticiones();
                        
                        if(ls.tamanioLista() > 0)
                        {
                            ArrayList<Competicion> al = ls.getCompeticiones();
                            Iterator<Competicion> it = al.iterator();
                            
                            while(it.hasNext())
                            {
                                Competicion comp = it.next();
                                String nombre = comp.getNombre();
                                int numJornadas = comp.getNumJornadas();
                                String fechaFin = String.format("%1$td-%1$tm-%1$tY", comp.getFechaFin());
                            %>
                                                <table class="tabla-pisos table-responsive" align="center">
                                                    <tr class="tabla-tr">
                                                        <th>Competición</th>
                                                        <th>Jornadas</th>
                                                        <th>Fecha límite</th>
                                                        <th>Acción</th>
                                                    </tr>
                                                    <tr>
                                                        <td><%=nombre%></td>
                                                        <td><%=numJornadas%></td>
                                                        <td><%=fechaFin%></td>
                                                        <td><form method="post" action=""><input type="radio" name="asistencia" value="No" checked >No asistir <br><input type="radio" name="asistencia" value="Si"> Asistir</form></td>
                                                    </tr> 
                                                </table><%
                                                
                                                }
                                            } else {%>
                                               <h4 class="titu-gestion-reservas">No hay competiciones ahora mismo</h4>     
                                           <% 
                                            }
                        %>
                        
                    </div>
                    <div id="asistidas" class="tab-pane fade">
                    </div>
                    <div id="salir" class="tab-pane fade">
                        <br><p>¿Está seguro de que desea salir?</p>
                        <a href="Inicio" ><p>Salir</p></a>
                        <%
                            s.setAttribute("logged", null);
                        %>
                    </div>
                </div>
            </div>
        </section> 
        <%
            }
        %>
    </body>
</html>
