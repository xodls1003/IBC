package www.IBC.co.kr.domain;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import www.IBC.co.kr.model.FAQ;

@Repository
public class FAQDaoImpl implements FAQDao {
	
	@Autowired
	private SqlSessionTemplate sst;

//	public List<FAQ> list(int startRow, int endRow) {
//		Map<String, Integer> map = new HashMap<String, Integer>();
//		map.put("startRow", startRow);
//		map.put("endRow", endRow);
//		return sst.selectList("faqns.list", map);
//	}

	public FAQ select(int fno) {
		return sst.selectOne("faqns.select", fno);
	}

	public int insert(FAQ faq) {
		return sst.insert("faqns.insert",faq);
	}

	public int getTotal(FAQ faq) {
		return sst.selectOne("faqns.getTotal", faq);				
	}

	/*
	 * public int maxNum() { return sst.selectOne("faqns.maxNum"); }
	 */

	public void updateReadCount(int fno) {
		sst.update("faqns.updateReadCount", fno);
		
	}

	public int update(FAQ faq) {
		return sst.update("faqns.update", faq);
	}

	public int delete(int fno) {
		return sst.update("faqns.delete", fno);
	}

	public List<FAQ> list(FAQ faq) {
		return sst.selectList("faqns.list", faq);
	}

}
