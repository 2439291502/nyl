package com.pxxy.handleMenuscript.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.bean.Fund;
import com.pxxy.handleMenuscript.bean.LeaveMessage;
import com.pxxy.handleMenuscript.mapper.EssayInfoMapper;
import com.pxxy.handleMenuscript.mapper.FundMapper;
import com.pxxy.handleMenuscript.mapper.LeaveMessageMapper;
/**
 * 稿件信息业务层
 * @author ASUS
 *
 */
@Service
public class EssayInfoService implements IEssayInfoService {
	@Resource
	private EssayInfoMapper essayMapper; // 稿件基本信息

	@Resource
	private FundMapper fundMapper; // 稿件基金信息

	@Resource
	private LeaveMessageMapper LMessageMapper; // 留言信息

	/* ======================添加稿件基本信息================ */
	@Override
	public PageInfo<EssayInfo> selectAllEssay(int pageCode, int pageSize) {
		PageHelper.startPage(pageCode, pageSize);
		List<EssayInfo> essayInfoList = essayMapper.selectAllEssay();
		PageInfo<EssayInfo> pageInfo = new PageInfo<>(essayInfoList);
		return pageInfo;
	}

	@Override
	public PageInfo<EssayInfo> selectEssayByUsername(int pageCode, int pageSize, String username) {
		PageHelper.startPage(pageCode, pageSize);
		List<EssayInfo> essayInfoList = essayMapper.selectEssayByUsername(username);
		PageInfo<EssayInfo> pageInfo = new PageInfo<>(essayInfoList);
		return pageInfo;
	}

	@Override
	public PageInfo<EssayInfo> selectEssayByStatusId(Integer statusId,int pageCode, int pageSize) {
		PageHelper.startPage(pageCode, pageSize);
		List<EssayInfo> essayInfoList = essayMapper.selectEssayByStatusId(statusId);
		PageInfo<EssayInfo> pageInfo = new PageInfo<>(essayInfoList);
		return pageInfo;
	}

	@Override
	public PageInfo<EssayInfo> selectEssayByUsernameAndStatusId(int pageCode, int pageSize, String username,
			Integer statusId) {
		PageHelper.startPage(pageCode, pageSize);
		List<EssayInfo> essayInfoList = essayMapper.selectEssayByUsernameAndStatusId(username, statusId);
		// System.out.println("essayInfoList:"+essayInfoList);
		PageInfo<EssayInfo> pageInfo = new PageInfo<>(essayInfoList);
		return pageInfo;
	}

	@Override
	public void insertEssay(EssayInfo essayInfo) {
		// TODO Auto-generated method stub
		essayMapper.insertEssay(essayInfo);
	}

	@Override
	public void updateEssayById(EssayInfo essayInfo) {
		// TODO Auto-generated method stub
		essayMapper.updateEssayById(essayInfo);
	}

	@Override
	public EssayInfo preLoadEssayById(String essayId) {
		// TODO Auto-generated method stub
		return essayMapper.selectEssayById(essayId);
	}

	@Override
	public void deleteEssayByIds(String[] essayIds) {
		// TODO Auto-generated method stub
		essayMapper.deleteEssayById(essayIds);
		
	}
	@Override
	public void updateEssayIds(String[] essayIds) {
		// TODO Auto-generated method stub
		essayMapper.updateEssayIds(essayIds);
	}

	

	/* ======================添加稿件基金信息============== */
	@Override
	public void insertFund(Fund fund) {
		// TODO Auto-generated method stub
		fundMapper.insertFund(fund);

	}

	 
	@Override
	public void deleteFundById(String fundId) {
		// TODO Auto-generated method stub
		fundMapper.deleteFundById(fundId);
	}

	/* ======================添加稿件留言信息================ */
	@Override
	public void insertLeaveMessage(LeaveMessage leaveMessage) {
		// TODO Auto-generated method stub
		LMessageMapper.insertLeaveMessage(leaveMessage);
	}

	@Override
	public LeaveMessage selectLMessageById(String leaveMessageId) {
		// TODO Auto-generated method stub
		return LMessageMapper.selectLMessageById(leaveMessageId);
	}

	@Override
	public PageInfo<LeaveMessage> selectLMessageByUsernameAState(int pageCode, int pageSize, String username,
			Integer lMessageState) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<LeaveMessage> listlMessage = LMessageMapper.selectLMessageByUsernameAState(username, lMessageState);
		PageInfo<LeaveMessage> pageInfo = new PageInfo<>(listlMessage);
		return pageInfo;
	}

	@Override
	public PageInfo<LeaveMessage> selectLMessageByState(Integer lMessageState,int pageCode, int pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<LeaveMessage> listlMessage = LMessageMapper.selectLMessageByState(lMessageState);
		PageInfo<LeaveMessage> pageInfo = new PageInfo<>(listlMessage);
		return pageInfo;
	}

	@Override
	public void deleteLMessageById(String leaveMessageId) {
		// TODO Auto-generated method stub
		LMessageMapper.deleteLMessageById(leaveMessageId);
	}

	@Override
	public void updateLMessageById(LeaveMessage lMessage) {
		// TODO Auto-generated method stub
		LMessageMapper.updateLMessageById(lMessage);
	}

	@Override
	public LeaveMessage selectLMessageByEssayId(String essayId) {
		// TODO Auto-generated method stub
		return LMessageMapper.selectLMessageByEssayId(essayId);
	}

	@Override
	public PageInfo<LeaveMessage> selectGetLMessage(int pageCode, int pageSize, String username,
			Integer lMessageState) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageCode, pageSize);
		List<LeaveMessage> listlMessage = LMessageMapper.selectGetLMessage(username,lMessageState);
		PageInfo<LeaveMessage> pageInfo = new PageInfo<>(listlMessage);
		return pageInfo;
	}

	@Override
	public List<Fund> selectFundByEssayId(String essayId) {
		// TODO Auto-generated method stub
		return fundMapper.selectFundByEssayId(essayId);
	}

}
