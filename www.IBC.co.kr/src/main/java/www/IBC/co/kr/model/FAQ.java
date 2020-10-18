package www.IBC.co.kr.model;

import java.sql.Date;
import lombok.Data;

@Data
public class FAQ {
	
	private int fno;
	private String admin_id;
	private String question; 
	private String answer; 
	private int readcount;
	private Date regdate;
	private Date updatedate;
	private String del;
	
	//페이징용
	private int startRow;
	private int endRow;
	
	//검색용
	private String search;
	private String keyword;
			
}
