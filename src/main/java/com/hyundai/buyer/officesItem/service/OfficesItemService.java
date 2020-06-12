package com.hyundai.buyer.officesItem.service;

import java.util.List;

/**
 * @Class Name : OfficesItemService.java
 * @Description : Buyer OfficesItemService Class
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

public interface OfficesItemService {

	/**
	 * 품목점 목록을 조회한다.
	 * @param vo - 조회할 정보가 담긴 officesItemVO
	 * @return 품목점 목록
	 * @exception Exception
	 */
	public List<?> selectBuyerOfficesItemList(OfficesItemVO officesItemVO) throws Exception;

}
