package www.IBC.co.kr.mapper;

import java.util.List;

import www.IBC.co.kr.domain.FourmAttachVO;




public interface ForumAttachMapper {

	public void insert(FourmAttachVO vo);

	public void delete(String uuid);

	public List<FourmAttachVO> findByFno(Long fno);

	public void deleteAll(Long fno);

	public List<FourmAttachVO> getOldFiles();

}