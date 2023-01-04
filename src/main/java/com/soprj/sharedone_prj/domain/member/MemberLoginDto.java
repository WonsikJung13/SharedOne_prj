package com.soprj.sharedone_prj.domain.member;

import lombok.Data;

import java.util.List;

@Data
public class MemberLoginDto {

    private String m_member_id;

    private String m_member_email;

    private String m_member_password;

    private int m_authority_id;

    private List<String> m_authority_grade;
}
