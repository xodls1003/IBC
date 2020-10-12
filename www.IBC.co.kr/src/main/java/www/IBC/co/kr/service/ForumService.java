package www.IBC.co.kr.service;

import java.util.List;

import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumVO;

public interface ForumService {
	
	public void register(ForumVO forum);
	
	public ForumVO get(Long fno);
	
	public boolean modify(ForumVO forum);
	
	public boolean remove(Long fno);
	
	public List<ForumVO> getList(Criteria cri);
	
	public int getTotal (Criteria cri);
}
