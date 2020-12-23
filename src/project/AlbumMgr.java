package project;

import java.sql.*;
import java.util.*;
import javax.sql.*;

import project.AlbumMgr;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import project.*;

public class AlbumMgr {
	
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public AlbumMgr() {
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
	
	public Vector getAlbumList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		try {

			conn = pool.getConnection();
			String mySQL = "select A.albumid, A.albumname, A.albumbirthdate, A.albumdirector,A.albumlikecount,B.artistname from pj_album A, pj_artist B, pj_artist_album C where A.albumid = C.albumid and B.artistid = C.artistid order by to_number(A.albumid)";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(mySQL);
			while (rs.next()) {
				Album A = new Album();
				A.setAlbumId(rs.getString("albumid"));
				A.setAlbumName(rs.getString("albumname"));
				A.setAlbumBirthdate(rs.getString("albumbirthdate"));
				A.setAlbumDirector(rs.getString("albumdirector"));
				A.setArtistName(rs.getString("artistname"));
				A.setAlbumLikeCount(rs.getInt("albumlikecount"));
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
