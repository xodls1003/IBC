package www.IBC.co.kr.mapper;

import java.util.List;

import www.IBC.co.kr.domain.BoardAttachVO;




public interface BoardAttachMapper {

	public void insert(BoardAttachVO vo);

	public void delete(String uuid);

	public List<BoardAttachVO> findByBno(Long bno);

	public void deleteAll(Long bno);

	public List<BoardAttachVO> getOldFiles();

}