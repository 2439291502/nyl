package com.pxxy.handleMenuscript.mapper;

import com.pxxy.handleMenuscript.bean.AddressList;

public interface AddressListMapper {
	/**
	 * 添加联系人
	 * @param addressList
	 */
	void insertAList(AddressList addressList);
	/**
	 * 查询
	 * @param aListId
	 * @return
	 */
	AddressList selectAListById(String aListId);
	/**
	 * 删除
	 * @param aListId
	 */
	void deleteAListById(String aListId);

}
