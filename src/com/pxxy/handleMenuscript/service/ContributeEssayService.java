package com.pxxy.handleMenuscript.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.ContributeEssay;
import com.pxxy.handleMenuscript.bean.UserInfo;
import com.pxxy.handleMenuscript.mapper.ContributeEssayMapper;
/**
 * 稿件分配审核专家业务层
 * @author ASUS
 *
 */
@Service
public class ContributeEssayService implements IContributeEssayService {
	@Resource
	private ContributeEssayMapper cEssayMapper;// 分配稿件操作

	@Override
	public void insertContributeEssay(ContributeEssay cEssay) {
		// TODO Auto-generated method stub
		cEssayMapper.insertContributeEssay(cEssay);

	}

	@Override
	public PageInfo<ContributeEssay> selectAllCheckEssay() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserInfo> selectUserByProfession(Integer profession) {
		// TODO Auto-generated method stub
		return cEssayMapper.selectUserByProfession(profession);
	}

	@Override
	public PageInfo<ContributeEssay> selectContributeEssay(int pageCode, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<ContributeEssay> cEssayList = cEssayMapper.selectContributeEssay();
		PageInfo<ContributeEssay> pageInfo = new PageInfo<>(cEssayList);
		return pageInfo;
	}

	@Override
	public PageInfo<ContributeEssay> selectEssayByUserId(String userId, Integer statusId, int pageCode, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<ContributeEssay> cEssayList = cEssayMapper.selectEssayByUserId(userId, statusId);
		PageInfo<ContributeEssay> pageInfo = new PageInfo<>(cEssayList);
		return pageInfo;
	}

	@Override
	public void delectContributeById(String[] contributeId) {
		// TODO Auto-generated method stub
		cEssayMapper.delectContributeById(contributeId);
	}

	@Override
	public List<ContributeEssay> selectContributeById(String essayId) {
		// TODO Auto-generated method stub
		return cEssayMapper.selectContributeById(essayId);
	}

}
