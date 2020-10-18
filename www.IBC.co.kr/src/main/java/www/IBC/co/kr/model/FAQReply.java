package www.IBC.co.kr.model;

import java.sql.Date;

import lombok.Data;

@Data
public class FAQReply {
	
	private int rno;
	private int fno;
	private String fid;
	private String content;
	private Date regdate;
	private Date updatedate;
	private String del;
	
	//페이징용
	private int startRow;
	private int endRow;
}
