package com.pxxy.handleMenuscript.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.bean.Fund;
import com.pxxy.handleMenuscript.bean.LeaveMessage;
import com.pxxy.handleMenuscript.mapper.EssayInfoMapper;
import com.pxxy.handleMenuscript.service.IEssayInfoService;

@RunWith(SpringRunner.class)
@ContextConfiguration({ "classpath:application-dao.xml", "classpath:application-service.xml" })
public class TestCheckEssay {
	@Autowired
	private EssayInfoMapper essayInfoMapper;
	@Autowired
	private IEssayInfoService essayInfoService;

	@Test
	public void insertEssay() {

		EssayInfo essay = new EssayInfo();
		String date = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss").format(new Date());
		essay.setEssayId(date);
		essay.setTitle("title4444");
		essay.setUsername("123456");
		essay.setStyleId(1);
		essay.setAbstracts("abstracts4444");
		essay.setEnglishAbstract("englishAbstract4444");
		essay.setKeywords("setkeywords4444");
		essay.setEnglishKeywords("englishKeywords4444");
		essay.setContributor("contributor4444");
		essay.setContributeDate(new Date());
		essay.setContentUrl("contentUrl4444");
		essay.setStatusId(2);
		essay.setIsContribute(0);
		essay.setReference("reference4444");
		//essay.setFundId("1");
		// System.out.println(essay);
		essayInfoMapper.insertEssay(essay);
	}

	@Test
	public void selectAllEssay() {
		List<EssayInfo> essayList = essayInfoMapper.selectAllEssay();
		System.out.println(essayList);

	}

	@Test
	public void selectEssayByUsername() {
		List<EssayInfo> essayList = essayInfoMapper.selectEssayByUsername("123456");
		System.out.println(essayList);
	}

	@Test
	public void selectEssayByStatusId() {
		List<EssayInfo> essayList = essayInfoMapper.selectEssayByStatusId(2);
		System.out.println(essayList.size());
	}
	//202002211537
	@Test
	public void selectEssayById() {
		EssayInfo essay=essayInfoMapper.selectEssayById("202002211449");
		System.out.println(essay);
	}

	@Test
	public void updateEssayById() {
		EssayInfo essay = new EssayInfo();
		String date = new SimpleDateFormat("yyyy/MM/dd-HH:mm:ss").format(new Date());
		essay.setEssayId("2019/12-21 20:58:40");
		essay.setTitle("title.........");
		essay.setUsername("username........");
		essay.setStyleId(1);
		essay.setAbstracts("abstracts........");
		essay.setEnglishAbstract("englishAbstract........");
		essay.setKeywords("setkeywords........");
		essay.setEnglishKeywords("englishKeywords........");
		essay.setContributor("contributor........");
		essay.setContributeDate(new Date());
		essay.setContentUrl("contentUrl");
		essay.setStatusId(2);
		essay.setIsContribute(3);
		essay.setReference("reference");
		essayInfoMapper.updateEssayById(essay);
	}

	@Test
	public void preUpdateEssayById() {
		EssayInfo essayInfo = essayInfoMapper.selectEssayById("202002211054");
		System.out.println(essayInfo);
	}

	/* 批量删除 */
	@Test
	public void deleteEssayById() {
		String[] essayIds = { "2020-01-02 17:29:58", "2020-01-02 17:30:30", "2020-01-02 17:31:31" };
		essayInfoMapper.deleteEssayById(essayIds);
	}

	@Test
	public void selectEssayByUsernameAndStatusId() {
		List<EssayInfo> list = essayInfoMapper.selectEssayByUsernameAndStatusId("123456", 0);
		System.out.println(list);
	}

	/* ======================添加稿件基金信息============== */
	@Test
	public void insertFund() {
		Fund fund = new Fund();
		fund.setFundId("1");
		fund.setFundLevel("博士点");
		fund.setFundCName("基金中文名");
		fund.setFundEName("基金英文名");
		fund.setFundNumber("基金号");
		fund.setFundPs("基金备注");
		essayInfoService.insertFund(fund);
		System.out.println(fund);
	}
	/*@Test
	public void selectFundById() {
		Fund fund = essayInfoService.selectFundById("1");
		System.out.println("selectFundById:" + fund);
	}*/
	@Test
	public void delectFundById() {
		essayInfoService.deleteFundById("202002211440");
	}
	
	
	/* ======================留言信息操作============== */
	@Test
	public void insertLMessage() {
		LeaveMessage leaveMessage=new LeaveMessage();
		leaveMessage.setLeaveMessageId(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		leaveMessage.setEssayId("2020/01/30-15:28:30");
		leaveMessage.setUsername("123456");
		leaveMessage.setlMessageTime(new Date());
		leaveMessage.setlMessageContent("留言信息lMessageContent");
		leaveMessage.setlMessageState(0);
		essayInfoService.insertLeaveMessage(leaveMessage);
		
	}
	
	@Test
	public void selectLMessage() {
		LeaveMessage LeaveMessage=essayInfoService.selectLMessageById("2020-02-17 11:39");
		System.out.println(LeaveMessage);
	}
	@Test
	public void selectLMessageByUserAState() {
		PageInfo<LeaveMessage> pageInfo=essayInfoService.selectLMessageByUsernameAState(1, 2, "123456", 0);
		System.out.println(pageInfo);
	}
	
	@Test
	public void selectLMessageByUsernameAState() {
		PageInfo<LeaveMessage> pageInfo=essayInfoService.selectLMessageByUsernameAState(1, 2, "123456", 0);
		System.out.println(pageInfo);
	}
	//selectEssayByStatusId

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
