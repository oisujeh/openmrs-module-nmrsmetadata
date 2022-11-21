/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.openmrs.module.nmrsmetadata.dao;

/**
 *
 * @author ihvn
 */

import org.openmrs.api.context.Context;

import java.sql.*;

/**
 * @author ihvn
 */
public class Database {
	
	public static Connection conn = null;
	
	public static ConnectionPool connectionPool;
	
	public static void initConnection() {
		try {
			System.out.println("initiing connection");
			
			String username = Context.getRuntimeProperties().getProperty("connection.username");//props.getProperty("connection.username");
			String password = Context.getRuntimeProperties().getProperty("connection.password");//props.getProperty("connection.password");
			String connectionUrl = Context.getRuntimeProperties().getProperty("connection.url");//props.getProperty("connection.url");
			
			connectionPool = new ConnectionPool("com.mysql.jdbc.Driver", connectionUrl, username, password, 1, 1, true);
			
		}
		catch (Exception ex) {
			ex.printStackTrace();
		}
		
	}
	
	public static void closeConnection() {
		if (connectionPool != null) {
			connectionPool.closeAllConnections();
		}
	}
	
	public static int setSQLMode(String sqlMode) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = Database.connectionPool.getConnection();
			
			String query = "SET GLOBAL sql_mode=?";
			int i = 1;
			stmt = con.prepareStatement(query);
			
			stmt.setString(i++, sqlMode);
			
			stmt.execute();
			
			return 1;
			
		}
		catch (SQLException ex) {
			Database.handleException(ex);
			return 0;
		}
		finally {
			Database.cleanUp(rs, stmt, con);
		}
	}
	
	public static void cleanUp(ResultSet rs, Statement stmt, Connection con) {
		try {
			Database.connectionPool.free(con);
			stmt.close();
			if (rs != null)
				rs.close();
			
		}
		catch (Exception ex) {
			handleException(ex);
		}
	}
	
	public static void handleException(Exception ex) {
		ex.printStackTrace();
	}
}
