package com.example.hansub_project.model.member.dao;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.domain.UsersVO;


@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlSession;

	// 회원 인증 관련 메소드
	// 버튼을 클릭한 회원의 정보를 회원 테이블에 저장해서 사용할 수 있게 함
	@Override
	public void authentication(UsersVO vo) {

		sqlSession.insert("member.authentication", vo);

	}

}
