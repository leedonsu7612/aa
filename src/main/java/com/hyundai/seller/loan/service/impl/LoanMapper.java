package com.hyundai.seller.loan.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.seller.loan.service.LoanVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * loan에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.12.5
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.12.5          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("sellerLoanMapper")
public class LoanMapper  extends EgovAbstractMapper{

	public List<LoanVO> selectSellerLoanList(Map<String, Object> params) {
		return selectList("selectSellerLoanList", params);
	}

	public int selectSellerLoanListCnt(Map<String, Object> params) {
		return selectOne("selectSellerLoanListCnt", params);
	}

}
