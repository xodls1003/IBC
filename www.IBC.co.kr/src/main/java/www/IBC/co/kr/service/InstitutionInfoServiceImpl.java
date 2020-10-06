package www.IBC.co.kr.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import www.IBC.co.kr.domain.InstitutionInfoVO;
import www.IBC.co.kr.mapper.InstitutionInfoMapper;

@Service
@AllArgsConstructor
public class InstitutionInfoServiceImpl implements InstitutionInfoService {

	public InstitutionInfoMapper mapper;
	@Override
	public int registerInfo(InstitutionInfoVO vo) {
		return mapper.registerInfo(vo);
	}

	@Override
	public int modifyInfo(InstitutionInfoVO vo) {
		return mapper.modifyInfo(vo);
	}

	@Override
	public int removeInfo(Long ino) {
		return mapper.removeInfo(ino);
	}

	@Override
	public List<InstitutionInfoVO> searchInfo(String area, String subject) {
		return mapper.searchInfo(area, subject);
	}

	@Override
	public List<InstitutionInfoVO> list(int currentpage) {
		return mapper.list(currentpage);
	}

}
