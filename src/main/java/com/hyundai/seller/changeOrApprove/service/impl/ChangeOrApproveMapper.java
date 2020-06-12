package com.hyundai.seller.changeOrApprove.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.seller.changeOrApprove.service.ChangeOrApproveVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * ChangeOrApprove에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.12.1
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.12.1          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("sellerChangeOrApproveMapper")
public class ChangeOrApproveMapper extends EgovAbstractMapper {

	/**
	 * 채권만기일 변경승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 채권만기일 목록
	 * @exception Exception
	 */
	public List<ChangeOrApproveVO> selectSellerChangeOrApproveList(Map<String, Object> params) throws Exception {
		return selectList("selectSellerChangeOrApproveList", params);
	}

	/**
	 * 채권만기일 변경승인 총 갯수을 조회한다.
	 * @param params
	 * @return 대리점 채권만기일 총 갯수
	 * @exception Exception
	 */
	public int selectSellerChangeOrApproveListCnt(Map<String, Object> params) {
		return selectOne("selectSellerChangeOrApproveListCnt", params);
	}

	/**
	 * 매출채권 변경이력를 수정한다.
	 * @param sellerChangeOrApproveVO
	 * @exception Exception
	 */
	public int updateSellerReceivableChange(ChangeOrApproveVO sellerChangeOrApproveVO) throws Exception {
		return update("updateSellerReceivableChange", sellerChangeOrApproveVO);
	}

	/**
	 * 매출채권 정보를 수정한다.
	 * @param sellerChangeOrApproveVO
	 * @exception Exception
	 */
	public int updateSellerAccountReceivable(ChangeOrApproveVO sellerChangeOrApproveVO) throws Exception {
		return update("updateSellerAccountReceivable", sellerChangeOrApproveVO);
	}

}
