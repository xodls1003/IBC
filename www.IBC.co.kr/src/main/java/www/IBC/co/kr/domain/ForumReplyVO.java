package www.IBC.co.kr.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long frno;
	private Long fno;
	private String frcontent;
	private String frwriter;
	private Date frregdate;
	private int frlike;
	private char frshow;
}
