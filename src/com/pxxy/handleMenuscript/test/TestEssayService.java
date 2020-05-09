package com.pxxy.handleMenuscript.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.mapper.EssayInfoMapper;
import com.pxxy.handleMenuscript.service.IEssayInfoService;

@RunWith(SpringRunner.class)
@ContextConfiguration({
	"classpath:application-dao.xml",
	"classpath:application-service.xml"
	})
public class TestEssayService {
	@Autowired
	private EssayInfoMapper essayMapper;
	@Autowired
	private IEssayInfoService essayInfoService;
	
	@Test
	public void selectEssayByUsername() {
		PageInfo<EssayInfo>  pageInfo=essayInfoService.selectEssayByUsername(1, 3, "username");
		System.out.println(pageInfo);
	}
	
	
	@Test
	public void selectEssayByUsernameAndStatusId() {
		PageInfo<EssayInfo>  pageInfo=essayInfoService.selectEssayByUsernameAndStatusId(1, 3, "123456",0);
		System.out.println(pageInfo);
		
	}
	/**
	 * 2019-12-21-20:59:20,2020-01-03-09:48:36,2020-01-03-09:49:00,2020-01-03-09:49:16
	 */
	//批量删除稿件
	@Test
	public void deleteEssayByIds() {
		// TODO Auto-generated method stub
		String[] essayIds= {"2019-12-21-20:59:20","2020-01-03-09:48:36"};
		essayMapper.deleteEssayById(essayIds);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}