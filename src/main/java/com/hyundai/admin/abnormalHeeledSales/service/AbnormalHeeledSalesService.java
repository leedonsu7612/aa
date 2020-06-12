package com.hyundai.admin.abnormalHeeledSales.service;

import java.util.List;

/**
 * @Class Name : AbnormalHeeledSalesService.java
 * @Description : AbnormalHeeledSalesService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.22   CDF Team        최초생성
 *
 * @author cdf dev
 * @since 2018.11.22
 * @version 1.0
 *
 */

public interface AbnormalHeeledSalesService {

	/**
	 * 매출분포 이상거래 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출분포 이상거래 목록
	 * @exception Exception
	 */
	List<?> selectAbnormalHeeledSalesList(AbnormalHeeledSalesVO searchVO) throws Exception;

	/**
	 * 매출분포 이상거래 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출분포 이상거래 총 갯수
	 * @exception
	 */
	int selectAbnormalHeeledSalesListTotCnt(AbnormalHeeledSalesVO searchVO);

}
