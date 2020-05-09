package com.pxxy.handleMenuscript.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pxxy.handleMenuscript.bean.LeaveMessage;

/**
 * 留言表
 * 
 * @author ASUS
 *
 */
public interface LeaveMessageMapper {

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
	List<LeaveMessage> selectLMessageByUsernameAState(@Param(value = "username") String username,
			@Param(value = "lMessageState") Integer lMessageState);

	/**
	 * 通过稿件名查询留言
	 * 
	 * @param essayId
	 * @return
	 */
	LeaveMessage selectLMessageByEssayId(@Param(value = "essayId") String essayId);

	/**
	 * 查询留言状态
	 * 
	 * @param lMessageState
	 * @return
	 */
	List<LeaveMessage> selectLMessageByState(@Param(value = "lMessageState") Integer lMessageState);

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
	//回复稿件
	List<LeaveMessage> selectGetLMessage(@Param(value = "toUsername") String toUsername,
			@Param(value = "lMessageState") Integer lMessageState);

	

}