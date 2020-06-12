package com.hyundai.seller.loan.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.seller.loan.service.LoanService;
import com.hyundai.seller.loan.service.LoanVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SellerLoanServiceImpl.java
 * @Description : seller loan Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.5   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.12.5
 * @version 1.0
 *
 */

@Service("sellerLoanService")
public class LoanServiceImpl extends EgovAbstractServiceImpl implements LoanService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoanServiceImpl.class);

	@Resource(name = "sellerLoanMapper")
	private LoanMapper loanDAO;

	@Override
	public int selectSellerLoanListCnt(Map<String, Object> params) {
		return loanDAO.selectSellerLoanListCnt(params);
	}

	@Override
	public List<LoanVO> selectSellerLoanList(Map<String, Object> params) {
		return loanDAO.selectSellerLoanList(params);
	}

}
