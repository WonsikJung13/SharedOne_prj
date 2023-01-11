package com.soprj.sharedone_prj.controller.price;

import com.soprj.sharedone_prj.domain.price.PriceDto;
import com.soprj.sharedone_prj.service.item.ItemService;
import com.soprj.sharedone_prj.service.price.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
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
        List<PriceDto> buyerList = priceService.getBuyerList();
        List<PriceDto> itemList = priceService.getItemList();

        model.addAttribute("priceList", priceList);
        model.addAttribute("buyerList", buyerList);
        model.addAttribute("itemList", itemList);
    }

    @GetMapping("register")
    public void register(Model model) {
        List<PriceDto> buyerList = priceService.getBuyerList();
        List<PriceDto> itemList = priceService.getItemList();
        model.addAttribute("buyerList", buyerList);
        model.addAttribute("itemList", itemList);
    }

    @GetMapping("buyerList/{selected}")
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
    public String register(PriceDto price) {
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
    public String remove(@RequestParam Map<String, String> removeIdList) {

        String[] removeList = removeIdList.get("m_price_id").split(",");

        for (int i = 0; i < removeList.length; i++) {
            priceService.remove(removeList[i]);
        }

        return "redirect:/price/list";
    }

    @PostMapping("checkPeriod")
    @ResponseBody
    public Map<String, Object> checkPeriod(@RequestBody Map<String, Object> priceMap) {
//        System.out.println(priceMap);

//        ObjectMapper mapper = new ObjectMapper();
//        PriceDto priceDto = mapper.convertValue(priceMap, PriceDto.class);
        int buyerId = Integer.valueOf((String) priceMap.get("m_buyer_id"));
        LocalDate date = LocalDate.parse(priceMap.get("m_price_startPeriod").toString(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        PriceDto priceDto = new PriceDto();
        priceDto.setM_item_id(priceMap.get("m_item_id").toString());
        priceDto.setM_buyer_id(buyerId);
        priceDto.setM_price_startPeriod(date);

        List<PriceDto> periodList = priceService.getPricePeriod(priceDto);

        Map<String, Object> map = new HashMap<>();
        if (periodList.size() == 0) {
            // MIN값이 필요한 경우 아래 사용
//            String beforeLastPeriod = priceService.getBeforeLastPeriod(priceDto);
//            if (beforeLastPeriod != null) {
//                System.out.println("이것이 MIN값 : " + beforeLastPeriod);
//                map.put("minDate", beforeLastPeriod);
//            } else {
//                System.out.println("오늘 날짜가 MIN 값!!!!");
//                map.put("beforeLastPeriod", priceMap.get("m_price_startPeriod"));
//            }
            String yesterday = priceDto.getM_price_startPeriod().minusDays(1).toString();
            map.put("maxDate" , yesterday);
            if (priceDto.getM_price_startPeriod() != null) {

            } else {
                map.put("maxDate", null);
            }

            return map;
        } else {
            // 선택이 불가하다고 전달!
            return map;
        }
    }
}
