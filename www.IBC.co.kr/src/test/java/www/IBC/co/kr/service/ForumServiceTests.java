package www.IBC.co.kr.service;

import static org.junit.Assert.assertNotNull;

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
public class ForumServiceTests {
	
	@Setter(onMethod_ = {@Autowired})
	private ForumService service;
	
	@Test
	public void testExist() {
	log.info(service);
	assertNotNull(service);
	}
	@Test
	public void testRegister() {
		
		ForumVO forum = new ForumVO();
		forum.setFtitle("새로 작성하는 글");
		forum.setFsort(0);
		forum.setFcontent("새로 작성하는 내용");
		forum.setFwriter("Taein");
		
		service.register(forum);
		log.info("생선된 게시물의 번호: " + forum.getFno());
	}


	@Test
	public void testGet() {
		log.info(service.get(1L));
		
	}
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: "+ service.remove(2L));
	}
	
	@Test
	public void testUpdate() {
		ForumVO forum= service.get(1L);
		
		if(forum== null) {
			return ;
		}
		forum.setFtitle("제목 수정 테스트");
		log.info("Modify Result : " + service.modify(forum));
	}

}
