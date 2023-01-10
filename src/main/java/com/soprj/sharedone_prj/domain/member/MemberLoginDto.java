package com.soprj.sharedone_prj.domain.member;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Data
public class MemberLoginDto{

    private String m_member_id;

    private String m_member_email;

    private String m_member_password;

    private int m_authority_id;

    private String m_authority_grade;

    private List<String> authority;



}
