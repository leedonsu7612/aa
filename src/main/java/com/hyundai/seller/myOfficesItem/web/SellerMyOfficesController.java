package com.hyundai.seller.myOfficesItem.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.seller.myOfficesItem.service.MyOfficesItemService;
import com.hyundai.seller.myOfficesItem.service.MyOfficesItemVO;

@Controller
public class SellerMyOfficesController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** OfficesItemService */
	@Resource(name = "sellerMyOfficesItemService")
	private MyOfficesItemService myOfficesItemService;

	/**
	 * 내 거래처 목록을 조회한다.
	 * @param myOfficesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/myOfficesItem/list.json")
	@ResponseBody
	public List<MyOfficesItemVO> selectMyOfficesItemList() throws Exception {
		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);
		MyOfficesItemVO myOfficesItemVO = new MyOfficesItemVO();
		myOfficesItemVO.setBusinessNo(user.getBusinessNo());
		List<MyOfficesItemVO> list = myOfficesItemService.selectSellerMyOfficesItemList(myOfficesItemVO);
		return list;
	}

	/**
	 * 내 거래처를 등록한다.
	 * @param myOfficesItemVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/myOfficesItem/insert.json", method = RequestMethod.POST , produces = "application/json")
	@ResponseBody
	public String insertMyOfficesItem(@ModelAttribute MyOfficesItemVO myOfficesItemVO) throws Exception {
		List<String> itemCodeList = myOfficesItemVO.getItemCodeList();

		// 내 거래처 조회
		List<MyOfficesItemVO> myOfficesItemList = myOfficesItemService.selectSellerMyOfficesItemList(myOfficesItemVO);

		// 내 거래처에 등록된 사업소 제외
		if (myOfficesItemList.size() > 0) {
			for (MyOfficesItemVO tmp : myOfficesItemList) {
				if (itemCodeList.contains(tmp.getItemCode())) {
					itemCodeList.remove(tmp.getItemCode());
				}
			}

			myOfficesItemVO.setItemCodeList(itemCodeList);
		}

		// 내 거래처 등록
		if (itemCodeList.size() > 0) {
			myOfficesItemService.insertSellerMyOfficesItem(myOfficesItemVO);
		}

		return "Success";
	}

	/**
	 * 내 거래처를 삭제한다.
	 * @param myOfficesItemVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/myOfficesItem/delete.json", method = RequestMethod.POST , produces = "application/json")
	@ResponseBody
	public String deleteSellerMyOfficesItem(@ModelAttribute MyOfficesItemVO myOfficesItemVO) throws Exception {
		myOfficesItemService.deleteSellerMyOfficesItem(myOfficesItemVO);

		return "Success";
	}

	// TODO 삭제
	/**
	 * 내 거래처 목록을 조회한다.
	 * @param myOfficesItemVO
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/myOfficesItem/list.do")
	public String selectMyOfficesItemList2(MyOfficesItemVO myOfficesItemVO, ModelMap model) throws Exception {
		// 로그인 정보
		if (RequestContextHolder.getRequestAttributes() == null) {
			return "redirect:/login.do";
		}

		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

		if (user == null || !user.getMembClass().equalsIgnoreCase("S")) {
			return "redirect:/login.do";
		}

		myOfficesItemVO.setBusinessNo(user.getBusinessNo());

		// 내 거래처 조회
		List<MyOfficesItemVO> list = myOfficesItemService.selectSellerMyOfficesItemList(myOfficesItemVO);

		model.addAttribute("list", list);
		model.addAttribute("vo", myOfficesItemVO);

		return "seller/old/myOfficesSearchPopup";
	}

}
