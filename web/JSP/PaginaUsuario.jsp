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
                                String fechaFin = String.format("%1$td-%1$tm-%1$tY", comp.getFechaFin());
                            %>
                            <form>    
                                <table align="center" style="width: 40%">
                                <br><tr>
                                                        <th><p>Competición</p></th>
                                                        <th><p>Asistir</p></th>
                                                        <th><p>No asistir</p></th>
                                                        <th></th>
                                                    </tr>
                                                    <tr style="text-align: left">
                                                        <td><%=nombre%></td>
                                                        <td><input type="radio" value="si" name="asistencia" id="asistencia"></td>
                                                        <td><input type="radio" value="no" name="asistencia" id="asistencia" checked ></td>
                                                        <td><input type="submit" value="Confirmar" class="boxes"/></td>
                                                    </tr> 
                                                </table></form><%
                                                }
                                            } else {%>
                                                <br><p>No hay competiciones ahora mismo</p>     
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
