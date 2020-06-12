package com.hyundai.seller.changeOrApprove.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundai.seller.changeOrApprove.service.ChangeOrApproveService;
import com.hyundai.seller.changeOrApprove.service.ChangeOrApproveVO;
import com.hyundaicommercial.cdf.blockchain.Interface;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @Class Name : ChangeOrApproveController.java.java
 * @Description : seller ChangeOrApproveController.java Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.1   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.12.1
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class ChangeOrApproveController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** sellerChangeOrApproveService */
	@Resource(name = "sellerChangeOrApproveService")
	private ChangeOrApproveService sellerChangeOrApproveService;

	/**
	 * 채권만기일 변경승인 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/seller/changeOrApprove/list.do")
	public String selectSellerChangeOrApproveList(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		// 로그인 정보
		if (RequestContextHolder.getRequestAttributes() == null) {
			return "redirect:/login.do";
		}

		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

		if (user == null || !user.getMembClass().equalsIgnoreCase("S")) {
			return "redirect:/login.do";
		}

		params.put("sellerBizNo", user.getBusinessNo());

		// 날짜 정보
		String endDate = (String) params.get("endDate");
		String startDate = (String) params.get("startDate");

		if (startDate == null || "".equals(startDate) || endDate == null || "".equals(endDate)) {
			DateFormat dateFormat = new SimpleDateFormat("yyyy.MM");
			Calendar calendar = Calendar.getInstance();
			params.put("endDate", dateFormat.format(calendar.getTime()));
			calendar.add(Calendar.MONTH, -6);
			params.put("startDate", dateFormat.format(calendar.getTime()));
		}

		List<ChangeOrApproveVO> list = sellerChangeOrApproveService.selectSellerChangeOrApproveList(params);

		model.addAttribute("user", user);
		model.addAttribute("menuId", "0402_01");
		model.addAttribute("params", params);
		model.addAttribute("list", list);

		return "seller/changeOrApproveList";
	}

	/**
	 * 채권만기일 변경||취소 요청을 승인한다.
	 * @param jsonData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/changeOrApprove/change.json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<String, String> changeChangeOrApprove(@RequestParam(value="jsonData") String jsonData) throws Exception {
		Map<String, String> resultMap = new HashMap<>();

		Gson gson = new Gson();
		List<ChangeOrApproveVO> params = gson.fromJson(jsonData, new TypeToken<List<ChangeOrApproveVO>>() {}.getType());

		for(ChangeOrApproveVO item : params) {
			String progressFlag = item.getProgressFlag();

			if("4".equals(progressFlag)) { // 변경 승인
				item.setProgressFlag("5");
				// 매출채권 정보 업데이트
				sellerChangeOrApproveService.updateSellerAccountReceivable(item);

				// 매출채권 변경 이력 업데이트
				sellerChangeOrApproveService.updateSellerReceivableChange(item);

				// 월매출 정보 업데이트

			} else if("6".equals(progressFlag)) { // 취소 승인
				item.setProgressFlag("7");

			}
		}

		resultMap.put("resultMessage", "Success");
		return resultMap;
	}

	/**
	 * 채권만기일 변경||취소 요청을 반려한다.
	 * @param jsonData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/seller/changeOrApprove/reject.json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<String, String> rejectChangeOrApprove(@RequestParam(value="jsonData") String jsonData) throws Exception {
		Map<String, String> resultMap = new HashMap<>();

		Gson gson = new Gson();
		List<ChangeOrApproveVO> params = gson.fromJson(jsonData, new TypeToken<List<ChangeOrApproveVO>>() {}.getType());

		for(ChangeOrApproveVO item : params) {
			// 매출채권 변경 이력 업데이트
			sellerChangeOrApproveService.updateSellerReceivableChange(item);

			// 매출채권 정보 업데이트
			sellerChangeOrApproveService.updateSellerAccountReceivable(item);

			// TODO 월매출 정보 업데이트
			// 채권발행금액 수정필요할 것 같은데, 현재 매출채권 테이블에는 매출월에 대한 정보가 없음.
		}

		resultMap.put("resultMessage", "Success");
		return resultMap;
	}

	// TODO 삭제
	/*@RequestMapping(value = "/seller/changeOrApprove/popup.do")
	public String changeOrApprove() throws Exception {
		System.out.println("팝업 ========================> start");
		return "seller/old/requestPopup";
	}*/

	/*@RequestMapping(value = "/seller/changeOrApprove/change.json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<String, String> InsertchangeJson(@RequestParam("jsonData") String jsonData) throws Exception {
		System.out.println("InsertchangeJson ========================> start");
		Map<String, String> resultMap = new HashMap<>();

		// TODO : 매출채권 매출채건 변경승인
		Gson gson = new Gson();
		List<ChangeOrApproveVO> params = gson.fromJson(jsonData, new TypeToken<List<ChangeOrApproveVO>>() {
		}.getType());

		ChangeOrApproveVO vo = null;
		for (ChangeOrApproveVO item : params) { // 임시 거래번호 생성(pk 제약조건)
			Random generator = new Random();
			int num = generator.nextInt();
			num = num < 0 ? num * -1 : num;
			item.setTransactionNo("T" + num);
			if (vo == null) vo = item;
		}
		// 매출채권 생성
		ANCTS_RECEIVABLE_EXPIRE_CHANGE(jsonData, vo);
		sellerChangeOrApproveService.insertSellerChangeOrApprove(params);
		resultMap.put("resultMessage", "Success");
		return resultMap;
	}

	@RequestMapping(value = "/seller/changeOrApprove/reject.json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String updateSellerChangeOrApprove(@RequestParam("arrstr") String arrStr) throws Exception {
		System.out.println("selectSellerrejectListJson ========================> start");

		return "Success";
	}*/

	/**
	 * 매출 채권 만기일 변경
	 * @param input stringified JSON object
	 * @return output
	 */
	public void ANCTS_RECEIVABLE_EXPIRE_CHANGE(String input, ChangeOrApproveVO vo) {
		Interface bcInterface = null;
		try {
			bcInterface = new Interface();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//		System.out.println(String.format("Method: %s, Input data: %s\n", "ANCTS_RECEIVABLE_CREATE", input));
		JSONObject result = new JSONObject();
		result.put("ACNTS_NO", vo.getTransactionNo()); //매출채권번호
		result.put("expiration_date", vo.getBeforeExpiDate());//발행일
		result.put("STATUS", "1");///1:성공 2:실팰
		result.put("ERROR_MSG", "");
		/*
		 * JSONObject json = new JSONObject(); json.put("obj", obj);
		 */
		System.out.println(String.format("Method: %s, output data: %s\n", "ANCTS_RECEIVABLE_EXPIRE_CHANGE", result.toString()));
		//		return json.toString();

	}

}
