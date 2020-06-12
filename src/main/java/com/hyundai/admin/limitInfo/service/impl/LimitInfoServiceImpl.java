package com.hyundai.admin.limitInfo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hyundai.admin.limitInfo.service.LimitHistoryVO;
import com.hyundai.admin.limitInfo.service.LimitInfoService;
import com.hyundai.admin.limitInfo.service.LimitInfoVO;
import com.hyundai.admin.limitInfo.service.LimitRequestVO;
import com.hyundai.admin.member.service.MemberVO;
import com.hyundaicommercial.cdf.blockchain.Interface;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * @Class Name : LimitInfoServiceImpl.java
 * @Description : LimitInfo Business Implement Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2018.12.03    CDF Team       최초생성
 *
 * @author CDF Team
 * @since 2018.12.03
 * @version 1.0
 *
 */

@Service("limitInfoService")
public class LimitInfoServiceImpl extends EgovAbstractServiceImpl implements LimitInfoService {

	private static final Logger LOGGER = LoggerFactory.getLogger(LimitInfoServiceImpl.class);

	@Resource(name="limitInfoMapper")
	private LimitInfoMapper limitInfoDAO;

	/** ID Generation */
	@Resource(name = "egovReqIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public List<?> selectLimitInfoList(LimitInfoVO searchVO) throws Exception {
		return convertProcess(limitInfoDAO.selectLimitInfoList(searchVO));
	}
	
	private List<LimitInfoVO> convertProcess(List<LimitInfoVO> list) {
		if (list.size() > 0) {
			for (LimitInfoVO vo : list) {
				if(vo.getComSttsCd().equalsIgnoreCase("LM05")) vo.setCloseDate("휴업<br/>" + vo.getLastDate());
				else if(vo.getComSttsCd().equalsIgnoreCase("LM06")) vo.setCloseDate("폐업<br/>" + vo.getLastDate());
				else vo.setCloseDate("N");
				
				String process = "";
				switch(vo.getProcessNo()){
					case 0: case 100: process = "-"; break;
					case 1: process = "요청"; break;
					case 2: process = "처리승인대기"; break;
					case 3: process = "확인중"; break;
					case 4: process = "승인대기"; break;
					case 5: process = "승인취소"; break;
					case 6: process = "승인"; break;
					case 97: case 98: case 99: process = "반려"; break;
				}
				if(vo.getProcessNo() != 0 && vo.getProcessNo() != 100) process += "<br/>" + vo.getRegDate();
				vo.setProcess(process);
			}
		}
		return list;
	}
	
	@Override
	public int selectLimitInfoListTotCnt(LimitInfoVO searchVO) {
		return limitInfoDAO.selectLimitInfoListTotCnt(searchVO);
	}

	@Override
	public List<?> selectLimitApprovalList(LimitInfoVO searchVO) throws Exception {
		return convertProcess(limitInfoDAO.selectLimitApprovalList(searchVO));
	}

	@Override
	public int selectLimitApprovalListTotCnt(LimitInfoVO searchVO) {
		return limitInfoDAO.selectLimitApprovalListTotCnt(searchVO);
	}

	@Override
	public LimitRequestVO selectLimitRequest(LimitRequestVO vo) throws Exception {
		LimitRequestVO resultVO = limitInfoDAO.selectLimitRequest(vo);
		if (resultVO == null)
			throw processException("info.nodata.msg");
		return resultVO;
	}

	@Override
	public List<?> selectLimitHistoryList(MemberVO searchVO) throws Exception {
		List<LimitHistoryVO> list = limitInfoDAO.selectLimitHistoryList(searchVO);
		if (list.size() > 0) {
			for (LimitHistoryVO vo : list) {
				String process = "";
				switch(vo.getProcessNo()){
					case 0: process = "취소"; break;
					case 1: process = "요청"; break;
					case 2: process = "처리승인대기"; break;
					case 3: process = "확인중"; break;
					case 4: process = "승인대기"; break;
					case 5: process = "승인취소"; break;
					case 6: case 100: process = "승인"; break;
					case 97: case 98: case 99: process = "반려"; break;
				}
				vo.setProcess(process);
			}
		}
		
		return list;
	}

	@Override
	public int selectLimitHistoryListTotCnt(MemberVO searchVO) {
		return limitInfoDAO.selectLimitHistoryListTotCnt(searchVO);
	}

	@Override
	public void insertLimitRequest(LimitRequestVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		String reqId = vo.getReqId();
		if(reqId.isEmpty()){
			/** reqId Generation Service */
			reqId = egovIdGnrService.getNextStringId();
			vo.setReqId(reqId);
		}
		if(vo.getProcessNo() == 101){	// 요청자 취소면 삭제
			limitInfoDAO.deleteLimitRequest(reqId);
			return;
		}
		if(vo.getRcvBizNo() == null || vo.getRcvBizNo().isEmpty()) vo.setRcvMembYn("N");

		LOGGER.debug(vo.toString());
		limitInfoDAO.insertLimitRequest(vo);
	}

	@Override
	public void checkLimitRequest() throws Exception {
		
		List<LimitRequestVO> list =  limitInfoDAO.selectOver1DayApprovalList();
		if (list.size() > 0) {
			for (LimitRequestVO vo : list) {
				System.out.println("** 사번 " + vo.getBusinessNo() + "의 요청번호 : " + vo.getReqId() + "를 승인처리합니다.");
//				BYR_LIMIT_SET(vo);
			}
		}
		limitInfoDAO.checkLimitRequest();
	}

    /**
     * 블록체인 대리점 최초 한도 설정
     * @param input stringified JSON object
     * @return output
     */
    public void BYR_LIMIT_SET(LimitRequestVO requestVO) {
        
        Interface bcInterface = null;
        try {
            bcInterface = new Interface();
        } catch (Exception e) {
            e.printStackTrace();
        }

       /**
        * 최초한도 설정일때 REMAINING_LIMIT와 AMOUNT  값은 같다
        */
       System.out.println(String.format("Method: %s, Input data: %s\n", "BYR_LIMIT_SET", requestVO.getCompanyName() + "최초 한도 설정"));
       JSONObject input = new JSONObject();
       input.put("BYR_LIMIT_NO", requestVO.getBusinessNo());
       input.put("LIMIT_CONTRACT_NO", requestVO.getBusinessNo() + "2");
       input.put("AMOUNT", requestVO.getReqLimit());
       input.put("REMAINING_LIMIT", requestVO.getReqLimit());
       input.put("OVER_LIMIT", requestVO.getOverLimit());
       input.put("GUAR_AMOUNT", requestVO.getGuaranteePrice());
       input.put("SET_AMOUNT", requestVO.getSalesLimit());
       input.put("SET_DATE", "");
       input.put("OFF_DATE", "");
       System.out.println(String.format("Method: %s, Output data: %s\n", "BYR_LIMIT_SET", input.toString()));
     String output = bcInterface.BYR_LIMIT_SET(input.toString());
     System.out.println(String.format("Output: %s\n", output.toString()));
       //return helper.invokeChaincode(client, channel, "byrlimit", "BYR_LIMIT_SET", input, retryCount, timeOut);
    }

}
