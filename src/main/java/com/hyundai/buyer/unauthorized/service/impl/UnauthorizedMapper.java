package com.hyundai.buyer.unauthorized.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.unauthorized.service.UnauthorizedVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * Unauthorized에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.21
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.21          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("buyerUnauthorizedMapper")
public class UnauthorizedMapper extends EgovAbstractMapper {

	/**
	 * 대리점 기타지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 기타지급 승인 목록
	 * @exception Exception
	 */
	public List<UnauthorizedVO> selectBuyerUnauthorizedList(Map<String, Object> params) throws Exception {
		return selectList("selectBuyerUnauthorizedList", params);
	}

	/**
	 * 대리점 기타지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 기타지급 승인 총 갯수
	 * @exception Exception
	 */
	public int selectBuyerUnauthorizedListCnt(Map<String, Object> params) throws Exception {
		return selectOne("selectBuyerUnauthorizedListCnt", params);
	}

	/**
	 * 대리점 기타지급 승인을 수정한다.
	 * @param unauthorizedVO
	 * @exception Exception
	 */
	public int updateBuyerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception {
		return update("updateBuyerUnauthorized", unauthorizedVO);
	}

}
