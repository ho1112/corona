package com.sesoc.cl.board;

public class PageNavigator {
	//멤버
	private int countPerPage; //한 페이지당 글 개수
	private int pagePerGroup = 5;  //페이지 그룹
	private int currentPage;			   //현재페이지
	private int totalRecordCount;		   //전체 글 개수
	private int totalPageCount;			   //총 페이지 수
	private int currentGroup;			   //현재 그룹
	private int startPageGroup;			   //현재 그룹의 첫 페이지
	private int endPageGroup;			   //현재 그룹의 마지막 페이지
	private int startRecord;               //전체 레크드 중 현재 페이지의 첫 글의 위치
	//srow,erow계산하지 않고, mybatis의 기능을 사용할 예정
	
	public PageNavigator() {
	}
	
	//생성자
	public PageNavigator(int currentPage, int totalRecordCount, int countPerPage) {
		this.totalRecordCount = totalRecordCount;
		//System.out.println("나비"+countPerPage+"총 게시글 : "+totalRecordCount);
		this.setCountPerPage(countPerPage);
		
		// 전체 글 개수가 152개라면 몇 페이지? 16페이지
		// 150이라면 15페이지      
		//-1 하는 이유는 10으로 딱 나누어떨어졌을 떄를 위하여
		totalPageCount = (totalRecordCount + countPerPage -1) /countPerPage;
		if(currentPage < 1) currentPage = 1;
		if(currentPage > totalPageCount) currentPage = totalPageCount;
		
		this.currentPage = currentPage;
		
		// 현재 그룹 : 4
		// 4페이지를 보고 있다면 4페이지는 (4-1) /5 = 0번그룹
		currentGroup = (currentPage -1) / pagePerGroup;
		
		//현재 그룹의 첫 페이지 계산
		startPageGroup = currentGroup * pagePerGroup +1;
		startPageGroup = startPageGroup < 1 ? 1 : startPageGroup;
		
		//현재 그룹의 마지막 페이지
		endPageGroup = startPageGroup + pagePerGroup -1;
		endPageGroup = endPageGroup < totalPageCount ? endPageGroup : totalPageCount;
		
		//전체 레코드 중에서 현재 페이지의 첫 글 위치
		startRecord = (currentPage -1) * countPerPage;
	}
	
	//setter/getter
	
	
	
	
	
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getCurrentGroup() {
		return currentGroup;
	}

	public void setCurrentGroup(int currentGroup) {
		this.currentGroup = currentGroup;
	}

	public int getStartPageGroup() {
		return startPageGroup;
	}

	public void setStartPageGroup(int startPageGroup) {
		this.startPageGroup = startPageGroup;
	}

	public int getEndPageGroup() {
		return endPageGroup;
	}

	public void setEndPageGroup(int endPageGroup) {
		this.endPageGroup = endPageGroup;
	}

	public int getStartRecord() {
		return startRecord;
	}

	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public int getPagePerGroup() {
		return pagePerGroup;
	}

	//toString()
	@Override
	public String toString() {
		return "PageNavigator [countPerPage=" + countPerPage + ", pagePerGroup=" + pagePerGroup + ", currentPage="
				+ currentPage + ", totalRecordCount=" + totalRecordCount + ", totalPageCount=" + totalPageCount
				+ ", currentGroup=" + currentGroup + ", startPageGroup=" + startPageGroup + ", endPageGroup="
				+ endPageGroup + ", startRecord=" + startRecord + "]";
	}
	
}
