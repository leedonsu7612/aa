package com.hyundai.admin.abnormalHeeledSales.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.admin.abnormalHeeledSales.service.AbnormalHeeledSalesVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * 매출분포 이상거래에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.22
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.22        CDF Team          최초 생성
 *
 * </pre>
 */
@Repository("abnormalHeeledSalesMapper")
public class AbnormalHeeledSalesMapper extends EgovAbstractMapper {
	
	/**
	 * 매출분포 이상거래 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출분포 이상거래 목록
	 * @exception Exception
	 */
	public List<AbnormalHeeledSalesVO> selectAbnormalHeeledSalesList(AbnormalHeeledSalesVO searchVO){
		return selectList("selectAbnormalHeeledSalesList", searchVO);
	}

	/**
	 * 매출분포 이상거래 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 매출분포 이상거래 총 갯수
	 * @exception
	 */
	public int selectAbnormalHeeledSalesListTotCnt(AbnormalHeeledSalesVO searchVO){
		return (int)selectOne("selectAbnormalHeeledSalesListTotCnt", searchVO);
	}

}
