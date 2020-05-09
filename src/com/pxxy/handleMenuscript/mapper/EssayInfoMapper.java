package com.pxxy.handleMenuscript.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pxxy.handleMenuscript.bean.EssayInfo;

public interface EssayInfoMapper {
	/**
	 * 查询所有的稿件
	 * 
	 * @return
	 */
	List<EssayInfo> selectAllEssay();

	/**
	 * 通过作者名称查询其所有稿件
	 * 
	 * @param username
	 * @return
	 */
	List<EssayInfo> selectEssayByUsername(@Param(value="username")String username);
	/**
	 * 通过稿件状态查询稿件
	 * @param statusId
	 * @return
	 */
	List<EssayInfo> selectEssayByStatusId(@Param(value="statusId")Integer statusId);

	/**
	 * 作者添加稿件
	 * 
	 * @param essay
	 */
	void insertEssay(EssayInfo essayInfo);
	/**
	 * 通过稿件编号更新稿件信息 
	 * @param essayId
	 */
	void updateEssayById(EssayInfo essayInfo);
	/**
	 * 通过作者名及稿件状态查询所有稿件
	 * @param username
	 * @param StatusId
	 * @return
	 */
	List<EssayInfo> selectEssayByUsernameAndStatusId(@Param(value="contributor")String contributor,@Param(value="statusId")Integer statusId);
	/**
	 * 加载稿件
	 * @param username
	 * @param essayId
	 * @return
	 */
	EssayInfo selectEssayById(@Param(value="essayId")String essayId);
	/**
	 * 通过稿件id批量删除稿件
	 * @param essayId
	 */
	void deleteEssayById(String[] essayIds);
	/**
	 * updateEssayIds
	 * @param essayIds
	 */
	void updateEssayIds(String[] essayIds);
	
	
}