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
    public void getBuyerList(Model model,
                             @RequestParam(name = "page", defaultValue = "1") int page,
                             @RequestParam(name = "searchNum", defaultValue = "all") String searchNum,
                             @RequestParam(name = "searchText", defaultValue = "") String searchText,
                             BuyerDto buyerDto) {
        List<BuyerDto> buyerList = buyerService.getBuyerList(page, buyerDto, searchNum, searchText);
        model.addAttribute("buyerList", buyerList);
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping("register")
    public void register() {

    }

    @PostMapping("register")
    public void register(@RequestBody List<Map<String, Object>> addData,
                           RedirectAttributes rttr) {
        Map<String, Object> buyer = new HashMap<>();
        for (int i = 0; i < addData.size(); i++) {
            buyerService.register(addData.get(i));
        }
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
    public String remove(RedirectAttributes rttr,
                         String m_buyer_id) {
        String[] buyer = m_buyer_id.split(",");
        for (int i = 0; i < buyer.length; i++){
            buyerService.remove(buyer[i]);
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
