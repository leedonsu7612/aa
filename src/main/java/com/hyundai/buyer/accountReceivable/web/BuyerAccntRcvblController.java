package com.hyundai.buyer.accountReceivable.web;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.hyundai.admin.member.service.CdfMemberService;
import com.hyundai.admin.member.service.MemberVO;
import com.hyundai.buyer.accountReceivable.service.AccountReceivableService;
import com.hyundai.buyer.accountReceivable.service.AccountReceivableVO;
import com.hyundai.buyer.accountReceivable.service.ReceivableChangeVO;
import com.hyundai.buyer.salesBilling.service.BuyerLimitVO;
import com.hyundai.buyer.salesBilling.service.SalesBillingService;
import com.hyundai.buyer.taxBill.service.TaxBillService;
import com.hyundai.buyer.taxBill.service.TaxBillVO;
import com.hyundai.cmmn.service.LoginVO;
import com.hyundaicommercial.cdf.blockchain.Interface;

/**
 * @Class Name : AccountReceivableController.java
 * @Description : Buyer AccountReceivableController Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.28   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.28
 * @version 1.0
 * @see
 *
 *  Copyright (C) by MOPAS All right reserved.
 */

@Controller
public class BuyerAccntRcvblController {

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	/** accountReceivableService */
	@Resource(name = "buyerAccountReceivableService")
	private AccountReceivableService accountReceivableService;

	/** CdfMemberService */
	@Resource(name = "memberService")
	private CdfMemberService memberService;

	/** buyerTaxBillService */
	@Resource(name = "buyerTaxBillService")
	private TaxBillService taxBillService;

	/** SalesBillingService */
	@Resource(name = "buyerSalesBillingService")
	private SalesBillingService salesBillingService;

	/**
	 * 대리점 채권만기일 목록을 조회한다.
	 * @param params
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/buyer/accountReceivable/list.do")
	public String selectAccountReceivable(@RequestParam Map<String, Object> params, ModelMap model) throws Exception {
		// 로그인 정보
		if (RequestContextHolder.getRequestAttributes() == null) {
			return "redirect:/login.do";
		}

		LoginVO user = (LoginVO) RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

		if (user == null || !user.getMembClass().equalsIgnoreCase("B")) {
			return "redirect:/login.do";
		}

		params.put("buyerBizNo", user.getBusinessNo());

		// 날짜 정보
		String searchDate = (String) params.get("searchDate");
		DateFormat dateFormat = new SimpleDateFormat("yyyy.MM");
		Calendar calendar = Calendar.getInstance();

		if (searchDate == null || "".equals(searchDate)) {
			searchDate = dateFormat.format(calendar.getTime());
			params.put("searchDate", searchDate);
		}

		// 구분
		String sellerBizNo = (String) params.get("targetBizNo");
		params.put("sellerBizNo", sellerBizNo);
		String groupType = (String) params.get("groupType");
		List<AccountReceivableVO> listH = new ArrayList<>();
		List<AccountReceivableVO> listK = new ArrayList<>();
		String maxRegDate = null;
		TaxBillVO taxBillH = new TaxBillVO();
		TaxBillVO taxBillK = new TaxBillVO();

		if (sellerBizNo != null && !"".equals(sellerBizNo)) {
			// 채권 발행 가능 금액 목록
			if (groupType != null && !"".equals(groupType)) {
				if (groupType.equals("0")) {
					listH = accountReceivableService.selectAccountReceivable(params);
				} else if (groupType.equals("1")) {
					listK = accountReceivableService.selectAccountReceivable(params);
				} else {
					params.put("groupType", "0");
					listH = accountReceivableService.selectAccountReceivable(params);
					params.put("groupType", "1");
					listK = accountReceivableService.selectAccountReceivable(params);
					params.put("groupType", "2");
				}

				maxRegDate = (String) params.get("maxRegDate");

				// TODO fix : 임시주석
				/*if (maxRegDate != null && !"".equals(maxRegDate) && !searchDate.equals(maxRegDate)) {
					searchDate = maxRegDate;
					params.put("searchDate", searchDate);
				}*/

				// 세금계산서 정보
				params.put("salesDate", params.get("searchDate"));

