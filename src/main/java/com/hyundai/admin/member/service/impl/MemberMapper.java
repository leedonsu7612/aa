package com.hyundai.admin.member.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hyundai.admin.member.service.MemberVO;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

/**
 * mamber에 관한 데이터처리 매퍼 클래스
 *
 * @author  CDF Team
 * @since 2018.11.05
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *
 *          수정일          수정자           수정내용
 *  ----------------    ------------    ---------------------------
 *   2018.11.05        CDF Team          최초 생성
 *
 * </pre>
 */
@Repository("memberMapper")
public class MemberMapper extends EgovAbstractMapper {

	/**
	 * 멤버를 등록한다.
	 * @param vo - 등록할 정보가 담긴 MemberVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	public void insertMember(MemberVO vo){
		insert("insertMember", vo);
	}

	/**
	 * 멤버를 수정한다.
	 * @param vo - 수정할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public void updateMember(MemberVO vo){
		update("updateMember", vo);
	}

	/**
	 * 멤버를 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MemberVO
	 * @return void형
	 * @exception Exception
	 */
	public void deleteMember(MemberVO vo){
		delete("deleteMember", vo);
	}

	/**
	 * 멤버를 조회한다.
	 * @param vo - 조회할 정보가 담긴 MemberVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	public MemberVO selectMember(MemberVO vo){
		return (MemberVO)selectOne("selectMember", vo);
	}
	/**
	 * 멤버 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 멤버 목록
	 * @exception Exception
	 */
	public List<MemberVO> selectMemberList(MemberVO searchVO){
		return selectList("selectMemberList", searchVO);
	}

	/**
	 * 멤버 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return 멤버 총 갯수
	 * @exception
	 */
	public int selectMemberListTotCnt(MemberVO searchVO){
		return (int)selectOne("selectMemberListTotCnt", searchVO);
	}

}
