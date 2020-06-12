package com.hyundai.seller.setOff.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : SellerSetOffService.java
 * @Description : seller SellerSetOffService Class
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

public interface SetOffService {

	/**
	 * 대리점 상계지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 목록
	 * @exception Exception
	 */
	public List<SetOffVO> selectSetOffList(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 상계지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 총 갯수
	 * @exception Exception
	 */
	public int selectSetOffListCnt(Map<String, Object> params) throws Exception;

	public int insertSetOff(SetOffVO setOffVO) throws Exception;

	public int updateSellerSetOff(SetOffVO setOffVO) throws Exception;

}
