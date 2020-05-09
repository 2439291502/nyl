package com.pxxy.handleMenuscript.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pxxy.handleMenuscript.bean.Fund;

/**
 * 基金表
 * @author ASUS
 *
 */
public interface FundMapper {
	
	/**
	 * 添加基金
	 * @param fund
	 */
	void insertFund(Fund fund);
	/**
	 * 查询基金
	 * @param fundId
	 * @return
	 */
	List<Fund> selectFundByEssayId(@Param(value="essayId")String essayId);
	/**
	 * 删除基金项
	 * @param fundId
	 */
	void deleteFundById(@Param(value="fundId")String fundId);
	

}