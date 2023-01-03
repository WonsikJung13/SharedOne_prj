package com.soprj.sharedone_prj.controller.price;

import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.domain.price.PriceDto;
import com.soprj.sharedone_prj.service.item.ItemService;
import com.soprj.sharedone_prj.service.price.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("price")
public class PriceController {

    @Autowired
    private PriceService priceService;

    @Autowired
    private ItemService itemService;

    @GetMapping("list")
    public void getPriceList(Model model) {
        List<PriceDto> priceList = priceService.getPriceList();
        model.addAttribute("priceList", priceList);
        System.out.println("다 나와?" + priceList);
    }

    @GetMapping("register")
    public void register() {
    }

    @PostMapping("register")
    public String register(PriceDto price){
        priceService.register(price);

        return "redirect:/price/list";
    }
}
