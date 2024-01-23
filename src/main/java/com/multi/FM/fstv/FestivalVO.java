package com.multi.FM.fstv;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FestivalVO {
	
	private int fstv_no;
	private String fstv_title;
	private Date fstv_startdate;
	private Date fstv_enddate;
	private String fstv_addr1;
	private double fstv_mapx;
	private double fstv_mapy;
	private String fstv_image;
	private String fstv_tel;
	private String fstv_eventinfo;
	private String fstv_eventcont;
	private String fstv_usetimefestival;
	private String fstv_eventplace;
	private String fstv_playtime;
	private String fstv_homepage;
	private String fstv_banneraddr;
	private int fstv_jjimCount;
	
	public String getFstv_startdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        return sdf.format(fstv_startdate);
	}
	public String getFstv_enddate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        return sdf.format(fstv_enddate);
	}
	public String getFstv_banneraddr() {
		String[] s = fstv_addr1.split(" ");
		return s[0]+ " " + s[1];
	}

	@Override
	public String toString() {
		return "FestivalVO [fstv_no=" + fstv_no + ", fstv_title=" + fstv_title + ", fstv_startdate=" + fstv_startdate
				+ ", fstv_enddate=" + fstv_enddate + ", fstv_addr1=" + fstv_addr1 + ", fstv_mapx=" + fstv_mapx
				+ ", fstv_mapy=" + fstv_mapy + ", fstv_image=" + fstv_image + ", fstv_tel=" + fstv_tel
				+ ", fstv_eventinfo=" + fstv_eventinfo + ", fstv_eventcont=" + fstv_eventcont
				+ ", fstv_usetimefestival=" + fstv_usetimefestival + ", fstv_eventplace=" + fstv_eventplace
				+ ", fstv_playtime=" + fstv_playtime + ", fstv_homepage=" + fstv_homepage + "]";
	}
	
}
