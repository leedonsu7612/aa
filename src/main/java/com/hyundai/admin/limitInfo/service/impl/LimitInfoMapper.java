package com.hyundai.admin.limitInfo.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.admin.limitInfo.service.LimitHistoryVO;
import com.hyundai.admin.limitInfo.service.LimitInfoVO;
import com.hyundai.admin.limitInfo.service.LimitRequestVO;
import com.hyundai.admin.member.service.MemberVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * 대리점 한도요청에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.12.03
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.12.03        CDF Team          최초 생성
 *
 * </pre>
 */
@Repository("limitInfoMapper")
public class LimitInfoMapper extends EgovAbstractMapper {
	
	/**
	 * 대리점 한도요청 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 목록
	 * @exception Exception
	 */
	public List<LimitInfoVO> selectLimitInfoList(LimitInfoVO searchVO){
		return selectList("selectLimitInfoList", searchVO);
	}

	/**
	 * 대리점 한도요청 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 총 갯수
	 * @exception
	 */
	public int selectLimitInfoListTotCnt(LimitInfoVO searchVO){
		return (int)selectOne("selectLimitInfoListTotCnt", searchVO);
	}

	/**
	 * 대리점 한도승인 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도승인 목록
	 * @exception Exception
	 */
	public List<LimitInfoVO> selectLimitApprovalList(LimitInfoVO searchVO){
		return selectList("selectLimitApprovalList", searchVO);
	}

	/**
	 * 대리점 한도승인 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도승인 총 갯수
	 * @exception
	 */
	public int selectLimitApprovalListTotCnt(LimitInfoVO searchVO){
		return (int)selectOne("selectLimitApprovalListTotCnt", searchVO);
	}

	/**
	 * 대리점 한도요청을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MemberVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public LimitRequestVO selectLimitRequest(LimitRequestVO vo){
		return (LimitRequestVO)selectOne("selectLimitRequest", vo);
	}

	/**
	 * 대리점 한도요청 내역을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 내역
	 * @exception Exception
	 */
	public List<LimitHistoryVO> selectLimitHistoryList(MemberVO searchVO){
		return selectList("selectLimitHistoryList", searchVO);
	}

	/**
	 * 대리점 한도요청 내역 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 대리점 한도요청 내역 총 갯수
	 * @exception
	 */
	public int selectLimitHistoryListTotCnt(MemberVO searchVO){
		return (int)selectOne("selectLimitHistoryListTotCnt", searchVO);
	}

	/**
	 * 대리점 한도요청 등록한다.
	 * @param vo - 등록할 정보가 담긴 LimitRequestVO
	 * @return
	 * @exception Exception
	 */
	public void insertLimitRequest(LimitRequestVO vo) throws Exception {
		insert("insertLimitRequest", vo);
	}

	/**
	 * 대리점 한도요청을 삭제한다.
	 * @param reqId - 삭제할 요청ID
	 * @return void형
	 * @exception Exception
	 */
	public void deleteLimitRequest(String reqId){
		delete("deleteLimitRequest", reqId);
	}

	/**
	 * 대리점 한도요청을 검색해서 승인된지 24시간이 지난 요청 목록을 조회한다.
	 * @return 승인된지 24시간이 지난 요청 목록
	 * @exception Exception
	 */
	public List<LimitRequestVO> selectOver1DayApprovalList(){
		return selectList("selectOver1DayApprovalList", null);
	}

	/**
	 * 대리점 한도요청을 검색해서 승인된지 24시간이 지난 요청을 최종승인한다.
	 * @return void형
	 * @exception Exception
	 */
	public void checkLimitRequest() throws Exception {
		insert("checkLimitRequest", null);
	}
}
