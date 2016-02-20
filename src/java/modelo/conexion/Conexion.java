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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import javax.naming.InitialContext;

public class Conexion {
    
    private static Conexion conexion = new Conexion();
    InitialContext initContext;
    DataSource ds;
    


public Conexion(){
    abrirConexion();
}


public static Conexion getConexion(){
    if(conexion == null) {
           conexion = new Conexion();
      }
    return conexion;
}

public void abrirConexion(){
    
    try{
           this.initContext = new InitialContext();
           this.ds = (DataSource)initContext.lookup("java:comp/env/jdbc/ConexionMySQL");
        }
        catch(Exception e){
            e.printStackTrace();
        } 
    
    
}



public Connection getConnection(){
        Connection cn;
        try {
            cn = this.ds.getConnection();
            return cn;
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }       
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


 
 
 public String datos(){
     Connection conexion = getConnection();
     
     String sql = "SELECT * FROM USUARIOS";
            /* Ejecutamos la sentencia SQL y guardamos el resultado*/
            Statement stmt = conexion.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            /* Comprobamos de que el usuario exista */
            if (!rs.next() ) {
                cerrarConexion(conexion);
                return null;
            }
             
             
     return dato;
 }



}