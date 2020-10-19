package www.IBC.co.kr.domain;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.mapper.InstitutionInfoMapper;
import www.IBC.co.kr.service.InstitutionInfoService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class InstitutionInfoMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	public InstitutionInfoMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	public InstitutionInfoService service;
	
	public InstitutionInfoVO vo;
	


}
