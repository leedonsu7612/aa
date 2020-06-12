package com.hyundai.seller.officesItem.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.seller.officesItem.service.OfficesItemVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * sellerOfficesItemMapper에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.30
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.30          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("sellerOfficesItemMapper")
public class OfficesItemMapper extends EgovAbstractMapper {
	/**
	 * 품목점 목록을 조회한다.
	 * @param vo - 조회할 정보가 담긴 officesItemVO
	 * @return 품목점 목록
	 * @exception Exception
	 */
	public List<?> selectSellerOfficesItemList(OfficesItemVO officesItemVO) {
		return selectList("selectSellerOfficesItemList", officesItemVO);
	}

	

}
