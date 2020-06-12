package com.hyundai.admin.abnormalDaily.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.abnormalDaily.service.AbnormalDailyService;
import com.hyundai.admin.abnormalDaily.service.AbnormalDailyVO;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

/**
 * @Class Name : AbnormalDailyServiceImpl.java
 * @Description : AbnormalDaily Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.11.20    CDF Team       최초생성
 *
 * @author CDF Team
 * @since 2018.11.20
 * @version 1.0
 *
 */

@Service("abnormalDailyService")
public class AbnormalDailyServiceImpl extends EgovAbstractServiceImpl implements AbnormalDailyService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AbnormalDailyServiceImpl.class);

	@Resource(name="abnormalDailyMapper")
	private AbnormalDailyMapper abnormalDailyDAO;

	@Override
	public List<?> selectAbnormalDailyList(AbnormalDailyVO searchVO) throws Exception {
		return abnormalDailyDAO.selectAbnormalDailyList(searchVO);
	}

	@Override
	public int selectAbnormalDailyListTotCnt(AbnormalDailyVO searchVO) {
		return abnormalDailyDAO.selectAbnormalDailyListTotCnt(searchVO);
	}

}
