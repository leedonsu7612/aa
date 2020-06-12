package com.hyundai.buyer.officesItem.web;

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

import com.hyundai.buyer.officesItem.service.OfficesItemService;
import com.hyundai.buyer.officesItem.service.OfficesItemVO;

/**
 * @Class Name : OfficesItemController.java
 * @Description : Buyer Offices Item Controller Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.20   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.20
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BuyerOfficesController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** OfficesItemService */
	@Resource(name = "buyerOfficesItemService")
	private OfficesItemService officesItemService;

	/**
	 * 품목점 목록을 조회한다.
	 * @param officesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buyer/officesItem/list.do")
	public String selectOfficesItemList(@ModelAttribute OfficesItemVO officesItemVO, ModelMap model) throws Exception {
		// 품목점 조회
		List<?> list = officesItemService.selectBuyerOfficesItemList(officesItemVO);

		model.addAttribute("list", list);
		model.addAttribute("vo", officesItemVO);

		return "buyer/old/officesSearchPopup";
	}

	/**
	 * 품목점 목록을 조회한다.
	 * @param officesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buyer/officesItem/list.json", method = RequestMethod.POST,  produces = "application/json")
	@ResponseBody
	public List<?> selectOfficesItemListJson(@RequestParam("keyword") String keyword) throws Exception {
		OfficesItemVO officesItemVO = new OfficesItemVO();
		officesItemVO.setSearchKeyword(keyword);

		// 품목점 조회
		List<?> list = officesItemService.selectBuyerOfficesItemList(officesItemVO);

		return list;
	}
}
