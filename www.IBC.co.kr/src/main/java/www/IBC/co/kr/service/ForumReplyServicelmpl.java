package www.IBC.co.kr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumReplyPageDTO;
import www.IBC.co.kr.domain.ForumReplyVO;
import www.IBC.co.kr.mapper.ForumMapper;
import www.IBC.co.kr.mapper.ForumReplyMapper;

@Service
@Log4j
public class ForumReplyServicelmpl implements ForumReplyService {
	
	@Setter(onMethod_ =@Autowired)
	private ForumReplyMapper mapper;
	
	@Setter(onMethod_ =@Autowired)
	private ForumMapper forumMapper;
	
	
	@Override
	public int register(ForumReplyVO vo) {
		
		forumMapper.updateForumReplyCnt(vo.getFno(), 1);
		
		return mapper.insert(vo);
	}

	@Override
	public ForumReplyVO get(Long frno) {
		
		return mapper.read(frno);
	}

	@Override
	public int modify(ForumReplyVO vo) {
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long frno) {
		
		ForumReplyVO vo = mapper.read(frno);
		
		forumMapper.updateForumReplyCnt(vo.getFno(), -1);
		
		return mapper.delete(frno);
	}

	@Override
	public List<ForumReplyVO> getList(Criteria cri, Long fno) {
		
		return mapper.getListWithPaging(cri, fno);
	}

	@Override
	public ForumReplyPageDTO getListPage(Criteria cri, Long fno) {
		
		return new ForumReplyPageDTO(
				mapper.getCountByFno(fno),
				mapper.getListWithPaging(cri, fno));
	}

}
