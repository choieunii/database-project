package project;

public class Artist {
	private String artistid;
	private String artistname;
	private String entertainment;
	private String birthdate;
	private String isgroup;
	private int likecount;

	public Artist() {
		artistid = null;
		artistname = null;
		entertainment = null;
		birthdate = null;
		isgroup = null;
		likecount = 0;
	}

	public void setArtistId(String artistid) {
		this.artistid = artistid;
	}

	public void setArtistName(String artistname) {
		this.artistname = artistname;
	}

	public void setEntertainment(String entertainment) {
		this.entertainment = entertainment;
	}

	public void setBirthdate(String birthdate) {
		String splitbirth = birthdate.substring(0, 10);
		this.birthdate = splitbirth;
	}

	public void setIsGroup(String isgroup) {
		this.isgroup = isgroup;
	}
	
	public void setLikeCount(int likecount) {
		this.likecount = likecount;
	}

	public String getArtistId() {
		return artistid;
	}

	public String getArtistName() {
		return artistname;
	}

	public String getEntertainment() {
		return entertainment;
	}

	public String getBirthDate() {
		return birthdate;
	}
	
	public String getIsGroup() {
		return isgroup;
	}

	public int getLikeCount() {
		return likecount;
	}
}
