package www.IBC.co.kr.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.domain.ForumVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ForumMapperTests {
	@Setter(onMethod_ = @Autowired)
	private ForumMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(forum-> log.info(forum));
	}
	
	@Test
	public void testInsert() {
		ForumVO forum = new ForumVO();
		forum.setFtitle("새로 작성하는 글");
		forum.setFsort(0);
		forum.setFcontent("새로 작성하는 내용");
		forum.setFwriter("Taein");
		
		mapper.insert(forum);
		log.info(forum);
	}
	@Test
	public void testInsertSelectKey() {
		ForumVO forum = new ForumVO();
		forum.setFtitle("selectkey 이용해서 새로 작성하는 글");
		forum.setFsort(0);
		forum.setFcontent("selectkey화용해서 새로 작성하는 글");
		forum.setFwriter("taein");
	}
	@Test
	public void testRead() {
		
		ForumVO forum = mapper.read(5L);
		
		log.info(forum);
	}
	@Test
	public void testDelete() {
		log.info("DELTE COUNT: " + mapper.delete(3L));
	}
	@Test
	public void testUpdate() {
		ForumVO forum = new ForumVO();
		forum.setFno(5L);
		forum.setFtitle("수정된 제목");
		forum.setFcontent("수정된 내용");
		forum.setFwriter("tain");
		
		int count = mapper.update(forum);
		log.info("UPDATE COUNT: " + count);
	}
}
