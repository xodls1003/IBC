package www.IBC.co.kr.domain;

import lombok.Data;

@Data
public class InstitutionInfoPage {
	
	//총 게시물개수
	int listCount;
	//총 페이지개수
	int pageCount;
	//전페이지
	int previousPage;
	//다음페이지
	int nextPage;
	//현재페이지
	int currentPage = 1;
	//한페이당 게시글개수
	int boardCount;
	//첫 페이지 
	int startPage;
	//마지막 페이지
	int endPage;
	
	//생성자 : 현재페이지(View)와 총게시물개수(DB)
	//한 페이지당 10개의 데이터가 들어간다고 가정
	public InstitutionInfoPage(int listCount, int currentPage) {
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.previousPage = currentPage-1;
		this.nextPage = currentPage + 1;
		this.pageCount = listCount/10;
		//현재 페이지를 소수점으로 나타낸 후, 올림하면 마지막 페이지를 알 수 있음 -> ex)  11페이지인경우 -> 1.1 -> 2 -> 마지막페이지가 20페이지
		double ceilValue = currentPage/10.0; //1.1
		this.endPage = ((int)Math.ceil(ceilValue))*10; //2*10 = 20
		this.startPage = endPage-9; //11
		
		//총페이지 개수가 endPage(설정한 10)보다 작은경우 endPage에 총페이지 개수를 대입
		if(pageCount < endPage) {
			this.endPage = this.pageCount;
		}
	}
	
	
	
	
	
}
