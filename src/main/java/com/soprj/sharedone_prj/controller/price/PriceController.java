package com.soprj.sharedone_prj.controller.price;

import com.soprj.sharedone_prj.domain.price.PriceDto;
import com.soprj.sharedone_prj.service.item.ItemService;
import com.soprj.sharedone_prj.service.price.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("price")
public class PriceController {

    @Autowired
    private PriceService priceService;

    @Autowired
    private ItemService itemService;

    @GetMapping("list")
    public void getPriceList(Model model,
                             @RequestParam(name = "page", defaultValue = "1") int page,
                             PriceDto priceDto) {
        List<PriceDto> priceList = priceService.getPriceList(page, priceDto);
        model.addAttribute("priceList", priceList);
    }

    @GetMapping("register")
    public void register(Model model) {
        List<PriceDto> buyerList = priceService.getBuyerList();
        List<PriceDto> itemList = priceService.getItemList();
        model.addAttribute("buyerList", buyerList);
        model.addAttribute("itemList", itemList);
    }

    @GetMapping ("buyerList/{selected}")
    @ResponseBody
    public PriceDto buyerList(@PathVariable String selected) {
        PriceDto buyerList = priceService.buyerList(selected);
        return buyerList;
    }

    @GetMapping("itemList/{selected}")
    @ResponseBody
    public PriceDto itemList(@PathVariable String selected) {
        PriceDto itemList = priceService.itemList(selected);
        return itemList;
    }

    @PostMapping("register")
    public String register(PriceDto price){
        priceService.register(price);

        return "redirect:/price/list";
    }


    @GetMapping("modify")
    public void modify(int m_price_id, Model model) {
        List<PriceDto> buyerList = priceService.getBuyerList();
        List<PriceDto> itemList = priceService.getItemList();
        model.addAttribute("price", priceService.getById(m_price_id));
        model.addAttribute("buyerList", buyerList);
        model.addAttribute("itemList", itemList);
    }

    @PostMapping("modify")
    public String modify(PriceDto priceDto) {

        priceService.getByIdModify(priceDto);
        return "redirect:/price/list";
    }

    @PostMapping("remove")
    public String remove(@RequestParam Map<String,String> removeIdList) {
        System.out.println("ididididid" + removeIdList);
        System.out.println(removeIdList.get("m_price_id"));
        String[] aa = removeIdList.get("m_price_id").toString().split(",");
        List<String> testList = new ArrayList<String>();
        testList.add(removeIdList.get("m_price_id"));
        System.out.println(testList);
        String a = testList.toString();
        String[] testList2 = a.split(",");
        for (int i = 0; i < aa.length; i++) {
            System.out.println(aa[i]);
        }
//        for (int i = 0; i < removeIdList.get("m_price_id"); i++) {
//            System.out.println(removeIdList.get("m_price_id").);
//        }

//        List<PriceDto> priceRemoveId = priceService.remove(removeIdList);
//        priceService.remove(removeIdList);
//        System.out.println("????" + priceRemoveId);
//        return "redirect:/price/list";
        return null;
    }
}
