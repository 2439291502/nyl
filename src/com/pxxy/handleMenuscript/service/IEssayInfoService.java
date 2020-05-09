package com.pxxy.handleMenuscript.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.EssayInfo;
import com.pxxy.handleMenuscript.bean.Fund;
import com.pxxy.handleMenuscript.bean.LeaveMessage;
import com.pxxy.handleMenuscript.bean.Paper;

public interface IEssayInfoService {
	/**
	 * 分页查询所有的稿件
	 * 
	 * @param pageCode
	 * @param pageSize
	 * @return
	 */
	PageInfo<EssayInfo> selectAllEssay(int pageCode, int pageSize);

	/**
	 * 通过作者名查询所有稿件
	 * 
	 * @param pageCode
	 * @param pageSize
	 * @param username
	 * @return
	 */
	PageInfo<EssayInfo> selectEssayByUsername(int pageCode, int pageSize, String username);

	/**
	 * 通过稿件状态查询稿件
	 * 
	 * @param pageCode
	 * @param pageSize
	 * @param statusId
	 * @return
	 */
	PageInfo<EssayInfo> selectEssayByStatusId(Integer statusId, int pageCode, int pageSize);

	/**
	 * 通过作者名及稿件状态查询所有稿件
	 * 
	 * @param pageCode
	 * @param pageSize
	 * @param username
	 * @param StatusId
	 * @return
	 */
	PageInfo<EssayInfo> selectEssayByUsernameAndStatusId(int pageCode, int pageSize, String username, Integer StatusId);

	/**
	 * 作者添加稿件
	 * 
	 * @param essayInfo
	 */
	void insertEssay(EssayInfo essayInfo);

	/**
	 * 通过稿件编号更新稿件信息
	 * 
	 * @param essayInfo
	 */
	void updateEssayById(EssayInfo essayInfo);

	/**
	 * 加载稿件essayId
	 * 
	 * @param username
	 * @param essayId
	 * @return
	 */
	EssayInfo preLoadEssayById(String essayId);

	/**
	 * 通过稿件ids批量删除稿件
	 * 
	 * @param essayId
	 */
	void deleteEssayByIds(String[] essayIds);

	/**
	 * updateEssayIds
	 * 
	 * @param essayIds
	 */
	void updateEssayIds(String[] essayIds);

	/* ======================添加稿件基金信息============== */
	/**
	 * 添加基金
	 * 
	 * @param fund
	 */
	void insertFund(Fund fund);

	/**
	 * 查询基金
	 * 
	 * @param fundId
	 * @return
	 */
	List<Fund> selectFundByEssayId(String essayId);

	/**
	 * 删除基金项
	 * 
	 * @param fundId
	 */
	void deleteFundById(String fundId);

	/* ======================添加留言信息============== */
	/**
	 * 添加留言
	 * 
	 * @param LeaveMessage
	 */
	void insertLeaveMessage(LeaveMessage leaveMessage);

	/**
	 * 查询留言
	 * 
	 * @param LeaveMessageId
	 * @return
	 */
	LeaveMessage selectLMessageById(@Param(value = "leaveMessageId") String leaveMessageId);

	/**
	 * 用户查询留言
	 * 
	 * @param LeaveMessageId
	 * @return
	 */
	PageInfo<LeaveMessage> selectLMessageByUsernameAState(int pageCode, int pageSize,
	 String username, Integer lMessageState);

	/**
	 * 用户查询留言
	 * 
	 * @param LeaveMessageId
	 * @return
	 */
	PageInfo<LeaveMessage> selectLMessageByState(@Param(value = "lMessageState") Integer lMessageState,int pageCode, int pageSize);

	/**
	 * 通过稿件ID查询留言
	 * 
	 * @param essayId
	 * @return
	 */
	LeaveMessage selectLMessageByEssayId(@Param(value = "essayId") String essayId);

	/**
	 * 删除留言
	 * 
	 * @param LeaveMessageId
	 */
	void deleteLMessageById(@Param(value = "leaveMessageId") String leaveMessageId);

	/**
	 * 修改
	 * 
	 * @param lMessage
	 * @return
	 */
	void updateLMessageById(LeaveMessage lMessage);
	PageInfo<LeaveMessage> selectGetLMessage(int pageCode, int pageSize,String username,Integer lMessageState);

	//查询稿件的基金列表
	
}
