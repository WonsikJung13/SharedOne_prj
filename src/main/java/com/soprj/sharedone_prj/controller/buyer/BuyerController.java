package com.soprj.sharedone_prj.controller.buyer;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.service.buyer.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("buyer")
public class BuyerController {

    @Autowired
    private BuyerService buyerService;


    @GetMapping("list")
    public void getPriceList(Model model,
                             @RequestParam(name = "page", defaultValue = "1") int page,
                             BuyerDto buyerDto) {
        List<BuyerDto> buyerList = buyerService.getBuyerList(page, buyerDto);
        model.addAttribute("buyerList", buyerList);
    }

    @GetMapping("get")
    public void get(@RequestParam(name = "m_buyer_id") String m_buyer_id, Model model) {
        BuyerDto buyer = buyerService.get(m_buyer_id);
        model.addAttribute("Buyer", buyer);
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping("register")
    public void register() {

    }

    @PostMapping("register")
    public String register(@RequestBody List<Map<String, Object>> addData,
                           RedirectAttributes rttr) {

        Map<String, Object> buyer = new HashMap<>();
        for (int i = 0; i < addData.size(); i++) {
            buyerService.register(addData.get(i));
        }



        return "redirect:/buyer/list";
    }

    @PostMapping("modify")
    public String modify(BuyerDto buyerDto, RedirectAttributes rttr) {

        int cnt = buyerService.update(buyerDto);

        return "redirect:/buyer/list";
    }

    @GetMapping("modify")
    public void modify(String m_buyer_name,String m_buyer_id, Model model) {
        BuyerDto buyerDto = buyerService.getDuo(m_buyer_name, m_buyer_id);

        model.addAttribute("Buyer", buyerDto);
    }

    @PostMapping("remove")
    public String remove(String m_buyer_id, RedirectAttributes rttr) {
        int cnt = buyerService.remove(m_buyer_id);
        if (cnt == 1) {
            rttr.addFlashAttribute("message", m_buyer_id + "번 게시물이 삭제되었습니다.");
        } else {
            rttr.addFlashAttribute("message", m_buyer_id + "번 게시물이 삭제되지 않았습니다.");
        }
        return "redirect:/buyer/list";
    }

    @GetMapping("checkNum/{m_buyer_number}")
    @ResponseBody
    public Map<String, Object> checkId(@PathVariable String m_buyer_number) {
        Map<String, Object> map = new HashMap<>();

        BuyerDto buyer = buyerService.getBuyerNum(m_buyer_number);

        if (buyer == null) {
            map.put("statusNum", "not exist");
            map.put("message", "사용 가능합니다");
        } else {
            map.put("statusNum", "exist");
            map.put("message", "중복합니다");
        }
        return map;
    }

}
