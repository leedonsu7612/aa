package com.hyundai.buyer.setOff.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.buyer.salesBilling.service.impl.SalesBillingServiceImpl;
import com.hyundai.buyer.setOff.service.SetOffService;
import com.hyundai.buyer.setOff.service.SetOffVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SetOffServiceImpl.java
 * @Description : Buyer SetOff Business Implement Class
 * @Modification Information
 * @
 * @  수정일         수정자       수정내용
 * @ ------------   ----------   -------------------------------
 * @  2018.11.23     CDF Team     최초생성
 *
 * @author CDF Team
 * @since 2018.11.23
 * @version 1.0
 *
 */

@Service("buyerSetOffService")
public class SetOffServiceImpl extends EgovAbstractServiceImpl implements SetOffService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SalesBillingServiceImpl.class);

	@Resource(name = "buyerSetOffMapper")
	private SetOffMapper setOffDAO;

	/**
	 * 대리점 상계지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 목록
	 * @exception Exception
	 */
	@Override
	public List<SetOffVO> selectBuyerSetOffList(Map<String, Object> params) throws Exception {
		return setOffDAO.selectBuyerSetOffList(params);
	}

	/**
	 * 대리점 상계지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 총 갯수
	 * @exception Exception
	 */
	@Override
	public int selectBuyerSetOffListCnt(Map<String, Object> params) throws Exception {
		return setOffDAO.selectBuyerSetOffListCnt(params);
	}

	/**
	 * 대리점 상계지급 승인을 수정한다.
	 * @param setOffVO
	 * @exception Exception
	 */
	@Override
	public int updateBuyerSetOff(SetOffVO setOffVO) throws Exception {
		return setOffDAO.updateBuyerSetOff(setOffVO);
	}

}
