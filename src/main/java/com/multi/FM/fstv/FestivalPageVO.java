package com.multi.FM.fstv;

public class FestivalPageVO {
	private int index;
	private int page;
	
	public void calidx() {
		index = (page - 1) * 9;
	}
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "FstvPageVO [index=" + index + ", page=" + page + "]";
	}
	
}
