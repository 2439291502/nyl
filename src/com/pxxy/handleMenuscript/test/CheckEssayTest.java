package com.pxxy.handleMenuscript.test;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.pxxy.handleMenuscript.bean.ContributeEssay;
import com.pxxy.handleMenuscript.bean.UserInfo;
import com.pxxy.handleMenuscript.mapper.ContributeEssayMapper;

@RunWith(SpringRunner.class)
@ContextConfiguration({
	"classpath:application-dao.xml",
	"classpath:application-service.xml"
	})
public class CheckEssayTest {
	@Autowired
	private ContributeEssayMapper checkEssayMapper;
	@Test
	public void selectUserByProfession() {
		List<UserInfo> list=checkEssayMapper.selectUserByProfession(2);
		System.out.println(list);
	}
	/*分配稿件操作*/
	@Test
	public void insertContributeEssay() {
		ContributeEssay cEssay=new ContributeEssay();
		cEssay.setContributeId("1");
		cEssay.setEditorId("1");
		cEssay.setCheckUserId("userId");
		cEssay.setEssayId("essayId");
		cEssay.setContributeDate(new Date());
		checkEssayMapper.insertContributeEssay(cEssay);
	}
	//selectContributeEssay
	@Test
	public void selectContributeEssay() {
		List<ContributeEssay> list=checkEssayMapper.selectContributeEssay();
		System.out.println(list.size());
	}
	//selectEssayComment
	/*public void selectEssayComment() {
		List<CuntributeEssay>
	}*/
	

}
