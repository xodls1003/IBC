package www.IBC.co.kr.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ForumReplyPageDTO {
	
	private int FreplyCnt;
	private List<ForumReplyVO> list;
	
}
