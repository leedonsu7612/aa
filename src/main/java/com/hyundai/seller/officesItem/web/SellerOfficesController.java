package com.hyundai.seller.officesItem.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.seller.officesItem.service.OfficesItemService;
import com.hyundai.seller.officesItem.service.OfficesItemVO;

/**
 * @Class Name : SellerOfficesItemController.java
 * @Description : seller Offices Item Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.30   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.30
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Controller
public class SellerOfficesController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** sellerOfficesItemService */
	@Resource(name = "sellerOfficesItemService")
	private OfficesItemService officesItemService;


	/**
	 * 대리점 목록을 조회한다.
	 * @param officesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/officesItem/list.do")
	public String selectOfficesItemList(@ModelAttribute OfficesItemVO officesItemVO, ModelMap model) throws Exception {
		// 대리점 조회
		List<?> list = officesItemService.selectSellerOfficesItemList(officesItemVO);

		model.addAttribute("list", list);
		model.addAttribute("vo", officesItemVO);

		return "seller/old/officesSearchPopup";
	}

	/**
	 * 대리점 목록을 조회한다.
	 * @param officesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/officesItem/list.json", method = RequestMethod.POST,  produces = "application/json")
	@ResponseBody
	public List<?> selectSellerOfficesItemListJson(@RequestParam("keyword") String keyword) throws Exception {
		OfficesItemVO officesItemVO = new OfficesItemVO();
		officesItemVO.setSearchKeyword(keyword);

		// 대리점 조회
		List<?> list = officesItemService.selectSellerOfficesItemList(officesItemVO);

		return list;
	}

}
