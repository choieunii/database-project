package project;

import java.sql.*;
import java.util.*;
import javax.sql.*;

import project.MusicMgr;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import project.*;

public class MusicMgr {
	
	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public MusicMgr() {
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
	
	public Vector getMusicList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		Vector vecList = new Vector();
		try {

			conn = pool.getConnection();
			String mySQL = "select M.musicid, M.musicname, A.artistname, Al.albumname, M.MusicGenre, M.musicplaycount from pj_music M, pj_artist A, pj_album Al, pj_artist_album AA, pj_album_music AM Where M.musicid = AM.musicid and Al.albumid = AM.albumid and A.artistid = AA.artistid and Al.albumid = AA.albumid order by To_number(M.musicid)";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(mySQL);
			while (rs.next()) {
				Music M = new Music();
				M.setMusicId(rs.getString("musicid"));
				M.setMusicName(rs.getString("musicname"));
				M.setArtistName(rs.getString("artistname"));
				M.setAlbumname(rs.getString("albumname"));
				M.setMusicGenre(rs.getString("musicgenre"));
				M.setMusicPlayCount(rs.getInt("musicplaycount"));
				vecList.add(M);
			}
			stmt.close();
			conn.close();
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
		return vecList;
	}
}
