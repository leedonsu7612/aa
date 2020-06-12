package com.hyundai.admin.abnormalDaily.service;

import java.util.List;

/**
 * @Class Name : AbnormalDailyService.java
 * @Description : AbnormalDailyService Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.21   CDF Team        최초생성
 *
 * @author cdf dev
 * @since 2018.11.21
 * @version 1.0
 *
 */

public interface AbnormalDailyService {
	
	
	

	/**
	 * 일자별 이상거래 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 일자별 이상거래 목록
	 * @exception Exception
	 */
	List<?> selectAbnormalDailyList(AbnormalDailyVO searchVO) throws Exception;

	/**
	 * 일자별 이상거래 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 일자별 이상거래 총 갯수
	 * @exception
	 */
	int selectAbnormalDailyListTotCnt(AbnormalDailyVO searchVO);

}
