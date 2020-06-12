package com.hyundai.admin.authorization.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.admin.authorization.service.MemberAuthVO;
import com.hyundai.admin.authorization.service.MenuAuthVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * 권한처리에 관한 데이터처리 매퍼 클래스
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
@Repository("authorizationMapper")
public class AuthorizationMapper extends EgovAbstractMapper {
	
	/**
	 * 그룹별 사용자 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 그룹별 사용자 목록
	 * @exception Exception
	 */
	public List<MemberAuthVO> selectMemberAuthList(MemberAuthVO searchVO){
		return selectList("selectMemberAuthList", searchVO);
	}

	/**
	 * 그룹별 사용자 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 그룹별 사용자 총 갯수
	 * @exception
	 */
	public int selectMemberAuthListTotCnt(MemberAuthVO searchVO){
		return (int)selectOne("selectMemberAuthListTotCnt", searchVO);
	}

	/**
	 * 사용자 권한을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MemberAuthVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public MemberAuthVO selectMemberAuthEdit(MemberAuthVO vo){
		return (MemberAuthVO)selectOne("selectMemberAuthEdit", vo);
	}

	/**
	 * 사용자 권한정보를 갱신한다.
	 * @param vo - 갱신할 정보가 담긴 MemberAuthVO
	 * @return
	 * @exception Exception
	 */
	public void updateMemberAuth(MemberAuthVO vo) throws Exception {
		update("updateMemberAuth", vo);
	}

	/**
	 * 멤버를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MemberAuthVO
	 * @return void형
	 * @exception Exception
	 */
	public void deleteMember(MemberAuthVO vo){
		delete("deleteMemberIdInfo", vo);
//		delete("deleteMemberInfo", vo);
	}

	/**
	 * 그룹별메뉴권한 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 그룹별메뉴권한 목록
	 * @exception Exception
	 */
	public List<MenuAuthVO> selectGroupAuthList(String membClass){
		return selectList("selectGroupAuthList", membClass);
	}

	/**
	 * 그룹별메뉴권한정보를 갱신한다.
	 * @param vo - 갱신할 정보가 담긴 MenuAuthVO
	 * @return
	 * @exception Exception
	 */
	public void updateGroupAuth(MenuAuthVO vo) throws Exception {
		update("updateGroupAuth", vo);
	}

}
