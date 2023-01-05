package com.soprj.sharedone_prj.controller.member;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.member.MemberDto;
import com.soprj.sharedone_prj.service.member.MemberService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.lang.reflect.Member;
import java.util.List;

@Log4j2
@Controller
@RequestMapping("member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("list")
    public void list(Model model) {
        List<MemberDto> list = memberService.listMember();

        model.addAttribute("memberList", list);
    }

    @PostMapping("list")
    public String modifyy(MemberDto member, RedirectAttributes rttr) {

        if (member.getM_member_email() != null) {
            int cnt = memberService.updateEmail(member);
        } else if (member.getM_member_password() != null) {
            int cntt = memberService.updatePassword(member);
        }

        return "redirect:/member/list";
    }

    @GetMapping("get")
    public void get(@RequestParam(name = "m_member_id") String m_member_id, Model model) {
        MemberDto member = memberService.get(m_member_id);
        model.addAttribute("member", member);
    }

    @PostMapping("get")
    public String getto(MemberDto member, RedirectAttributes rttr) {
        int cnt = memberService.updateEmail(member);

        return "redirect:/member/list";
    }

    @RequestMapping("register")
    public void register() {

    }

    @PostMapping("register")
    public String register(MemberDto member,
                           RedirectAttributes rttr) {
        int cnt = memberService.register(member);

        return "redirect:/member/list";
    }

    @PostMapping("modify")
    public String modify(MemberDto member, String m_member_id, String m_member_password, RedirectAttributes rttr) {

        int cnt = memberService.updatePasswordd(m_member_id, m_member_password);


        return "redirect:/member/list";
    }

    @GetMapping("modify")
    public void modify(String m_member_id, Model model) {
        MemberDto memberDto = memberService.getMember(m_member_id);

        model.addAttribute("member", memberDto);
    }

    @PostMapping("remove")
    public String remove(String m_member_id, RedirectAttributes rttr) {

        int cnt = memberService.remove(m_member_id);

        return "redirect:/member/list";
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
    public void manage(Model model) {
        List<MemberDto> list = memberService.listMember();
        List<MemberDto> authority = memberService.selectAuthority();

        model.addAttribute("memberList", list);
        model.addAttribute("authority", authority);

    }

    @PostMapping("manage")
    public String manageModify(MemberDto member, RedirectAttributes rttr) {

        if (member.getM_member_email() != null) {
            int cnt = memberService.updateEmail(member);
        }
        if (member.getM_member_password() != null) {
            int cntt = memberService.updatePassword(member);
        }

        int cnt = memberService.updateGrade(member);



        return "redirect:/member/manage";
    }
}
