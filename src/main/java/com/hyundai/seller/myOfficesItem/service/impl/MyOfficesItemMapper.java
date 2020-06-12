package com.hyundai.seller.myOfficesItem.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.seller.myOfficesItem.service.MyOfficesItemVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
/**
 * SellerMyOfficesItemMapper에 관한 데이터처리 매퍼 클래스
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

@Repository("sellerMyOfficesItemMapper")
public class MyOfficesItemMapper extends EgovAbstractMapper {

	public List<MyOfficesItemVO> selectSellerMyOfficesItemList(MyOfficesItemVO myOfficesItemVO) {
		return selectList("selectSellerMyOfficesItemList", myOfficesItemVO);
	}

	/**
	 * 내 거래처를 등록한다.
	 * @param vo - 등록할 정보가 담긴 myOfficesItemVO
	 * @return
	 * @exception Exception
	 */
	public void insertSellerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) throws Exception {
		insert("insertSellerMyOfficesItem", myOfficesItemVO);
	}

	/**
	 * 내 거래처를을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 myOfficesItemVO
	 * @return
	 * @exception Exception
	 */
	public void deleteSellerMyOfficesItem(MyOfficesItemVO myOfficesItemVO) throws Exception {
		insert("deleteSellerMyOfficesItem", myOfficesItemVO);
	}

}