				if (groupType.equals("0")) {
					taxBillH = taxBillService.selectBuyerTaxBill(params);
				} else if (groupType.equals("1")) {
					taxBillK = taxBillService.selectBuyerTaxBill(params);
				} else {
					params.put("groupType", "0");
					taxBillH = taxBillService.selectBuyerTaxBill(params);
					params.put("groupType", "1");
					taxBillK = taxBillService.selectBuyerTaxBill(params);
					params.put("groupType", "2");
				}
			}

			// 품목점 정보
			MemberVO seller = new MemberVO();
			seller.setBusinessNo(sellerBizNo);
			seller = memberService.selectMember(seller);
			params.put("searchKeyword", seller.getCompanyName());
		}

		// 기산일 & 만기일
		Date date = new SimpleDateFormat("yyyy.MM").parse(searchDate);
		calendar.setTime(date);
		dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		calendar.add(Calendar.MONTH, +1);
		calendar.set(Calendar.DATE, 1);
		params.put("valueDate", dateFormat.format(calendar.getTime()));
		calendar.add(Calendar.DATE, +65);
		params.put("expirationDate", dateFormat.format(calendar.getTime()));

		// 대리점 한도 조회
		BuyerLimitVO buyerLimitVO = salesBillingService.selectBuyerSalesBillingLimit(params);

		model.addAttribute("buyerLimit", buyerLimitVO);
		model.addAttribute("user", user);
		model.addAttribute("menuId", "0501_01");
		model.addAttribute("params", params);
		model.addAttribute("listH", listH);
		model.addAttribute("listK", listK);
		model.addAttribute("taxBillH", taxBillH);
		model.addAttribute("taxBillK", taxBillK);

		return "buyer/accountReceivableList";
	}

	/**
	 * 매출 채권 생성
	 * @param jsonData
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buyer/salesBilling/unspecified.json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public Map<String, String> unspecifiedSalesBillingJson(@RequestParam("jsonData") String jsonData) throws Exception {
		Map<String, String> resultMap = new HashMap<>();

		Gson gson = new Gson();
		List<AccountReceivableVO> accountList = gson.fromJson(jsonData, new TypeToken<List<AccountReceivableVO>>() {}.getType());
		List<ReceivableChangeVO> changeList = new ArrayList<>();

		AccountReceivableVO vo = null;

		for(AccountReceivableVO item : accountList) { // 임시 거래번호 생성(pk 제약조건)
			Random generator = new Random();
			long num = generator.nextLong();
			num = num < 0 ? num * -1 : num;
			String transactionNo = "T" + num;
			item.setTransactionNo(transactionNo);
			if(vo == null) vo = item;

			ReceivableChangeVO receivableChangeVO = new ReceivableChangeVO();
			receivableChangeVO.setTransactionNo(transactionNo);
			receivableChangeVO.setBeforeExpiDate(item.getExpirationDate());
			receivableChangeVO.setExpirationAvg(item.getExpirationAvg());
			changeList.add(receivableChangeVO);
		}

		// 매출채권 생성
		//ANCTS_RECEIVABLE_CREATE(jsonData, vo);

		// TODO : 매출채권 정보 등록
		accountReceivableService.insertAccountReceivable(accountList);

		// TODO : 매출채권 정보 이력 등록
		accountReceivableService.insertReceivableChange(changeList);

		resultMap.put("resultMessage", "Success");
		return resultMap;
	}

	/**
	 * 만기일 변경을 요청한다.
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/buyer/salesBilling/change.json", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public String updateExpirationDate(@ModelAttribute ReceivableChangeVO receivableChangeVO) throws Exception {
		//int result = accountReceivableService.insertReceivableChange(receivableChangeVO);

		return "Success";
	}

	/**
	 * 매출 채권 생성
	 * @param input stringified JSON object
	 * @return output
	 */
	public void ANCTS_RECEIVABLE_CREATE(String input, AccountReceivableVO vo) {
		Interface bcInterface = null;
		try {
			bcInterface = new Interface();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//System.out.println(String.format("Method: %s, Input data: %s\n", "ANCTS_RECEIVABLE_CREATE", input.toString()));
		JSONObject result = new JSONObject();
		//result.put("ACNTS_NO", tranNo);
		result.put("TAXBILL_NO", "T1528203895");
		result.put("GROUP_TYPE", "0");
		result.put("ISSUER_NO", "7548700340"); //대리점
		result.put("OWNER_NO", "1298158379"); //품목점
		result.put("PAYMENT_DATE", "20181210");
		result.put("EXPIRATION_DATE", "20190105");
		result.put("AMOUNT", 1000);

		result.put("STATUS", "1");
		result.put("ERROR_MSG", "");
		//JSONObject json = new JSONObject();
		//json.put("result", result);
		System.out.println(String.format("Method: %s, Input data: %s\n", "ANCTS_RECEIVABLE_CREATE", result.toString()));
		//String test = helper.invokeChaincode("acntsreceivable", "ANCTS_RECEIVABLE_CREATE", input);
		//System.out.println(String.format("Method: %s, Test result: %s\n", "ANCTS_RECEIVABLE_CREATE", test));
		//return json.toString();
		//return helper.invokeChaincode(client, channel, "acntsreceivable", "ANCTS_RECEIVABLE_CREATE", input, retryCount, timeOut);
		String output = bcInterface.ANCTS_RECEIVABLE_CREATE(result.toString());
		System.out.println(String.format("Output: %s\n", output.toString()));
	}

	// TODO fix
	// 채권만기일 적수 계산
	@RequestMapping("/buyer/accountReceivable/expirationAvg.json")
	@ResponseBody
	public Map<String, Object> expirationAvg(@RequestParam String jsonData) {
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("expirationAvgH", 60);
		resultMap.put("expirationAvgk", 30);
		return resultMap;
	}

}
