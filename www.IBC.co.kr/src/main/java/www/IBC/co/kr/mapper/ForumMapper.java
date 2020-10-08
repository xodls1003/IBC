package www.IBC.co.kr.mapper;

import java.util.List;

import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumVO;

public interface ForumMapper {
	
	public List<ForumVO> getList();
	
	public List<ForumVO> getListWithPaging(Criteria cri);
	
	public void insert(ForumVO forum);
	
	public void insertSelectKey(ForumVO forum);
	
	public ForumVO read(Long fno);
	
	public int delete (Long bno);
	
	public int update (ForumVO forum);
	
	public int getTotalCount(Criteria cri);
}
