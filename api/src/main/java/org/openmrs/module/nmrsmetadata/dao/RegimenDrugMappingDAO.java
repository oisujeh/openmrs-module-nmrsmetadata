package org.openmrs.module.nmrsmetadata.dao;

import org.openmrs.module.nmrsmetadata.model.LocalConcept;
import org.openmrs.module.nmrsmetadata.model.RegimenDrugMapping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static java.sql.Types.NULL;

public class RegimenDrugMappingDAO {
	
	public RegimenDrugMappingDAO() {
	}
	
	public List<RegimenDrugMapping> getRegimenDrugMapping(Integer regimenConceptId) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = Database.connectionPool.getConnection();
			
			String query = "SELECT * FROM regimen_drug_mappings WHERE regimen_concept_id=?";
			
			int i = 1;
			stmt = con.prepareStatement(query);
			stmt.setInt(i, regimenConceptId);
			rs = stmt.executeQuery();
			List<RegimenDrugMapping> regimenDrugMappings = new ArrayList<>();
			while(rs.next()) {
				RegimenDrugMapping regMap = new RegimenDrugMapping();
				regMap.setRegimenDrugMappingId(rs.getInt("regimen_drug_mapping_id"));
				regMap.setRegimenConceptId(rs.getInt("regimen_concept_id"));
				regMap.setDrugsConceptId(rs.getInt("drugs_concept_id"));
				regMap.setAdultStrength(rs.getInt("adult_strength"));
				regMap.setPediatricStrength(rs.getInt("pediatric_strength"));

				regimenDrugMappings.add(regMap);
			}
			return regimenDrugMappings;
		}
		catch (SQLException ex) {
			Database.handleException(ex);
			return null;
			
		}
		finally {
			Database.cleanUp(rs, stmt, con);
		}
	}
	
	public List<LocalConcept> searchConcept(String name) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = null;

		try {
			con = Database.connectionPool.getConnection();

			String query = "SELECT name, concept_id FROM concept_name WHERE name LIKE ? AND voided=0 AND locale='en'";

			int i = 1;
			stmt = con.prepareStatement(query);
			stmt.setString(i, "%"+name+"%");
			rs = stmt.executeQuery();
			List<LocalConcept> concepts = new ArrayList<>();
			while(rs.next()) {
				LocalConcept concept = new LocalConcept();
				concept.setConceptId(rs.getInt("concept_id"));
				concept.setConceptName(rs.getString("name"));
				concepts.add(concept);
			}
			return concepts;

		}
		catch (SQLException ex) {
			Database.handleException(ex);
			return null;

		}
		finally {
			Database.cleanUp(rs, stmt, con);
		}
	}
	
	public int saveRegimenDrugMapping(RegimenDrugMapping regimenDrugMapping) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = Database.connectionPool.getConnection();
			//stmt = Database.conn.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY, java.sql.ResultSet.CONCUR_READ_ONLY);
			
			//stmt = Database.conn.createStatement(java.sql.ResultSet.TYPE_FORWARD_ONLY, java.sql.ResultSet.CONCUR_READ_ONLY);
			
			String newInsert = "REPLACE INTO regimen_drug_mappings (regimen_concept_id, drugs_concept_id, adult_strength,pediatric_strength)"
			        + "VALUES( ?, ?, ?, ?)";
			String update = "UPDATE regimen_drug_mappings SET drugs_concept_id=?, adult_strength =?, pediatric_strength=? where regimen_drug_mapping_id=?";
			
			int i = 1;
			if (regimenDrugMapping.getRegimenDrugMappingId() == null) {
				stmt = con.prepareStatement(newInsert);
				stmt.setInt(i++, regimenDrugMapping.getRegimenConceptId());
				stmt.setInt(i++, regimenDrugMapping.getDrugsConceptId());
				if (regimenDrugMapping.getAdultStrength() != null)
					stmt.setInt(i++, regimenDrugMapping.getAdultStrength());
				else
					stmt.setNull(i++, NULL);
				if (regimenDrugMapping.getPediatricStrength() != null)
					stmt.setInt(i++, regimenDrugMapping.getPediatricStrength());
				else
					stmt.setNull(i++, NULL);
			} else {
				stmt = con.prepareStatement(update);
				stmt.setInt(i++, regimenDrugMapping.getDrugsConceptId());
				stmt.setInt(i++, regimenDrugMapping.getAdultStrength());
				stmt.setInt(i++, regimenDrugMapping.getPediatricStrength());
				stmt.setInt(i++, regimenDrugMapping.getRegimenDrugMappingId());
				//stmt.setInt(i++, regimenDrugMapping.getRegimenDrugMappingId());
			}
			
			return stmt.executeUpdate();
			
		}
		catch (SQLException ex) {
			Database.handleException(ex);
			
		}
		finally {
			Database.cleanUp(rs, stmt, con);
		}
		return 0;
	}
	
	public String deleteMapping(Integer criteria) {
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection con = null;
		
		try {
			con = Database.connectionPool.getConnection();
			
			String query = "DELETE FROM regimen_drug_mappings WHERE regimen_drug_mapping_id=?";
			
			int i = 1;
			stmt = con.prepareStatement(query);
			stmt.setInt(i, criteria);
			//			rs = stmt.execute();
			int response = stmt.executeUpdate();
			System.out.println(response);
			if (response > 0) {
				return "Success";
			}
			return "Failed";
		}
		catch (SQLException ex) {
			Database.handleException(ex);
			return null;
			
		}
		finally {
			Database.cleanUp(rs, stmt, con);
		}
	}
	
}
