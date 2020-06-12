package com.hyundai.admin.guarantee.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.guarantee.service.ExtraCollectionVO;
import com.hyundai.admin.guarantee.service.GuaranteeService;
import com.hyundai.admin.guarantee.service.GuaranteeVO;
import com.hyundai.admin.guarantee.service.SalesSlipVO;
import com.hyundai.admin.guarantee.service.SetOffInfoVO;
import com.hyundai.admin.guarantee.service.TaxbillVO;
import com.hyundai.admin.guarantee.service.UnissuedVO;
import com.hyundai.buyer.myOfficesItem.service.MyOfficesItemVO;
import com.hyundai.buyer.salesBilling.service.DfrdAcntsRcvbleVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : GuaranteeServiceImpl.java
 * @Description : Guarantee Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.20    CDF Team       최초생성
 *
 * @author CDF Team
 * @since 2018.11.26
 * @version 1.0
 *
 */

@Service("guaranteeService")
public class GuaranteeServiceImpl extends EgovAbstractServiceImpl implements GuaranteeService {

	private static final Logger LOGGER = LoggerFactory.getLogger(GuaranteeServiceImpl.class);

	@Resource(name="guaranteeMapper")
	private GuaranteeMapper guaranteeDAO;

	@Override
	public List<?> selectGuaranteeList(GuaranteeVO searchVO) throws Exception {
		return guaranteeDAO.selectGuaranteeList(searchVO);
	}

	@Override
	public int selectGuaranteeListTotCnt(GuaranteeVO searchVO) {
		return guaranteeDAO.selectGuaranteeListTotCnt(searchVO);
	}

	@Override
	public List<?> selectDfrdAcntsRcvbleList(DfrdAcntsRcvbleVO searchVO) throws Exception {
		List<DfrdAcntsRcvbleVO> list = guaranteeDAO.selectDfrdAcntsRcvbleList(searchVO);
		if (list.size() > 0) {
			for (DfrdAcntsRcvbleVO vo : list) {
				vo.setProgressFlag(getProgressStatus(vo.getProgressFlag(), searchVO.getMembClass()));
			}
		}
		return list;
	}

	@Override
	public int selectDfrdAcntsRcvbleListTotCnt(DfrdAcntsRcvbleVO searchVO) {
		return guaranteeDAO.selectDfrdAcntsRcvbleListTotCnt(searchVO);
	}

	@Override
	public List<?> selectExtraCollectionList(ExtraCollectionVO searchVO) throws Exception {
		List<ExtraCollectionVO> list = guaranteeDAO.selectExtraCollectionList(searchVO);
		if (list.size() > 0) {
			for (ExtraCollectionVO vo : list) {
				vo.setProgressFlag(getProgressStatus(vo.getProgressFlag(), searchVO.getMembClass()));
			}
		}
		return list;
	}

	@Override
	public int selectExtraCollectionListTotCnt(ExtraCollectionVO searchVO) {
		return guaranteeDAO.selectExtraCollectionListTotCnt(searchVO);
	}

	@Override
	public List<?> selectSetOffInfoList(SetOffInfoVO searchVO) throws Exception {
		List<SetOffInfoVO> list = guaranteeDAO.selectSetOffInfoList(searchVO);
		if (list.size() > 0) {
			for (SetOffInfoVO vo : list) {
				vo.setProgressFlag(getProgressStatus(vo.getProgressFlag(), searchVO.getMembClass()));
			}
		}
		return list;
	}

	@Override
	public int selectSetOffInfoListTotCnt(SetOffInfoVO searchVO) {
		return guaranteeDAO.selectSetOffInfoListTotCnt(searchVO);
	}

	@Override
	public List<?> selectTaxbillList(TaxbillVO searchVO) throws Exception {
		return guaranteeDAO.selectTaxbillList(searchVO);
	}

	@Override
	public int selectTaxbillListTotCnt(TaxbillVO searchVO) {
		return guaranteeDAO.selectTaxbillListTotCnt(searchVO);
	}

	@Override
	public List<?> selectSalesSlipList(SalesSlipVO searchVO) throws Exception {
		return guaranteeDAO.selectSalesSlipList(searchVO);
	}

	@Override
	public int selectSalesSlipListTotCnt(SalesSlipVO searchVO) {
		return guaranteeDAO.selectSalesSlipListTotCnt(searchVO);
	}
	
	@Override
	public List<?> selectUnissuedList(UnissuedVO searchVO) throws Exception {
		return guaranteeDAO.selectUnissuedList(searchVO);
	}

	public String getProgressStatus(String progressFlag, String membClass){
	    if (progressFlag.equalsIgnoreCase("0"))
	        return "결제완료";
	    else if (progressFlag.equalsIgnoreCase("1") && membClass.equalsIgnoreCase("B"))
	        return "결제대기";
	    else if (progressFlag.equalsIgnoreCase("1") && membClass.equalsIgnoreCase("S"))
	        return "결제대기";
	    else if (progressFlag.equalsIgnoreCase("2") && membClass.equalsIgnoreCase("B"))
	        return "기타지급요청";
	    else if (progressFlag.equalsIgnoreCase("2") && membClass.equalsIgnoreCase("S"))
	        return "기타수금요청";
	    else if (progressFlag.equalsIgnoreCase("3"))
	        return "대출승인";
	    else if (progressFlag.equalsIgnoreCase("4"))
	        return "변경요청";


	    /*
	    else if (progressFlag.equalsIgnoreCase("6") && membClass.equalsIgnoreCase("B"))
	        return "결제대기";
	    else if (progressFlag.equalsIgnoreCase("6") && membClass.equalsIgnoreCase("S"))
	        return "대출요청";
	     */

	    else if (progressFlag.equalsIgnoreCase("5"))
	        return "결제대기";
	    else if (progressFlag.equalsIgnoreCase("6"))
	        return "취소요청";
	    else if (progressFlag.equalsIgnoreCase("7"))
	        return "결제대기";

	    else if (progressFlag.equalsIgnoreCase("9"))
	        return "결제전송중";

	    else if (progressFlag.equalsIgnoreCase("12") && membClass.equalsIgnoreCase("B"))
	        return "기타지급승인";// 승인완료
	    else if (progressFlag.equalsIgnoreCase("12") && membClass.equalsIgnoreCase("S"))
	        return "기타수금승인";// 승인완료
	    else if (progressFlag.equalsIgnoreCase("13") && membClass.equalsIgnoreCase("B"))
	        return "기타지급취소";
	    else if (progressFlag.equalsIgnoreCase("13") && membClass.equalsIgnoreCase("S"))
	        return "기타수금취소";

	    else if (progressFlag.equalsIgnoreCase("31") ) {
	    	if( membClass.equalsIgnoreCase("B"))
	    		return "상계지급요청";// 승인완료
	    	else if (membClass.equalsIgnoreCase("S"))
	    		return "상계수금요청";// 승인완료
	    }else if (progressFlag.equalsIgnoreCase("30") ) {
	    	if( membClass.equalsIgnoreCase("B"))
	    		return "상계지급승인";// 승인완료
	    	else if (membClass.equalsIgnoreCase("S"))
	    		return "상계수금승인";// 승인완료
	    } else if (progressFlag.equalsIgnoreCase("39") ) {
	    	if( membClass.equalsIgnoreCase("B"))
	    		return "상계지급취소";// 승인완료
	    	else if (membClass.equalsIgnoreCase("S"))
	    		return "상계수금취소";// 승인완료
	    }

	    return "";
	}
}
