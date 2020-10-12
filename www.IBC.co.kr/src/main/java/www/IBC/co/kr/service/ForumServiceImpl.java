package www.IBC.co.kr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumVO;
import www.IBC.co.kr.mapper.ForumMapper;


@Service
public class ForumServiceImpl implements ForumService{
	
	@Setter(onMethod_ = @Autowired)
	private ForumMapper mapper;
	
	@Transactional
	@Override
	public void register(ForumVO forum) {
		
		mapper.insertSelectKey(forum);
		
	}

	@Override
	public ForumVO get(Long fno) {
		
		return mapper.read(fno);
	}
	@Transactional
	@Override
	public boolean modify(ForumVO forum) {
		
		return mapper.update(forum)==1;
	}

	@Override
	public boolean remove(Long fno) {
		
		return mapper.delete(fno) == 1;
	}

	@Override
	public List<ForumVO> getList(Criteria cri) {
		
		return mapper.getListWithPaging(cri);
	}

	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	
	
}
