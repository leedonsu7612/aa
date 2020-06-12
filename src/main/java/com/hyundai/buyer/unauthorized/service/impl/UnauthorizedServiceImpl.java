package com.hyundai.buyer.unauthorized.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.buyer.salesBilling.service.impl.SalesBillingServiceImpl;
import com.hyundai.buyer.unauthorized.service.UnauthorizedService;
import com.hyundai.buyer.unauthorized.service.UnauthorizedVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : UnauthorizedServiceImpl.java
 * @Description : Buyer Unauthorized Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.21   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.21
 * @version 1.0
 *
 */

@Service("buyerUnauthorizedService")
public class UnauthorizedServiceImpl extends EgovAbstractServiceImpl implements UnauthorizedService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SalesBillingServiceImpl.class);

	@Resource(name = "buyerUnauthorizedMapper")
	private UnauthorizedMapper unauthorizedDAO;

	/**
	 * 대리점 기타지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 기타지급 승인 목록
	 * @exception Exception
	 */
	@Override
	public List<UnauthorizedVO> selectBuyerUnauthorizedList(Map<String, Object> params) throws Exception {
		return unauthorizedDAO.selectBuyerUnauthorizedList(params);
	}

	/**
	 * 대리점 기타지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 기타지급 승인 총 갯수
	 * @exception Exception
	 */
	@Override
	public int selectBuyerUnauthorizedListCnt(Map<String, Object> params) throws Exception {
		return unauthorizedDAO.selectBuyerUnauthorizedListCnt(params);
	}

	/**
	 * 대리점 기타지급 승인을 수정한다.
	 * @param unauthorizedVO
	 * @exception Exception
	 */
	@Override
	public int updateBuyerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception {
		return unauthorizedDAO.updateBuyerUnauthorized(unauthorizedVO);
	}

}
