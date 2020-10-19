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
	public List<InstitutionInfoVO> list() {
		return mapper.list();
	}

	@Override
	public int listCount() {
		return mapper.listCount();
	}

	@Override
	public InstitutionInfoVO info(String iname) {
		return mapper.info(iname);
	}

	@Override
	public List<InstitutionInfoVO> bestList() {
		return mapper.bestList();
	}

	@Override
	public List<InstitutionInfoVO> newList() {
		return mapper.newList();
	}

	@Override
	public List<InstitutionInfoVO> searchInameInfo(String iname) {
		return mapper.searchInameInfo(iname);
	}

	@Override
	public List<InstitutionInfoVO> searcIsubjectInfo(String isubject) {
		return mapper.searcIsubjectInfo(isubject);
	}

	@Override
	public List<InstitutionInfoVO> searcIareaInfo(String iarea) {
		return mapper.searcIareaInfo(iarea);
	}

	@Override
	public List<InstitutionInfoVO> searcIsubjectANDIareaInfo(String isubject, String iarea) {
		return mapper.searcIsubjectANDIareaInfo(isubject, iarea);
	}

	

}
