package com.hyundai.buyer.accountReceivable.service;

import java.util.List;
import java.util.Map;

/**
 * @Class Name : AccountReceivableService.java
 * @Description : Buyer AccountReceivableService Class
 * @Modification Information
 * @
 * @  수정일      수정자      수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.28   CDF Team    최초생성
 *
 * @author CDF Team
 * @since 2018.11.28
 * @version 1.0
 *
 */

public interface AccountReceivableService {

	/**
	 * 대리점 채권만기일 목록을 조회한다.
	 * @param params
	 * @return 대리점 채권만기일 목록
	 * @exception Exception
	 */
	public List<AccountReceivableVO> selectAccountReceivable(Map<String, Object> params) throws Exception;

	/**
	 * 대리점 매출채권 팩토링 목록을 조회한다.
	 * @param params
	 * @return 대리점 매출채권 팩토링 목록
	 * @exception Exception
	 */
	public List<AccountReceivableVO> selectAccountReceivableList(Map<String, Object> params) throws Exception;

	/**
	 * 매출채권을 등록한다.
	 * @param params
	 * @return
	 * @exception Exception
	 */
	public int insertAccountReceivable(List<AccountReceivableVO> params) throws Exception;

	/**
	 * 만기일 변경을 요청한다.
	 * @param receivableChangeVO
	 * @return
	 * @throws Exception
	 */
	public int insertReceivableChange(List<ReceivableChangeVO> params) throws Exception;

}
