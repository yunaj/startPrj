package com.spring.vo;

public class PageCriteria {
	private int page;
	private int numPerPage;
	private String searchType;
	private String keyword;
	
	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public PageCriteria() {
		this.page = 1;
		this.numPerPage = 10;
		this.searchType = "";
		this.keyword = "";
	}
	
	public void setPage(int page) {
		if(page<=0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}
	
	public void setNumPerPage(int numPerPage) {
		if(numPerPage <= 0 || numPerPage > 100) {
			this.numPerPage = 10;
			return;
		}
		
		this.numPerPage = numPerPage;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getStartPage() {
		return (this.page -1) * numPerPage;
	}
	
	public int getNumPerPage() {
		return this.numPerPage;
	}

	@Override
	public String toString() {
		return "PageCriteria [page=" + page + ", numPerPage=" + numPerPage
				+ ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
