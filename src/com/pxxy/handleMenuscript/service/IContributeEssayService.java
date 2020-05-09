package com.pxxy.handleMenuscript.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.pxxy.handleMenuscript.bean.ContributeEssay;
import com.pxxy.handleMenuscript.bean.UserInfo;
/**
 * 
 * @author ASUS
 *
 */
public interface IContributeEssayService {
	/**
	 * 添加审核稿件信息
	 * @param checkEssay
	 */
	void insertContributeEssay(ContributeEssay cEssay);
	/**
	 * 查询所有审核稿件信息
	 * @return
	 */
	PageInfo<ContributeEssay> selectAllCheckEssay();
	/**
	 * 加载分类稿件信息
	 * @param profession
	 * @return
	 */
	List<UserInfo> selectUserByProfession(Integer profession);
	/**
	 * 查询已分配稿件信息
	 */
	PageInfo<ContributeEssay> selectContributeEssay(int pageCode, int pageSize);
	//专家操作
	/**
	 * 专家查询待审核稿件
	 * @param userId
	 * @return
	 */
	PageInfo<ContributeEssay> selectEssayByUserId(String userId,Integer statusId,int pageCode, int pageSize);
	/**
	 * 在 分配表中删除
	 * @param contributeId
	 */
	void delectContributeById(String[] contributeId);
	/**
	 * 根据稿件id加载 其分配信息（批量删除）
	 * @param essayId
	 * @return
	 */
	List<ContributeEssay> selectContributeById(String essayId);
	
}
