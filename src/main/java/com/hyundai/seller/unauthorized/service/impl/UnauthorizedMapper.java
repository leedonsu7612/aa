package com.hyundai.seller.unauthorized.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.seller.unauthorized.service.UnauthorizedVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * Unauthorized에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.30
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.30          CDF Team        최초 생성
 *
 * </pre>
 */
@Repository("sellerUnauthorizedMapper")
public class UnauthorizedMapper  extends EgovAbstractMapper{

	public List<UnauthorizedVO> selectSellerUnauthorizedList(Map<String, Object> params) throws Exception {
		return selectList("selectSellerUnauthorizedList", params);
	}

	public int selectSellerUnauthorizedListCnt(Map<String, Object> params) throws Exception {
		return selectOne("selectSellerUnauthorizedListCnt", params);
	}

	public int insertSellerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception {
		return insert("insertSellerUnauthorized", unauthorizedVO);
	}

	public int updateSellerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception {
		return update("updateSellerUnauthorized", unauthorizedVO);
	}

}
