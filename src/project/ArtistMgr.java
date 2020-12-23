package project;


import java.sql.*;
import java.util.*;
import javax.sql.*;

import project.ArtistMgr;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import project.*;

public class ArtistMgr {
	
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public ArtistMgr() {
		try {
			ocpds = new OracleConnectionPoolDataSource();

			ocpds.setURL("jdbc:oracle:thin:@210.94.199.20:1521:DBLAB");
			ocpds.setUser("ST2018112021"); 
			ocpds.setPassword("ST2018112021"); 

			pool = ocpds.getPooledConnection();
		} catch (Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}
	
	public Vector getArtistList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		try {

			conn = pool.getConnection();
			String mySQL = "select artistid, artistname,entertainment, birthdate, isgroup, likecount from pj_artist";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(mySQL);
			while (rs.next()) {
				Artist A = new Artist();
				A.setArtistId(rs.getString("artistid"));
				A.setArtistName(rs.getString("artistname"));
				A.setEntertainment(rs.getString("entertainment"));
				A.setBirthdate(rs.getString("birthdate"));
				A.setIsGroup(rs.getString("isgroup"));
				A.setLikeCount(rs.getInt("likecount"));
				vecList.add(A);
			}
			stmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return vecList;
	}
}
