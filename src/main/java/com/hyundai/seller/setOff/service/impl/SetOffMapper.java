package com.hyundai.seller.setOff.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.hyundai.seller.setOff.service.SetOffVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * SetOff에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.12.1
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.12.1          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("sellerSetOffMapper")
public class SetOffMapper extends EgovAbstractMapper {

	/**
	 * 대리점 상계지급 승인 목록을 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 목록
	 * @exception Exception
	 */
	public List<SetOffVO> selectSetOffList(Map<String, Object> params) throws Exception {
		return selectList("selectSetOffList", params);
	}

	/**
	 * 대리점 상계지급 승인 총 갯수를 조회한다.
	 * @param params
	 * @return 대리점 상계지급 승인 총 갯수
	 * @exception Exception
	 */
	public int selectSetOffListCnt(Map<String, Object> params) throws Exception {
		return selectOne("selectSetOffListCnt", params);
	}

	public int insertSetOff(SetOffVO setOffVO) throws Exception {
		return insert("insertSetOff", setOffVO);
	}

	public int updateSellerSetOff(SetOffVO setOffVO) throws Exception {
		return update("updateSellerSetOff", setOffVO);
	}

}
