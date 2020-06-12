package com.hyundai.seller.setOff.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.seller.setOff.service.SetOffService;
import com.hyundai.seller.setOff.service.SetOffVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : SetOffServiceImpl.java
 * @Description : Buyer SetOff Business Implement Class
 * @Modification Information
 * @
 * @  수정일         수정자       수정내용
 * @ ------------   ----------   -------------------------------
 * @  2018.12.1     CDF Team     최초생성
 *
 * @author CDF Team
 * @since 2018.12.1
 * @version 1.0
 *
 */

@Service("sellerSetOffService")
public class SetOffServiceImpl extends EgovAbstractServiceImpl implements SetOffService {

	private static final Logger LOGGER = LoggerFactory.getLogger(SetOffServiceImpl.class);

	@Resource(name = "sellerSetOffMapper")
	private SetOffMapper setOffDAO;

	/**
	 * 대리점 기타지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 기타지급 승인 목록
	 * @exception Exception
	 */
	@Override
	public List<SetOffVO> selectSetOffList(Map<String, Object> params) throws Exception {
		return setOffDAO.selectSetOffList(params);
	}

	/**
	 * 대리점 기타지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 기타지급 승인 총 갯수
	 * @exception Exception
	 */
	@Override
	public int selectSetOffListCnt(Map<String, Object> params) throws Exception {
		return setOffDAO.selectSetOffListCnt(params);
	}

	@Override
	public int insertSetOff(SetOffVO setOffVO) throws Exception {
		return setOffDAO.insertSetOff(setOffVO);
	}

	@Override
	public int updateSellerSetOff(SetOffVO setOffVO) throws Exception {
		return setOffDAO.updateSellerSetOff(setOffVO);
	}

}
