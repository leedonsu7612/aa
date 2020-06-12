package com.hyundai.buyer.myOfficesItem.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.buyer.myOfficesItem.service.MyOfficesItemVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * BuyerMyOfficesItemMapper에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.20
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *   수정일              수정자          수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.20          CDF Team        최초 생성
 *
 * </pre>
 */

@Repository("buyerMyOfficesItemMapper")
public class MyOfficesItemMapper extends EgovAbstractMapper {

	/**
	 * 내 거래처 목록을 조회한다.
	 * @param vo - 조회할 정보가 담긴 myOfficesItemVO
	 * @return 내 거래처 목록
	 * @exception Exception
	 */
	public List<MyOfficesItemVO> selectBuyerMyOfficesItemList(MyOfficesItemVO myOfficesItemVO) throws Exception {
		return selectList("selectBuyerMyOfficesItemList", myOfficesItemVO);
	}

	/**
	 * 내 거래처를 등록한다.
	 * @param vo - 등록할 정보가 담긴 myOfficesItemVO
	 * @return
	 * @exception Exception
	 */
	public void insertBuyerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) throws Exception {
		insert("insertBuyerMyOfficesItem", myOfficesItemVO);
	}

	/**
	 * 내 거래처를을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 myOfficesItemVO
	 * @return
	 * @exception Exception
	 */
	public void deleteBuyerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) throws Exception {
		insert("deleteBuyerMyOfficesItem", myOfficesItemVO);
	}
}
