package com.soprj.sharedone_prj.security;

import com.soprj.sharedone_prj.domain.member.MemberDto;
import com.soprj.sharedone_prj.domain.member.MemberLoginDto;
import com.soprj.sharedone_prj.mapper.member.MemberMapper;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Log4j2
@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private MemberMapper memberMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
        MemberDto memberDto = memberMapper.getMember(username);
        MemberLoginDto memberLoginDto = memberMapper.getMemberLogin(username);

        if(memberDto == null){
            return null;
        }

        List<SimpleGrantedAuthority> authorityList = new ArrayList<>();

        if(memberLoginDto.getM_authority_grade() != null){
//            for(String auth : memberLoginDto.getM_authority_grade()){
//                authorityList.add(new SimpleGrantedAuthority(auth));
//            }
            authorityList.add(new SimpleGrantedAuthority(memberLoginDto.getM_authority_grade()));
        }

        User user = new User(memberDto.getM_member_id(), memberDto.getM_member_password(), authorityList);
        System.out.println("authorityList :" + authorityList);

        return user;

    }
}
