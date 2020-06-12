package com.hyundai.seller.officesItem.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.seller.officesItem.service.OfficesItemService;
import com.hyundai.seller.officesItem.service.OfficesItemVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SellerOfficesItemServiceImpl.java
 * @Description : seller OfficesItem Business Implement Class
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

@Service("sellerOfficesItemService")
public class OfficesItemServiceImpl extends EgovAbstractServiceImpl implements OfficesItemService {

	private static final Logger LOGGER = LoggerFactory.getLogger(OfficesItemServiceImpl.class);

	@Resource(name="sellerOfficesItemMapper")
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
	public List<?> selectSellerOfficesItemList(OfficesItemVO officesItemVO) throws Exception {
		return officesItemDAO.selectSellerOfficesItemList(officesItemVO);
	}


}
