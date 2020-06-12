package com.hyundai.seller.unauthorized.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.seller.unauthorized.service.UnauthorizedService;
import com.hyundai.seller.unauthorized.service.UnauthorizedVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SellerUnauthorizedServiceImpl.java
 * @Description : seller Unauthorized Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.30   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.30
 * @version 1.0
 *
 */
@Service("sellerUnauthorizedService")
public class UnauthorizedServiceImpl extends EgovAbstractServiceImpl implements UnauthorizedService {

	private static final Logger LOGGER = LoggerFactory.getLogger(UnauthorizedServiceImpl.class);

	@Resource(name = "sellerUnauthorizedMapper")
	private UnauthorizedMapper unauthorizedDAO;

	@Override
	public List<UnauthorizedVO> selectSellerUnauthorizedList(Map<String, Object> params) throws Exception {
		return unauthorizedDAO.selectSellerUnauthorizedList(params);
	}

	@Override
	public int selectSellerUnauthorizedListCnt(Map<String, Object> params) throws Exception {
		return unauthorizedDAO.selectSellerUnauthorizedListCnt(params);
	}

	@Override
	public int insertSellerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception {
		return unauthorizedDAO.insertSellerUnauthorized(unauthorizedVO);
	}

	@Override
	public int updateSellerUnauthorized(UnauthorizedVO unauthorizedVO) throws Exception {
		return unauthorizedDAO.updateSellerUnauthorized(unauthorizedVO);
	}

}
