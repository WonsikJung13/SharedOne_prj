package com.soprj.sharedone_prj.controller.member;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.member.MemberDto;
import com.soprj.sharedone_prj.service.member.EmailServiceImpl;
import com.soprj.sharedone_prj.service.member.MemberService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j2
@Controller
@RequestMapping("member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private EmailServiceImpl emailService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping("register")
    public void register() {

    }

    @PostMapping("register")
    public String register(MemberDto member,
                           RedirectAttributes rttr) throws Exception {

        String cnttt = emailService.sendSimpleMessage(member.getM_member_email());
        String password = passwordEncoder.encode(emailService.ePw);
        member.setM_member_password(password);

        int cnt = memberService.register(member);

        return "redirect:/member/manage";
    }

    @PostMapping("modify")
    public String modify(String m_member_id, String oldPassword,
                         String m_member_password, String m_member_email, RedirectAttributes rttr) {


        String password = memberService.getPassword(m_member_email);
        if (oldPassword != null) {
            if (passwordEncoder.matches(oldPassword, password)) {
                int cnt = memberService.updatePasswordd(m_member_email, m_member_password);
            }
        }

        rttr.addAttribute("email", m_member_email);

        return "redirect:/member/modify?m_member_email={email}";
    }

    @GetMapping("modify")
    public void modify(String m_member_email, Model model) {
        MemberDto member = memberService.get(m_member_email);

        model.addAttribute("member", member);
    }

    @PostMapping("remove")
    public String remove(String m_member_id, RedirectAttributes rttr) {

        int cnt = memberService.remove(m_member_id);

        return "redirect:/member/manage";
    }

    @GetMapping("login")
    public void loginGET(String error, String logout) {
        log.info("login get............");
        log.info("logout: " + logout);

        if (logout != null) {
            log.info("user logout..........");
        }
    }

    @GetMapping("manage")
    @PreAuthorize("hasAuthority('팀장')")
    public void manage(Model model,
                       @RequestParam(name = "page", defaultValue = "1") int page,
                       MemberDto memberDto) {
        List<MemberDto> authority = memberService.selectAuthority();
        List<MemberDto> memberList = memberService.getMemberList(page, memberDto);
        model.addAttribute("memberList", memberList);
        model.addAttribute("authority", authority);
    }

    @PostMapping("manage")
    public String manageModify(MemberDto member, RedirectAttributes rttr) {


        int cnt = memberService.updateGrade(member);

        return "redirect:/member/manage";
    }

    @GetMapping("resetPassword")
    public String resetPassword(@RequestParam(name = "m_member_id") String m_member_id, RedirectAttributes rttr) throws Exception {

        int cnt = memberService.resetPassword(m_member_id);
        String email = memberService.getEmail(m_member_id);
        String cnttt = emailService.sendSimpleMessage(email);

        return "redirect:/member/manage";
    }

    @PostMapping("checkPassword")
    @ResponseBody
    public Map<String, Object> checkId(@RequestBody Map<String, Object> member) {

        String m_member_email = member.get("m_member_email").toString();
        MemberDto memberDto = memberService.checkPassword(m_member_email);
        System.out.println(memberDto);

        String m_member_password = member.get("m_member_password").toString();
        Map<String, Object> map = new HashMap<>();

        if (passwordEncoder.matches(m_member_password, memberDto.getM_member_password())) {
            map.put("statusNum", "not exist");
            map.put("message", "일치합니다");
        } else {
            map.put("statusNum", "exist");
            map.put("message", "일치하지 않습니다");
        }
        return map;
    }
}
