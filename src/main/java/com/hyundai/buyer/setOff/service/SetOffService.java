package com.hyundai.buyer.setOff.service;

import java.util.List;
import java.util.Map;

import com.hyundai.buyer.setOff.service.SetOffVO;

/**
 * @Class Name : SetOffService.java
 * @Description : Buyer SetOffService Class
 * @Modification Information
 * @
 * @  수정일         수정자       수정내용
 * @ ------------   ----------   -------------------------------
 * @  2018.11.23     CDF Team     최초생성
 *
 * @author CDF Team
 * @since 2018.11.23
 * @version 1.0
 *
 */

public interface SetOffService {

	/**
	 * 대리점 상계지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 목록
	 * @exception Exception
	 */
	public List<SetOffVO> selectBuyerSetOffList(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 상계지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 총 갯수
	 * @exception Exception
	 */
	public int selectBuyerSetOffListCnt(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 상계지급 승인을 수정한다.
	 * @param setOffVO
	 * @exception Exception
	 */
	public int updateBuyerSetOff(SetOffVO setOffVO) throws Exception;

}
