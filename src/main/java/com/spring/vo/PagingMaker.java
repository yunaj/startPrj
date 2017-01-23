package com.spring.vo;

public class PagingMaker {
	private int totalData;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private int totalPage = 10; //총 페이지 수
	
	private PageCriteria pageCriteria;
	
	public void setPageCriteria(PageCriteria pageCriteria) {
		this.pageCriteria = pageCriteria;
	}
	
	public void setTotalData(int totalData) {
		this.totalData = totalData;
	}
	
	public void getPagingData() {
		endPage = (int) (Math.ceil(pageCriteria.getPage() / (double)totalPage) * totalPage);
		startPage = (endPage - totalPage) + 1;
		int finalEndPage = (int)(Math.ceil(totalData/(double)pageCriteria.getNumPerPage()));
		
		if(endPage>finalEndPage){
			endPage = finalEndPage;
		}
		
		prev = (startPage == 1) ? false : true;
		next = (endPage * pageCriteria.getNumPerPage() >= totalData) ? false : true;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalData() {
		return totalData;
	}

	public PageCriteria getPageCriteria() {
		return pageCriteria;
	}
}
