package com.hyundai.buyer.accountReceivable.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.accountReceivable.service.AccountReceivableVO;
import com.hyundai.buyer.accountReceivable.service.ReceivableChangeVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * AccountReceivable에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.28
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.28          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("buyerAccountReceivableMapper")
public class AccountReceivableMapper extends EgovAbstractMapper {

	/**
	 * 대리점 채권만기일 목록을 조회한다.
	 * @param params
	 * @return 대리점 채권만기일 목록
	 * @exception Exception
	 */
	public AccountReceivableVO selectAccountReceivable(Map<String, Object> params) throws Exception {
		return selectOne("selectAccountReceivable", params);
	}

	/**
	 * 대리점 매출채권 팩토링 목록을 조회한다.
	 * @param params
	 * @return 대리점 매출채권 팩토링 목록
	 * @exception Exception
	 */
	public List<AccountReceivableVO> selectAccountReceivableList(Map<String, Object> params) throws Exception {
		return selectList("selectAccountReceivableList", params);
	}

	/**
	 * 채권을 등록한다.
	 * @param params
	 * @return
	 * @exception Exception
	 */
	public int insertAccountReceivable(List<AccountReceivableVO> params) throws Exception {
		return insert("insertAccountReceivable", params);
	}

	/**
	 * 매출채권 변경이력을 등록한다.
	 * @param params
	 * @return
	 * @exception Exception
	 */
	public int insertReceivableChange(List<ReceivableChangeVO> params) throws Exception {
		return insert("insertReceivableChange", params);
	}

	/**
	 * 매출채권 변경이력을 수정한다.
	 * @param params
	 * @return
	 * @exception Exception
	 */
	public int updateReceivableChange(List<AccountReceivableVO> params) throws Exception {
		return update("updateReceivableChange", params);
	}

}
