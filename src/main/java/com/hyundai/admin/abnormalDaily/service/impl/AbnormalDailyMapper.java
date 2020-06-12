package com.hyundai.admin.abnormalDaily.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.admin.abnormalDaily.service.AbnormalDailyVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * mamber에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.20
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.20        CDF Team          최초 생성
 *
 * </pre>
 */
@Repository("abnormalDailyMapper")
public class AbnormalDailyMapper extends EgovAbstractMapper {
	
	/**
	 * 일자별 이상거래 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 일자별 이상거래 목록
	 * @exception Exception
	 */
	public List<AbnormalDailyVO> selectAbnormalDailyList(AbnormalDailyVO searchVO){
		return selectList("selectAbnormalDailyList", searchVO);
	}

	/**
	 * 일자별 이상거래 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 일자별 이상거래 총 갯수
	 * @exception
	 */
	public int selectAbnormalDailyListTotCnt(AbnormalDailyVO searchVO){
		return (int)selectOne("selectAbnormalDailyListTotCnt", searchVO);
	}

}
