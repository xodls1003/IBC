package www.IBC.co.kr.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ForumVO {
	private Long fno;
	private String ftitle;
	private int fsort;
	private String fcontent;
	private String fwriter;
	private Date fregdate;
	private int flike;
	private Long fviews;
	private char fshow;
	private int fReplyCnt;
}
