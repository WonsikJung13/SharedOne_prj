package com.soprj.sharedone_prj.mapper.member;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.member.MemberDto;
import com.soprj.sharedone_prj.domain.member.MemberLoginDto;

import java.util.List;

public interface MemberMapper {
    List<MemberDto> list();

    MemberDto getMember(String m_member_id);

    MemberLoginDto getMemberLogin(String m_member_id);

    int addMember(MemberDto member);

    int updateMemberEmail(String  m_member_id, String m_member_email);

    int updateMemberPassword(MemberDto member);

    int insert(MemberDto member);

    int removeById(String m_member_id);

    MemberDto select(String m_member_id);

    int updatePasswordd(String m_member_id, String m_member_password);

    List<MemberDto> selectAuthority();

    int updateGrade(MemberDto member);

    int resetPassword(String m_member_id, String m_member_password);

    String getEmail(String m_member_id);

    String getPassword(String m_member_id);


    int countAll();

    List<MemberDto> getMemberList(int offset, int records);
}
