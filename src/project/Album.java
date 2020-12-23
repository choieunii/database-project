package project;

public class Album {
	private String albumid;
	private String albumname;
	private String albumbirthdate;
	private String albumdirector;
	private String artistname;
	private int albumlikecount;

	public Album() {
		albumid = null;
		albumname = null;
		albumbirthdate = null;
		albumname = null;
		albumdirector = null;
		artistname = null;
		albumlikecount = 0;
	}

	public void setAlbumId(String albumid) {
		this.albumid = albumid;
	}

	public void setAlbumName(String albumname) {
		this.albumname = albumname;
	}

	public void setAlbumBirthdate(String albumbirthdate) {
		String splitbirth = albumbirthdate.substring(0, 10);
		this.albumbirthdate = splitbirth;
	}

	public void setAlbumDirector(String albumdirector) {
		this.albumdirector = albumdirector;
	}
	
	public void setArtistName(String artistname) {
		this.artistname = artistname;
	}

	public void setAlbumLikeCount(int albumlikecount) {
		this.albumlikecount = albumlikecount;
	}

	public String getAlbumId() {
		return albumid;
	}

	public String getAlbumName() {
		return albumname;
	}

	public String getAlbumBirthdate() {
		return albumbirthdate;
	}

	public String getAlbumDirector() {
		return albumdirector;
	}
	
	public String getArtistName() {
		return artistname;
	}

	public int getAlbumLikeCount() {
		return albumlikecount;
	}
}
