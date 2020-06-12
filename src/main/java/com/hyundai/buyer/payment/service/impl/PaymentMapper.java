package com.hyundai.buyer.payment.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.payment.service.PaymentVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * Payment에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.26
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.26          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("buyerPaymentMapper")
public class PaymentMapper extends EgovAbstractMapper {

	/**
	 * 대리점 결제내역 목록을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 목록
	 * @exception Exception
	 */
	public List<PaymentVO> selectBuyerPaymentList(Map<String, Object> params) throws Exception {
		return selectList("selectBuyerPaymentList", params);
	}

	/**
	 * 대리점 결제내역 총 갯수을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 총 갯수
	 * @exception Exception
	 */
	public int selectBuyerPaymentListCnt(Map<String, Object> params) throws Exception {
		return selectOne("selectBuyerPaymentListCnt", params);
	}

	/**
	 * 대리점 결제내역 총 합계을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 총 합계
	 * @exception Exception
	 */
	public long selectBuyerPaymentSummary(Map<String, Object> params) throws Exception {
		return selectOne("selectBuyerPaymentSummary", params);
	}

}
