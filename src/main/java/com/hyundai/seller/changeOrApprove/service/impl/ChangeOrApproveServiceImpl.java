package com.hyundai.seller.changeOrApprove.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.seller.changeOrApprove.service.ChangeOrApproveService;
import com.hyundai.seller.changeOrApprove.service.ChangeOrApproveVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : ChangeOrApproveServiceImpl.java
 * @Description : seller ChangeOrApprove Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.1   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.12.1
 * @version 1.0
 *
 */

@Service("sellerChangeOrApproveService")
public class ChangeOrApproveServiceImpl extends EgovAbstractServiceImpl implements ChangeOrApproveService {

	private static final Logger LOGGER = LoggerFactory.getLogger(ChangeOrApproveServiceImpl.class);

	@Resource(name = "sellerChangeOrApproveMapper")
	private ChangeOrApproveMapper changeOrApproveDAO;

	/**
	 * 채권만기일 변경승인 목록을 조회한다.
	 * @param params
	 * @return 채권만기일 변경승인 목록
	 * @exception Exception
	 */
	@Override
	public List<ChangeOrApproveVO> selectSellerChangeOrApproveList(Map<String, Object> params) throws Exception {
		List<ChangeOrApproveVO> list = changeOrApproveDAO.selectSellerChangeOrApproveList(params);
		return list;
	}

	@Override
	public int selectSellerChangeOrApproveListCnt(Map<String, Object> params) throws Exception {
		return changeOrApproveDAO.selectSellerChangeOrApproveListCnt(params);
	}

	@Override
	public int updateSellerReceivableChange(ChangeOrApproveVO sellerChangeOrApproveVO) throws Exception {
		return changeOrApproveDAO.updateSellerReceivableChange(sellerChangeOrApproveVO);
	}

	@Override
	public int updateSellerAccountReceivable(ChangeOrApproveVO sellerChangeOrApproveVO) throws Exception {
		return changeOrApproveDAO.updateSellerAccountReceivable(sellerChangeOrApproveVO);

	}

}
