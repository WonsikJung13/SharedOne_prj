package com.soprj.sharedone_prj.controller.buyer;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.service.buyer.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("buyer")
public class BuyerController {

    @Autowired
    private BuyerService buyerService;

    @GetMapping("list")
    public void list(Model model){
        List<BuyerDto> list = buyerService.listBuyer();

        model.addAttribute("buyerList", list);
    }

    @GetMapping("get")
    public void get(@RequestParam(name = "m_buyer_id") int m_buyer_id, Model model) {
        BuyerDto buyer = buyerService.get(m_buyer_id);
        model.addAttribute("Buyer", buyer);
    }

    @RequestMapping("register")
    public void register() {

    }

    @PostMapping("register")
    public String register(BuyerDto buyer,
                           RedirectAttributes rttr) {
        int cnt = buyerService.register(buyer);
        if (cnt == 1) {

            rttr.addFlashAttribute("message", "새 게시물이 등록되었습니다.");
        } else {
            rttr.addFlashAttribute("message", "새 게시물이 등록되지 않았습니다.");
        }

        return "redirect:/buyer/list";
    }

    @PostMapping("modify")
    public String modify(BuyerDto buyerDto, RedirectAttributes rttr) {

        int cnt = buyerService.update(buyerDto);

//        if (cnt == 1) {
//            rttr.addFlashAttribute("message", buyerService.getBuyerId() + "번 게시물을 수정하였습니다.");
//        } else {
//            rttr.addFlashAttribute("message", buyerService.getBuyerId() + "번 게시물을 수정하지 못했습니다.");
//        }

        return "redirect:/buyer/list";
    }

    @GetMapping("modify")
    public void modify(String m_buyer_name,int m_buyer_id, Model model) {
        BuyerDto buyerDto = buyerService.getDuo(m_buyer_name, m_buyer_id);

        model.addAttribute("Buyer", buyerDto);
    }

    @PostMapping("remove")
    public String remove(int m_buyer_id, RedirectAttributes rttr) {
        int cnt = buyerService.remove(m_buyer_id);
        if (cnt == 1) {
            rttr.addFlashAttribute("message", m_buyer_id + "번 게시물이 삭제되었습니다.");
        } else {
            rttr.addFlashAttribute("message", m_buyer_id + "번 게시물이 삭제되지 않았습니다.");
        }
        return "redirect:/buyer/list";
    }

}
