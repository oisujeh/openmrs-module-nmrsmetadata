/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.openmrs.module.nmrsmetadata.dbmanager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NdrDBManager {
	
	Connection conn = null;
	
	PreparedStatement pStatement1 = null;
	
	Statement pStatement = null;
	
	ResultSet rs = null;
	
	CallableStatement stmt = null;
	
	private ResultSet resultSet = null;
	
	private String sql;
	
	private ResultSet rs2 = null;
	
	public NdrDBManager() {
		
	}
	
	public void openConnection() throws SQLException {
		DBConnection openmrsConn = Utils.getNmrsConnectionDetails();
		
		conn = DriverManager.getConnection(openmrsConn.getUrl(), openmrsConn.getUsername(), openmrsConn.getPassword());
	}
	
	public void closeConnection() {
		try {
			if (conn != null) {
				conn.close();
			}
			if (pStatement != null) {
				pStatement.close();
			}
			if (pStatement1 != null) {
				pStatement1.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (rs2 != null) {
				rs2.close();
			}
		}
		catch (Exception ex) {
			
		}
	}
	
	public int getTotalRecentCasesByQtr(String startdate, String enddate) {
		int result = 0;
		try {
			
			pStatement = conn.createStatement();
			rs = pStatement.executeQuery("SELECT COUNT(*) as total FROM obs o JOIN `encounter` e \n"
			        + "ON o.encounter_id = e.encounter_id \n" + "WHERE e.encounter_type IN (20)\n"
			        + "AND o.concept_id IN (166210) AND o.`obs_datetime` BETWEEN '" + startdate + "' AND '" + enddate
			        + "' AND o.`voided`=0");
			while (rs.next()) {
				result = rs.getInt("total");
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL Error" + e);
		}
		return result;
	}
	
	public int getTotalRRByQtr(String startdate, String enddate) {
		int result = 0;
		try {
			
			pStatement = conn.createStatement();
			rs = pStatement.executeQuery("SELECT COUNT(*) as total FROM obs o JOIN `encounter` e \n"
			        + "ON o.encounter_id = e.encounter_id \n" + "WHERE e.encounter_type IN (39)\n"
			        + "AND o.concept_id IN (166210)\n" + "AND o.`value_text` \n"
			        + "IN (SELECT ob.value_text FROM obs ob JOIN `encounter` en\n"
			        + "ON ob.encounter_id = en.encounter_id WHERE ob.`concept_id`= 166210 AND en.encounter_type = 20) \n"
			        + "AND o.`obs_datetime` BETWEEN '" + startdate + "' AND '" + enddate + "' AND o.`voided`=0");
			while (rs.next()) {
				result = rs.getInt("total");
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.out.println("SQL Error" + e);
		}
		return result;
	}
	
	public ResultSet getListRecentCasesQrt(String startdate, String enddate) {
        List<String> result = new ArrayList<>();
        try {

            pStatement = conn.createStatement();
            rs = pStatement.executeQuery("SELECT o.person_id as personid, o.encounter_id as encounterid FROM obs o JOIN `encounter` e \n" +
					"ON o.encounter_id = e.encounter_id \n" +
					"WHERE e.encounter_type IN (20)\n" +
					"AND o.concept_id = 166210\n" +
					"AND o.`value_text` \n" +
					"NOT IN (SELECT ob.value_text FROM obs ob JOIN `encounter` en\n" +
					"ON ob.encounter_id = en.encounter_id WHERE ob.`concept_id`= 166210 AND en.encounter_type = 39)\n" +
					"AND o.`voided`=0\n" +
					"AND o.`obs_datetime` BETWEEN '"+startdate+"' AND '"+enddate+"'");

        }
        catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL Error" + e);
        }
        return rs;
    }
}
