package com.example.hansub_project.service.member;



import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.example.domain.UsersVO;
import com.example.hansub_project.model.member.dao.MemberDAO;


@Service //서비스 빈 선언
public class MemberSerivceImpl implements MemberService {
 
    
    @Inject    
    MemberDAO memberdao; //dao를 사용하기 위해 의존성을 주입

    @Override
    public void authentication(UsersVO vo) {
        
        memberdao.authentication(vo);
    }

}