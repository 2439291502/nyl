package com.pxxy.handleMenuscript.handle;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import com.pxxy.handleMenuscript.bean.Paper;
import com.pxxy.handleMenuscript.mapper.PaperMapper;
@Component
public class LoadLastPaperListener implements ServletContextListener {

	@Autowired
	@Qualifier("paperMapper")
	private PaperMapper paperMapper;
	private ApplicationContext context;
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		context=new ClassPathXmlApplicationContext("classpath:application-dao.xml");
		ServletContext application=sce.getServletContext();
		paperMapper=(PaperMapper) context.getBean("paperMapper");
		String year=paperMapper.selectNewPaperYear();
		String issue=paperMapper.selectNewPaperIssue(year);
		List<Paper> paperList=paperMapper.selectPaperByYearAIssue(year, issue);
		application.setAttribute("paperList", paperList);
	}

}
