package com.hyundai.buyer.myOfficesItem.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.buyer.companysBilling.service.impl.CompanysBillingServiceImpl;
import com.hyundai.buyer.myOfficesItem.service.MyOfficesItemService;
import com.hyundai.buyer.myOfficesItem.service.MyOfficesItemVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : MyOfficesItemServiceImpl.java
 * @Description : Buyer MyOfficesItem Business Implement Class
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

@Service("buyerMyOfficesItemService")
public class MyOfficesItemServiceImpl extends EgovAbstractServiceImpl implements MyOfficesItemService {

	private static final Logger LOGGER = LoggerFactory.getLogger(CompanysBillingServiceImpl.class);

	@Resource(name="buyerMyOfficesItemMapper")
	private MyOfficesItemMapper myOfficesItemDAO;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/**
	 * 내 거래처 목록을 조회한다.
	 * @param vo - 조회할 정보가 담긴 myOfficesItemVO
	 * @return 내 거래처 목록
	 * @exception Exception
	 */
	@Override
	public List<MyOfficesItemVO> selectBuyerMyOfficesItemList(MyOfficesItemVO myOfficesItemVO) throws Exception {
		return myOfficesItemDAO.selectBuyerMyOfficesItemList(myOfficesItemVO);
	}

	/**
	 * 내 거래처를 등록한다.
	 * @param vo - 등록할 정보가 담긴 myOfficesItemVO
	 * @return
	 * @exception Exception
	 */
	@Override
	public void insertBuyerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) throws Exception {
		myOfficesItemDAO.insert("insertBuyerMyOfficesItem", myOfficesItemVO);
	}

	/**
	 * 내 거래처를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 myOfficesItemVO
	 * @return
	 * @exception Exception
	 */
	@Override
	public void deleteBuyerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) throws Exception {
		myOfficesItemDAO.update("deleteBuyerMyOfficesItem", myOfficesItemVO);
	}

}
