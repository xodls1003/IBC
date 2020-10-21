package www.IBC.co.kr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.IBC.co.kr.domain.InstitutionInfoVO;

public interface InstitutionInfoMapper {

	// 학원정보등록
	public int registerInfo(InstitutionInfoVO vo);

	// 학원정보수정
	public int modifyInfo(InstitutionInfoVO vo);

	// 학원정보삭제
	public int removeInfo(Long ino);

	// 학원정보 페이징 목록
	public List<InstitutionInfoVO> list();

	// 총 학원개수
	public int listCount();

	// 해당학원정보
	public InstitutionInfoVO info(String iname);

	// Best5학원정보
	public List<InstitutionInfoVO> bestList();

	// 최신학원정보 -> 5개만
	public List<InstitutionInfoVO> newList();

	// 학원이름으로 검색
	public List<InstitutionInfoVO> searchInameInfo(String iname);

	// 과목으로 검색
	public List<InstitutionInfoVO> searcIsubjectInfo(String isubject);

	// 지역으로 검색
	public List<InstitutionInfoVO> searcIareaInfo(String iarea);

	// 과목 과 지역으로 검색
	public List<InstitutionInfoVO> searcIsubjectANDIareaInfo(@Param("isubject") String isubject,
			@Param("iarea") String iarea);

}