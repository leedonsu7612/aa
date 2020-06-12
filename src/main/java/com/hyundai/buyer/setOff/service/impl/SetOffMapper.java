package com.hyundai.buyer.setOff.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.setOff.service.SetOffVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * SetOff에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.23
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.23          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("buyerSetOffMapper")
public class SetOffMapper extends EgovAbstractMapper {

	/**
	 * 대리점 상계지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 목록
	 * @exception Exception
	 */
	public List<SetOffVO> selectBuyerSetOffList(Map<String, Object> params) throws Exception {
		return selectList("selectBuyerSetOffList", params);
	}

	/**
	 * 대리점 상계지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 총 갯수
	 * @exception Exception
	 */
	public int selectBuyerSetOffListCnt(Map<String, Object> params) throws Exception {
		return selectOne("selectBuyerSetOffListCnt", params);
	}

	/**
	 * 대리점 상계지급 승인을 수정한다.
	 * @param setOffVO
	 * @exception Exception
	 */
	public int updateBuyerSetOff(SetOffVO setOffVO) throws Exception {
		return update("updateBuyerSetOff", setOffVO);
	}

}
