package www.IBC.co.kr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumReplyVO;

public interface ForumReplyMapper {

	public int insert(ForumReplyVO vo);
	
	public ForumReplyVO read(Long fno);
	
	public int delete(Long fno);
	
	public int update (ForumReplyVO reply);
	
	public List<ForumReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("fno") Long fno);
	public int getCountByFno(Long fno);
}
