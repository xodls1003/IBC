package www.IBC.co.kr.domain;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.mapper.InstitutionInfoMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InstitutionInfoMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	public InstitutionInfoMapper mapper;
	
	public InstitutionInfoVO vo;
	
	@Test
	public void listTest() {
		mapper.list(1, 8).forEach(list -> log.info(list));
	}

}
