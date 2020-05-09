package com.pxxy.handleMenuscript.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.pxxy.handleMenuscript.bean.ContributeEssay;
import com.pxxy.handleMenuscript.mapper.ContributeEssayMapper;

@RunWith(SpringRunner.class)
@ContextConfiguration({
	"classpath:application-dao.xml",
	"classpath:application-service.xml"
	})
public class ContributeEssayTest {
	@Autowired
	private ContributeEssayMapper cEssayMapper;
	@Test
	public void selectContributeEssay() {
		List<ContributeEssay> list=cEssayMapper.selectContributeEssay();
		System.out.println(list);
	}
	/**
	 * 待审核
	 */
	@Test
	public void selectEssayByUserId() {
		List<ContributeEssay> list=cEssayMapper.selectEssayByUserId("12345",62);
		System.out.println(list);
	}
	@Test
	public void delectContributeById() {
		String[] contributeById= {"20200305182108","20200308000104"};
		cEssayMapper.delectContributeById(contributeById);
	}

}
