package com.hyundai.admin.guarantee.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.admin.guarantee.service.ExtraCollectionVO;
import com.hyundai.admin.guarantee.service.GuaranteeVO;
import com.hyundai.admin.guarantee.service.SalesSlipVO;
import com.hyundai.admin.guarantee.service.SetOffInfoVO;
import com.hyundai.admin.guarantee.service.TaxbillVO;
import com.hyundai.admin.guarantee.service.UnissuedVO;
import com.hyundai.buyer.salesBilling.service.DfrdAcntsRcvbleVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * 보증내역에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.26
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.26        CDF Team          최초 생성
 *
 * </pre>
 */
@Repository("guaranteeMapper")
public class GuaranteeMapper extends EgovAbstractMapper {
	
	/**
	 * 보증내역 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 보증내역 목록
	 * @exception Exception
	 */
	public List<GuaranteeVO> selectGuaranteeList(GuaranteeVO searchVO){
		return selectList("selectGuaranteeList", searchVO);
	}

	/**
	 * 보증내역 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 보증내역 총 갯수
	 * @exception
	 */
	public int selectGuaranteeListTotCnt(GuaranteeVO searchVO){
		return (int)selectOne("selectGuaranteeListTotCnt", searchVO);
	}

	/**
	 * 매출채권목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출채권 목록
	 * @exception Exception
	 */
	public List<DfrdAcntsRcvbleVO> selectDfrdAcntsRcvbleList(DfrdAcntsRcvbleVO searchVO){
		return selectList("selectDfrdAcntsRcvbleList", searchVO);
	}

	/**
	 * 매출채권목록 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출채권목록 총 갯수
	 * @exception
	 */
	public int selectDfrdAcntsRcvbleListTotCnt(DfrdAcntsRcvbleVO searchVO){
		return (int)selectOne("selectDfrdAcntsRcvbleListTotCnt", searchVO);
	}
	
	/**
	 * 기타수금목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 기타수금 목록
	 * @exception Exception
	 */
	public List<ExtraCollectionVO> selectExtraCollectionList(ExtraCollectionVO searchVO){
		return selectList("selectExtraCollectionList", searchVO);
	}

	/**
	 * 기타수금목록 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 기타수금목록 총 갯수
	 * @exception
	 */
	public int selectExtraCollectionListTotCnt(ExtraCollectionVO searchVO){
		return (int)selectOne("selectExtraCollectionListTotCnt", searchVO);
	}

	/**
	 * 상계수금목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 상계수금 목록
	 * @exception Exception
	 */
	public List<SetOffInfoVO> selectSetOffInfoList(SetOffInfoVO searchVO){
		return selectList("selectSetOffInfoList", searchVO);
	}

	/**
	 * 상계수금목록 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 상계수금목록 총 갯수
	 * @exception
	 */
	public int selectSetOffInfoListTotCnt(SetOffInfoVO searchVO){
		return (int)selectOne("selectSetOffInfoListTotCnt", searchVO);
	}

	/**
	 * 세금계산서목록을 조회한다.
	 * @param TaxbillVO - 조회할 정보가 담긴 VO
	 * @return 세금계산서 목록
	 * @exception Exception
	 */
	public List<TaxbillVO> selectTaxbillList(TaxbillVO searchVO){
		return selectList("selectTaxbillList", searchVO);
	}

	/**
	 * 세금계산서목록 총 갯수를 조회한다.
	 * @param TaxbillVO - 조회할 정보가 담긴 VO
	 * @return 세금계산서목록 총 갯수
	 * @exception
	 */
	public int selectTaxbillListTotCnt(TaxbillVO searchVO){
		return (int)selectOne("selectTaxbillListTotCnt", searchVO);
	}

	/**
	 * 매출전표목록을 조회한다.
	 * @param SalesSlipVO - 조회할 정보가 담긴 VO
	 * @return 매출전표 목록
	 * @exception Exception
	 */
	public List<SalesSlipVO> selectSalesSlipList(SalesSlipVO searchVO){
		return selectList("selectSalesSlipList", searchVO);
	}

	/**
	 * 매출전표목록 총 갯수를 조회한다.
	 * @param SalesSlipVO - 조회할 정보가 담긴 VO
	 * @return 매출전표목록 총 갯수
	 * @exception
	 */
	public int selectSalesSlipListTotCnt(SalesSlipVO searchVO){
		return (int)selectOne("selectSalesSlipListTotCnt", searchVO);
	}
	
	/**
	 * 미발행채권목록을 조회한다.
	 * @param UnissuedVO - 조회할 정보가 담긴 VO
	 * @return 미발행채권 목록
	 * @exception Exception
	 */
	public List<UnissuedVO> selectUnissuedList(UnissuedVO searchVO){
		return selectList("selectUnissuedList", searchVO);
	}
}
