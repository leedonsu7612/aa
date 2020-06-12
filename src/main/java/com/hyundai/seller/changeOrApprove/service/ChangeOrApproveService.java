package com.hyundai.seller.changeOrApprove.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : ChangeOrApproveService.java
 * @Description : Buyer ChangeOrApproveService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.28   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.28
 * @version 1.0
 *
 */

public interface ChangeOrApproveService {

	/**
	 * 채권만기일 변경승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 채권만기일 목록
	 * @exception Exception
	 */
	public List<ChangeOrApproveVO> selectSellerChangeOrApproveList(Map<String, Object> params) throws Exception;

	public int selectSellerChangeOrApproveListCnt(Map<String, Object> params)throws Exception;

	public int updateSellerReceivableChange(ChangeOrApproveVO sellerChangeOrApproveVO) throws Exception;

	public int updateSellerAccountReceivable(ChangeOrApproveVO sellerChangeOrApproveVO) throws Exception;

}
