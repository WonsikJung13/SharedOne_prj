package com.soprj.sharedone_prj.service.member;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.member.MemberDto;
import com.soprj.sharedone_prj.mapper.member.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private EmailServiceImpl emailService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public List<MemberDto> listMember() {
        return memberMapper.list();
    }

    public MemberDto getMember(String m_member_id) {
        return memberMapper.getMember(m_member_id);
    }


    public int updateEmail(String m_member_id, String m_member_email) {
        return memberMapper.updateMemberEmail(m_member_id, m_member_email);
    }

    public int updatePassword(MemberDto member) {
        return memberMapper.updateMemberPassword(member);
    }

    public int addMember(MemberDto member) {
        return memberMapper.addMember(member);
    }


    public int register(MemberDto member) {
        int cnt = memberMapper.insert(member);
        return cnt;
    }

    public int remove(String m_member_id) {
        return memberMapper.removeById(m_member_id);
    }

    public MemberDto get(String m_member_id) {
        return memberMapper.select(m_member_id);
    }

    public int updatePasswordd(String m_member_id, String password) {
        String m_member_password = passwordEncoder.encode(password);
        return memberMapper.updatePasswordd(m_member_id, m_member_password);
    }

    public List<MemberDto> selectAuthority() {
        return memberMapper.selectAuthority();
    }

    public int updateGrade(MemberDto member) {
        return memberMapper.updateGrade(member);
    }

    public int resetPassword(String m_member_id) {
        String pw = emailService.ePw;
        String m_member_password = passwordEncoder.encode(pw);
        System.out.println(m_member_password);
        return memberMapper.resetPassword(m_member_id, m_member_password);
    }

    public String getEmail(String m_member_id) {
        return memberMapper.getEmail(m_member_id);
    }

    public String getPassword(String m_member_id) {
        return memberMapper.getPassword(m_member_id);
    }
}
