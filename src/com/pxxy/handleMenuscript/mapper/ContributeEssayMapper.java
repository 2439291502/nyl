package com.pxxy.handleMenuscript.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pxxy.handleMenuscript.bean.ContributeEssay;
import com.pxxy.handleMenuscript.bean.UserInfo;

public interface ContributeEssayMapper {
	/**
	 * 添加分配稿件信息
	 * @param cEssay
	 */
	void insertContributeEssay(ContributeEssay cEssay);
	/**
	 * 查询所有审核稿件
	 * @return
	 */
	List<ContributeEssay> selectAllCheckEssay();
	/**
	 * 加载分类稿件信息
	 * @param profession
	 * @return
	 */
	List<UserInfo> selectUserByProfession(Integer profession);
	
	/**
	 * 查询所有已分配稿件
	 */
	List<ContributeEssay> selectContributeEssay();
	
	/*==============专家操作分配表===================*/
	/**
	 * 专家查询待审核的用户表
	 * @param userId
	 * @return
	 */
	List<ContributeEssay> selectEssayByUserId(@Param(value="checkUserId")String checkUserId,@Param(value="statusId")Integer statusId);
	/**
	 * 在 分配表中删除
	 * @param contributeId
	 */
	void delectContributeById(String []contributeId);
	/**
	 * 根据稿件id加载 其分配信息
	 * @param essayId
	 * @return
	 */
	List<ContributeEssay> selectContributeById(String essayId);

}
