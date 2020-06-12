package com.hyundai.buyer.taxBill.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.taxBill.service.TaxBillVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * TaxBill에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.28
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.28          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("buyerTaxBillMapper")
public class TaxBillMapper extends EgovAbstractMapper {

	/**
	 * 대리점 세금계산서 목록을 조회한다.
	 * @param params
	 * @return 대리점 세금계산서 목록
	 * @exception Exception
	 */
	public List<TaxBillVO> selectBuyerTaxBillList(Map<String, Object> params) throws Exception {
		return selectList("selectBuyerTaxBillList", params);
	}

	/**
	 * 대리점 세금계산서 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 세금계산서 총 갯수
	 * @exception Exception
	 */
	public int selectBuyerTaxBillListCnt(Map<String, Object> params) throws Exception {
		return selectOne("selectBuyerTaxBillListCnt", params);
	}

	/**
	 * 대리점 세금계산서를 조회한다.
	 * @param params
	 * @return 대리점 세금계산서
	 * @exception Exception
	 */
	public TaxBillVO selectBuyerTaxBill(Map<String, Object> params) throws Exception {
		return selectOne("selectBuyerTaxBill", params);
	}

}