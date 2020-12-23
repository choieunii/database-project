package project;

public class Music {
	private String musicid;
	private String musicname;
	private String artistname;
	private String albumname;
	private String musicgenre;
	private int musicplaycount;

	public Music() {
		musicid = null;
		musicname = null;
		artistname = null;
		albumname = null;
		musicgenre = null;
		musicplaycount = 0;
	}

	public void setMusicId(String musicid) {
		this.musicid = musicid;
	}

	public void setMusicName(String musicname) {
		this.musicname = musicname;
	}

	public void setArtistName(String artistname) {
		this.artistname = artistname;
	}

	public void setAlbumname(String albumname) {
		this.albumname = albumname;
	}

	public void setMusicGenre(String musicgenre) {
		this.musicgenre = musicgenre;
	}

	public void setMusicPlayCount(int musicplaycount) {
		this.musicplaycount = musicplaycount;
	}

	public String getMusicId() {
		return musicid;
	}

	public String getMusicName() {
		return musicname;
	}

	public String getArtistName() {
		return artistname;
	}

	public String getAlbumName() {
		return albumname;
	}

	public String getMusicGenre() {
		return musicgenre;
	}

	public int getMusicPlayCount() {
		return musicplaycount;
	}

}
