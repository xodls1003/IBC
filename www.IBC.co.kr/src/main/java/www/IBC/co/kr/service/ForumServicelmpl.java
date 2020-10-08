package www.IBC.co.kr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumVO;
import www.IBC.co.kr.mapper.ForumMapper;


@Service
@AllArgsConstructor
public class ForumServicelmpl implements ForumService{
	
	@Setter(onMethod_ = @Autowired)
	private ForumMapper mapper;
	
	@Override
	public void register(ForumVO forum) {
		
		mapper.insertSelectKey(forum);
		
	}

	@Override
	public ForumVO get(Long fno) {
		
		return mapper.read(fno);
	}

	@Override
	public boolean modify(ForumVO forum) {
		
		return mapper.update(forum)==1;
	}

	@Override
	public boolean remove(Long fno) {
		
		return mapper.delete(fno)==1;
	}

	@Override
	public List<ForumVO> getList(Criteria cri) {
		
		return mapper.getList();
	}

	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
	
	
	
}
