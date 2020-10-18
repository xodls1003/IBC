package www.IBC.co.kr.domain;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.IBC.co.kr.model.FAQReply;

@Repository
public class FAQReplyDaoImpl implements FAQReplyDao{
	
	@Autowired
	private SqlSessionTemplate sst;

	public List<FAQReply> list(int fno) {
		return sst.selectList("faqrns.list", fno);
	}

	public void insert(FAQReply faqr) {
		sst.insert("faqrns.insert", faqr);
		
	}

	public void delete(int rno) {
		sst.update("faqrns.delete", rno);
	}

	public void update(FAQReply faqr) {
		sst.update("faqrns.update", faqr);
	}
}
