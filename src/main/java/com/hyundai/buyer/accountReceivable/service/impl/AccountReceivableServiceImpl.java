package com.hyundai.buyer.accountReceivable.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.buyer.accountReceivable.service.AccountReceivableService;
import com.hyundai.buyer.accountReceivable.service.AccountReceivableVO;
import com.hyundai.buyer.accountReceivable.service.ReceivableChangeVO;
import com.hyundai.buyer.companysBilling.service.impl.CompanysBillingServiceImpl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : AccountReceivableServiceImpl.java
 * @Description : Buyer AccountReceivable Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.28   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.28
 * @version 1.0
 *
 */

@Service("buyerAccountReceivableService")
public class AccountReceivableServiceImpl extends EgovAbstractServiceImpl implements AccountReceivableService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CompanysBillingServiceImpl.class);

	@Resource(name = "buyerAccountReceivableMapper")
	private AccountReceivableMapper buyerAccountReceivableDAO;

	/**
	 * 대리점 채권만기일 목록을 조회한다.
	 * @param params
	 * @return 대리점 채권만기일 목록
	 * @exception Exception
	 */
	@Override
	public List<AccountReceivableVO> selectAccountReceivable(Map<String, Object> params) throws Exception {
		// 그룹 정보
		String groupType = (String) params.get("groupType");

		if ("0".equals(groupType)) { // 현대
			params.put("groupCode", "_h");
		} else if ("1".equals(groupType)) {
			params.put("groupCode", "_k");
		} else {
			params.put("groupCode", "");
		}

		AccountReceivableVO accountReceivableVO = buyerAccountReceivableDAO.selectAccountReceivable(params);

		List<AccountReceivableVO> list = new ArrayList<>();

		if (accountReceivableVO != null) {
			for (int i = 0; i < 5; i++) {
				list.add(accountReceivableVO);
			}

			params.put("maxRegDate", accountReceivableVO.getMaxRegDate());
		}

		return list;
	}

	/**
	 * 대리점 매출채권 팩토링 목록을 조회한다.
	 * @param params
	 * @return 대리점 매출채권 팩토링 목록
	 * @exception Exception
	 */
	@Override
	public List<AccountReceivableVO> selectAccountReceivableList(Map<String, Object> params) throws Exception {
		return buyerAccountReceivableDAO.selectAccountReceivableList(params);
	}

	/**
	 * 매출채권을 등록한다.
	 * @param params
	 * @return
	 * @exception Exception
	 */
	@Override
	public int insertAccountReceivable(List<AccountReceivableVO> params) throws Exception {
		return buyerAccountReceivableDAO.insertAccountReceivable(params);
	}

	/**
	 * 만기일 변경을 요청한다.
	 * @param receivableChangeVO
	 * @return
	 * @throws Exception
	 */
	@Override
	public int insertReceivableChange(List<ReceivableChangeVO> params) throws Exception {
		return buyerAccountReceivableDAO.insertReceivableChange(params);
	}


}
