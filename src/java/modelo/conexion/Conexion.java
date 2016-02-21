/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author joseba
 */

package modelo.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Clock;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import modelo.entidades.Competicion;
import modelo.entidades.Usuario;
import modelo.listas.ListaCompeticiones;
import modelo.listas.ListaUsuarios;

public class Conexion {
    
   
    private static Conexion mConexion;
    private Connection conexion;







public static Conexion getConection() {
    
    /*try{
           this.initContext = new InitialContext();
           this.ds = (DataSource)initContext.lookup("java:comp/env/jdbc/ConexionMySQL");
        }
        catch(Exception e){
            e.printStackTrace();
        } */
    if(mConexion == null){
        mConexion = new Conexion();
    }
    return mConexion;
    
}
public Connection getConexion(){
    try{
        Class.forName("com.mysql.jdbc.Driver");
        
    }catch(ClassNotFoundException e){
        e.printStackTrace();
    }
    try{
        String sUrl = "jdbc:mysql://localhost/bifdb";
        String user = "root";
        String pass = "root";
        conexion = DriverManager.getConnection(sUrl,user,pass);
    }
    catch(SQLException e)
    {
        e.printStackTrace();
    }
    return conexion; 
    
    
}






 public boolean cerrarConexion(Connection cn){
        try {
            cn.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }


 
 /*Recoge todos los usuarios de la base de datos y los inserta en una lista*/
 public ListaUsuarios getUsuarios() throws SQLException{
     /*Abrimos la conexion*/
     Connection con = this.getConexion();
     
     String sql = "SELECT * FROM USUARIOS";
    /* Ejecutamos la sentencia SQL y guardamos el resultado*/
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(sql);

    /*creamos la lista de usuarios*/
    ListaUsuarios lista = new ListaUsuarios();
    
    while(rs.next())
    {
        Usuario user = new Usuario(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getBoolean(8));
        lista.añadirUsuario(user);
    }
     cerrarConexion(con);
    return lista;
               
 }
 
 /*recoge de la base de datos sólo los usuarios que son jueces y los inserta en una lista*/
 public ListaUsuarios getJueces() throws SQLException{
     /*abrimos la conexion*/
     Connection con = this.getConexion();
     /*creamos la sentencia*/
     String sql = "SELECT * FROM USUARIOS WHERE ROL='juez'";
     /*ejecutamos la sentencia*/
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery(sql);
     
     /*creamos la lista de usuarios*/
     ListaUsuarios lista = new ListaUsuarios();
     /*añadimos los usuarios a la lista creada*/
     while(rs.next())
     {
        Usuario user = new Usuario(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getBoolean(8));
        lista.añadirUsuario(user);
     }
     cerrarConexion(con);
     return lista;   
     
 }
 
 /*recoge de la base de datos sólo los usuarios que son cronometradores y los inserta en una lista*/
 public ListaUsuarios getCrono() throws SQLException{
     /*abrimos la conexion*/
     Connection con = this.getConexion();
     /*creamos la sentencia*/
     String sql = "SELECT * FROM USUARIOS WHERE ROL='crono'";
     /*ejecutamos la sentencia*/
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery(sql);
     
     /*creamos la lista de usuarios*/
     ListaUsuarios lista = new ListaUsuarios();
     /*añadimos los usuarios a la lista creada*/
     while(rs.next())
     {
        Usuario user = new Usuario(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getBoolean(8));
        lista.añadirUsuario(user);
     }
     cerrarConexion(con);
     return lista;   
     
 }
 
 /*recoge de la base de datos sólo los usuarios que son ayudantes y los inserta en la lista*/
 public ListaUsuarios getAyudante() throws SQLException{
     /*abrimos la conexion*/
     Connection con = this.getConexion();
     /*creamos la sentencia*/
     String sql = "SELECT * FROM USUARIOS WHERE ROL='ayudante'";
     /*ejecutamos la sentencia*/
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery(sql);
     
     /*creamos la lista de usuarios*/
     ListaUsuarios lista = new ListaUsuarios();
     /*añadimos los usuarios a la lista creada*/
     while(rs.next())
     {
        Usuario user = new Usuario(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getBoolean(8));
        lista.añadirUsuario(user);
     }
     cerrarConexion(con);
     return lista;   
     
 }
 
 /*recoge de la base de datos sólo los usuarios que corresponden a la secretaría y los inserta en la lista*/
 public ListaUsuarios getSecretaria() throws SQLException{
     /*abrimos la conexion*/
     Connection con = this.getConexion();
     /*creamos la sentencia*/
     String sql = "SELECT * FROM USUARIOS WHERE ROL='secretaria'";
     /*ejecutamos la sentencia*/
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery(sql);
     
     /*creamos la lista de usuarios*/
     ListaUsuarios lista = new ListaUsuarios();
     /*añadimos los usuarios a la lista creada*/
     while(rs.next())
     {
        Usuario user = new Usuario(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getBoolean(8));
        lista.añadirUsuario(user);
     }
     cerrarConexion(con);
     return lista;   
     
 }
 
 /*recoge las competiciones de la base de datos y las guarda en una lista*/
 public ListaCompeticiones getCompeticiones() throws SQLException{
     /*abrimos la conexion*/
     Connection con = this.getConexion();
     /*creamos la sentencia*/
     String sql = "SELECT * FROM COMPETICION";
     /*ejecutamos la sentencia*/
     Statement st = con.createStatement();
     ResultSet rs = st.executeQuery(sql);
     
     /*creamos la lista de competiciones*/
     ListaCompeticiones lista = new ListaCompeticiones();
     /*añadimos las competiciones a la lista*/
     while(rs.next())
     {
         lista.añadirCompeticion(new Competicion(rs.getInt(1),rs.getString(2),rs.getDate(3)));
     }
     cerrarConexion(con);
     return lista;
 }
 
 public boolean comprobarUsuario (String usuario, String contrasena) throws SQLException{
    //Abrimos la conexion
    Connection con = this.getConexion();
    //Creamos la sentencia
    String query = "select email, contraseña from usuarios where email='"+usuario+"' and contraseña='"+contrasena+"' ;";
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(query);
    if(!rs.next()){
        cerrarConexion(con);
        return false;
    }
    else{
        cerrarConexion(con);
        return true;
    }
 }
 
 public String obtenerNombre (String usuario) throws SQLException {
    Connection con = this.getConexion();
    String query = "select nombre from usuarios where email= '"+usuario+"'";
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(query);
    rs.first();
    String nombre = rs.getString("nombre");
    cerrarConexion(con);
    return nombre;
 }

    public boolean esAdmin(String usuario) throws SQLException {
    
        Connection con = this.getConexion();
        String query = "select esadmin from usuarios where email= '"+usuario+"'";
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        rs.first();
        boolean esadmin = rs.getBoolean("esadmin");
        cerrarConexion(con);
        return esadmin;
    }

    public void anyadirCompeticion(String nombreComp, String tipoComp, int numCalles, String fechaFin) throws SQLException {
        Connection con = this.getConexion();
        String query = "insert into competicion values ('"+nombreComp+"', '"+fechaFin+"', '"+tipoComp+"', '"+numCalles+"') ";
        Statement st = con.createStatement();
        st.execute(query);
        cerrarConexion(con);
    }
}