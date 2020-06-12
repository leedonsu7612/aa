package com.hyundai.admin.guarantee.service;

import java.util.List;

import com.hyundai.buyer.salesBilling.service.DfrdAcntsRcvbleVO;

/**
 * @Class Name : GuaranteeService.java
 * @Description : GuaranteeService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.26   CDF Team        최초생성
 *
 * @author cdf dev
 * @since 2018.11.26
 * @version 1.0
 *
 */

public interface GuaranteeService {

	/**
	 * 보증내역을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 보증내역 목록
	 * @exception Exception
	 */
	List<?> selectGuaranteeList(GuaranteeVO searchVO) throws Exception;

	/**
	 * 보증내역 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 보증내역 총 갯수
	 * @exception
	 */
	int selectGuaranteeListTotCnt(GuaranteeVO searchVO);

	/**
	 * 매출채권목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출채권 목록
	 * @exception Exception
	 */
	List<?> selectDfrdAcntsRcvbleList(DfrdAcntsRcvbleVO searchVO) throws Exception;

	/**
	 * 매출채권목록 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출채권목록 총 갯수
	 * @exception
	 */
	int selectDfrdAcntsRcvbleListTotCnt(DfrdAcntsRcvbleVO searchVO);

	/**
	 * 기타수금목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 기타수금 목록
	 * @exception Exception
	 */
	List<?> selectExtraCollectionList(ExtraCollectionVO searchVO) throws Exception;

	/**
	 * 기타수금목록 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 기타수금목록 총 갯수
	 * @exception
	 */
	int selectExtraCollectionListTotCnt(ExtraCollectionVO searchVO);

	/**
	 * 상계수금목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 상계수금 목록
	 * @exception Exception
	 */
	List<?> selectSetOffInfoList(SetOffInfoVO searchVO) throws Exception;

	/**
	 * 상계수금목록 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 상계수금목록 총 갯수
	 * @exception
	 */
	int selectSetOffInfoListTotCnt(SetOffInfoVO searchVO);

	/**
	 * 세금계산서목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 세금계산서 목록
	 * @exception Exception
	 */
	List<?> selectTaxbillList(TaxbillVO searchVO) throws Exception;

	/**
	 * 세금계산서목록 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 세금계산서목록 총 갯수
	 * @exception
	 */
	int selectTaxbillListTotCnt(TaxbillVO searchVO);

	/**
	 * 매출전표목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출전표 목록
	 * @exception Exception
	 */
	List<?> selectSalesSlipList(SalesSlipVO searchVO) throws Exception;

	/**
	 * 매출전표목록 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출전표목록 총 갯수
	 * @exception
	 */
	int selectSalesSlipListTotCnt(SalesSlipVO searchVO);

	/**
	 * 미발행채권목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 미발행채권 목록
	 * @exception Exception
	 */
	List<?> selectUnissuedList(UnissuedVO searchVO) throws Exception;
}
