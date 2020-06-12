package com.hyundai.admin.abnormalHeeledSales.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.abnormalHeeledSales.service.AbnormalHeeledSalesService;
import com.hyundai.admin.abnormalHeeledSales.service.AbnormalHeeledSalesVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : AbnormalHeeledSalesServiceImpl.java
 * @Description : AbnormalHeeledSales Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.22    CDF Team       최초생성
 *
 * @author CDF Team
 * @since 2018.11.22
 * @version 1.0
 *
 */

@Service("abnormalHeeledSalesService")
public class AbnormalHeeledSalesServiceImpl extends EgovAbstractServiceImpl implements AbnormalHeeledSalesService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AbnormalHeeledSalesServiceImpl.class);

	@Resource(name="abnormalHeeledSalesMapper")
	private AbnormalHeeledSalesMapper abnormalHeeledSalesDAO;

	@Override
	public List<?> selectAbnormalHeeledSalesList(AbnormalHeeledSalesVO searchVO) throws Exception {
		return abnormalHeeledSalesDAO.selectAbnormalHeeledSalesList(searchVO);
	}

	@Override
	public int selectAbnormalHeeledSalesListTotCnt(AbnormalHeeledSalesVO searchVO) {
		return abnormalHeeledSalesDAO.selectAbnormalHeeledSalesListTotCnt(searchVO);
	}

}
