package www.IBC.co.kr.service;

import java.util.List;

import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumReplyPageDTO;
import www.IBC.co.kr.domain.ForumReplyVO;

public interface ForumReplyService {
	
	public int register(ForumReplyVO vo);
	
	public ForumReplyVO get(Long frno);
	
	public int modify(ForumReplyVO vo);
	
	public int remove(Long frno);
	
	public List<ForumReplyVO> getList(Criteria cri, Long fno);
	
	public ForumReplyPageDTO getListPage(Criteria cri, Long fno);
}
