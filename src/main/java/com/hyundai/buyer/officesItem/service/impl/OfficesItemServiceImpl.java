package com.hyundai.buyer.officesItem.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.buyer.companysBilling.service.impl.CompanysBillingServiceImpl;
import com.hyundai.buyer.officesItem.service.OfficesItemService;
import com.hyundai.buyer.officesItem.service.OfficesItemVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : OfficesItemServiceImpl.java
 * @Description : Buyer OfficesItem Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.20   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.20
 * @version 1.0
 *
 */

@Service("buyerOfficesItemService")
public class OfficesItemServiceImpl extends EgovAbstractServiceImpl implements OfficesItemService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CompanysBillingServiceImpl.class);

	@Resource(name="buyerOfficesItemMapper")
	private OfficesItemMapper officesItemDAO;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 품목점 목록을 조회한다.
	 * @param vo - 조회할 정보가 담긴 officesItemVO
	 * @return 품목점 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectBuyerOfficesItemList(OfficesItemVO officesItemVO) throws Exception {
		return officesItemDAO.selectBuyerOfficesItemList(officesItemVO);
	}

}
