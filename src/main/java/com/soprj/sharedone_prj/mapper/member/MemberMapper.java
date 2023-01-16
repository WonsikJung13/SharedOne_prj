package com.soprj.sharedone_prj.mapper.member;

import com.soprj.sharedone_prj.domain.member.MemberDto;
import com.soprj.sharedone_prj.domain.member.MemberLoginDto;

import java.util.List;

public interface MemberMapper {
    MemberDto getMember(String m_member_email);

    MemberLoginDto getMemberLogin(String m_member_email);

    int insert(String m_member_id, String m_member_email, String m_member_password);

    int removeById(String m_member_email);

    MemberDto select(String m_member_email);

    int updatePasswordd(String m_member_email, String m_member_password);

    List<MemberDto> selectAuthority();

    int updateGrade(MemberDto member);

    int resetPassword(String m_member_email, String m_member_password);

    String getEmail(String m_member_id);

    String getPassword(String m_member_email);

    int countAll();

    List<MemberDto> getMemberList(int offset, int records);

    MemberDto checkPassword(String m_member_email);

    MemberDto getMemberEmail(String m_member_email);
}
