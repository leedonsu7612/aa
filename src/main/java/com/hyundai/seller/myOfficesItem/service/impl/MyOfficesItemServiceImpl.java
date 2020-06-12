package com.hyundai.seller.myOfficesItem.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.seller.myOfficesItem.service.MyOfficesItemService;
import com.hyundai.seller.myOfficesItem.service.MyOfficesItemVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SellerMyOfficesItemServiceImpl.java
 * @Description : seller MyOfficesItem Business Implement Class
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

@Service("sellerMyOfficesItemService")
public class MyOfficesItemServiceImpl extends EgovAbstractServiceImpl implements MyOfficesItemService {

	private static final Logger LOGGER = LoggerFactory.getLogger(MyOfficesItemServiceImpl.class);

	@Resource(name="sellerMyOfficesItemMapper")
	private MyOfficesItemMapper myOfficesItemDAO;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	@Override
	public List<MyOfficesItemVO> selectSellerMyOfficesItemList(MyOfficesItemVO myOfficesItemVO) {
		return myOfficesItemDAO.selectSellerMyOfficesItemList(myOfficesItemVO);
	}


	@Override
	public void deleteSellerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) {
		myOfficesItemDAO.update("deleteSellerMyOfficesItem", myOfficesItemVO);
		
	}

	@Override
	public void insertSellerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) {
		myOfficesItemDAO.insert("insertSellerMyOfficesItem", myOfficesItemVO);
		
	}


}
