package com.hyundai.buyer.myOfficesItem.service;

import java.util.List;

/**
 * @Class Name : MyOfficesItemService.java
 * @Description : Buyer MyOfficesItemService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.15   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.15
 * @version 1.0
 *
 */

public interface MyOfficesItemService {

	/**
	 * 내 거래처 목록을 조회한다.
	 * @param vo - 조회할 정보가 담긴 myOfficesItemVO
	 * @return 내 거래처 목록
	 * @exception Exception
	 */
	public List<MyOfficesItemVO> selectBuyerMyOfficesItemList(MyOfficesItemVO myOfficesItemVO) throws Exception;

	/**
	 * 내 거래처를 등록한다.
	 * @param vo - 등록할 정보가 담긴 myOfficesItemVO
	 * @return
	 * @exception Exception
	 */
	public void insertBuyerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) throws Exception;

	/**
	 * 내 거래처를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 myOfficesItemVO
	 * @return
	 * @exception Exception
	 */
	public void deleteBuyerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) throws Exception;
}
