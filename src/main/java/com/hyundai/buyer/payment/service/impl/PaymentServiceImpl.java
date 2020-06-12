package com.hyundai.buyer.payment.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.buyer.payment.service.PaymentService;
import com.hyundai.buyer.payment.service.PaymentVO;
import com.hyundai.buyer.salesBilling.service.impl.SalesBillingServiceImpl;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : PaymentServiceImpl.java
 * @Description : Buyer Payment Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.26   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.26
 * @version 1.0
 *
 */

@Service("buyerPaymentService")
public class PaymentServiceImpl extends EgovAbstractServiceImpl implements PaymentService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SalesBillingServiceImpl.class);

	@Resource(name = "buyerPaymentMapper")
	private PaymentMapper paymentDAO;

	/**
	 * 대리점 결제내역 목록을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 목록
	 * @exception Exception
	 */
	@Override
	public List<PaymentVO> selectBuyerPaymentList(Map<String, Object> params) throws Exception {
		List<PaymentVO> list = paymentDAO.selectBuyerPaymentList(params);
		for(PaymentVO item : list) {
			item.setSendStatus(this.getSendStatusText(item.getSendStatus()));
		}
		return list;
	}

	/**
	 * 대리점 결제내역 총 갯수을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 총 갯수
	 * @exception Exception
	 */
	@Override
	public int selectBuyerPaymentListCnt(Map<String, Object> params) throws Exception {
		return paymentDAO.selectBuyerPaymentListCnt(params);
	}

	/**
	 * 대리점 결제내역 총 합계을 조회한다.
	 * @param params
	 * @return 대리점 결제내역 총 합계
	 * @exception Exception
	 */
	@Override
	public long selectBuyerPaymentSummary(Map<String, Object> params) throws Exception {
		return paymentDAO.selectBuyerPaymentSummary(params);
	}

	/** 진행상태 코드 -> 텍스트 변환 */
	private String getSendStatusText(String sendStatus) {
		if (sendStatus.equals("0")) {
			return "결제완료";
		} else if (sendStatus.equals("1")) {
			return "결제대기";
		} else if (sendStatus.equals("2")) {
			return "기타지급요청";
		} else if (sendStatus.equals("12")) {
			return "기타지급승인";
		} else if (sendStatus.equals("13")) {
			return "기타지급취소";
		} else if (sendStatus.equals("31")) {
			return "상계지급요청";
		} else if (sendStatus.equals("30")) {
			return "상계지급승인";
		} else if (sendStatus.equals("39")) {
			return "상계지급취소";
		} else if (sendStatus.equals("3")) {
			return "대출승인";
		} else if (sendStatus.equals("4")) {
			return "변경요청";
		} else if (sendStatus.equals("5")) {
			return "변경완료";
		} else if (sendStatus.equals("6")) {
			return "취소요청";
		} else if (sendStatus.equals("7")) {
			return "취소완료";
		} else {
			return "-";
		}
	}

}
