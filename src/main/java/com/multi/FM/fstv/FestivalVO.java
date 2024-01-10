package com.multi.FM.fstv;

import java.text.SimpleDateFormat;
import java.util.Date;

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
	
	public int getFstv_no() {
		return fstv_no;
	}
	public void setFstv_no(int fstv_no) {
		this.fstv_no = fstv_no;
	}
	public String getFstv_title() {
		return fstv_title;
	}
	public void setFstv_title(String fstv_title) {
		this.fstv_title = fstv_title;
	}
	public String getFstv_startdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        return sdf.format(fstv_startdate);
	}
	public void setFstv_startdate(Date fstv_startdate) {
		this.fstv_startdate = fstv_startdate;
	}
	public String getFstv_enddate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
        return sdf.format(fstv_enddate);
	}
	public void setFstv_enddate(Date fstv_enddate) {
		this.fstv_enddate = fstv_enddate;
	}
	public String getFstv_addr1() {
		return fstv_addr1;
	}
	public void setFstv_addr1(String fstv_addr1) {
		this.fstv_addr1 = fstv_addr1;
	}
	public double getFstv_mapx() {
		return fstv_mapx;
	}
	public void setFstv_mapx(double fstv_mapx) {
		this.fstv_mapx = fstv_mapx;
	}
	public double getFstv_mapy() {
		return fstv_mapy;
	}
	public void setFstv_mapy(double fstv_mapy) {
		this.fstv_mapy = fstv_mapy;
	}
	public String getFstv_image() {
		return fstv_image;
	}
	public void setFstv_image(String fstv_image) {
		this.fstv_image = fstv_image;
	}
	public String getFstv_tel() {
		return fstv_tel;
	}
	public void setFstv_tel(String fstv_tel) {
		this.fstv_tel = fstv_tel;
	}
	public String getFstv_eventinfo() {
		return fstv_eventinfo;
	}
	public void setFstv_eventinfo(String fstv_eventinfo) {
		this.fstv_eventinfo = fstv_eventinfo;
	}
	public String getFstv_eventcont() {
		return fstv_eventcont;
	}
	public void setFstv_eventcont(String fstv_eventcont) {
		this.fstv_eventcont = fstv_eventcont;
	}
	public String getFstv_usetimefestival() {
		return fstv_usetimefestival;
	}
	public void setFstv_usetimefestival(String fstv_usetimefestival) {
		this.fstv_usetimefestival = fstv_usetimefestival;
	}
	public String getFstv_eventplace() {
		return fstv_eventplace;
	}
	public void setFstv_eventplace(String fstv_eventplace) {
		this.fstv_eventplace = fstv_eventplace;
	}
	public String getFstv_playtime() {
		return fstv_playtime;
	}
	public void setFstv_playtime(String fstv_playtime) {
		this.fstv_playtime = fstv_playtime;
	}
	public String getFstv_homepage() {
		return fstv_homepage;
	}
	public void setFstv_homepage(String fstv_homepage) {
		this.fstv_homepage = fstv_homepage;
	}
	
	public String getFstv_banneraddr() {
		String[] s = fstv_addr1.split(" ");
		return s[0]+ " " + s[1];
	}
	
	public void setFstv_banneraddr(String fstv_banneraddr) {
		this.fstv_banneraddr = fstv_banneraddr;
	}
	
	public int getFstv_jjimCount() {
      return fstv_jjimCount;
    }

	public void setFstv_jjimCount(int fstv_jjimcount) {
      this.fstv_jjimCount = fstv_jjimcount;
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
