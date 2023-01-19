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
                             @RequestParam(name = "t", defaultValue = "all") String type,
                             @RequestParam(name = "q", defaultValue = "") String keyword,
                             PriceDto priceDto) {
        List<PriceDto> priceList = priceService.getPriceList(page, type, keyword, priceDto);
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

        int cnt = priceService.getByIdModify(priceDto);
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

        LocalDate date = LocalDate.parse(priceMap.get("m_price_startPeriod").toString(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        PriceDto priceDto = new PriceDto();
        priceDto.setM_item_id(priceMap.get("m_item_id").toString());
        priceDto.setM_buyer_id(priceMap.get("m_buyer_id").toString());
        priceDto.setM_price_startPeriod(date);

        List<PriceDto> periodList = priceService.getPricePeriod(priceDto);
        Map<String, Object> map = new HashMap<>();
        if (periodList.size() == 0) {
            LocalDate result = priceService.getAfterStartPeriod(priceDto);
            if (result != null) {
            String yesterday = result.minusDays(1).toString();
            map.put("maxDate" , yesterday);
            return map;
            } else {
                map.put("maxDate", null);
                return map;
            }
        } else {
            // 선택이 불가하다고 전달!
            map.put("message" , periodList.get(0).getM_price_startPeriod() + " ~ " + periodList.get(0).getM_price_lastPeriod() + "\n" + "기간의 날짜는 선택이 불가합니다");
            return map;
        }
    }

    @PostMapping("checkModifyPeriod")
    @ResponseBody
    public Map<String, Object> checkModifyPeriod(@RequestBody Map<String, Object> priceMap) {

//        ObjectMapper mapper = new ObjectMapper();
//        PriceDto priceDto = mapper.convertValue(priceMap, PriceDto.class);
        LocalDate date = LocalDate.parse(priceMap.get("m_price_startPeriod").toString(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        int m_price_id = Integer.parseInt(priceMap.get("m_price_id").toString());
        PriceDto priceDto = new PriceDto();
        priceDto.setM_price_id(m_price_id);;
        priceDto.setM_item_id(priceMap.get("m_item_id").toString());
        priceDto.setM_buyer_id(priceMap.get("m_buyer_id").toString());
        priceDto.setM_price_startPeriod(date);

        List<PriceDto> periodList = priceService.getPriceModifyPeriod(priceDto);
        Map<String, Object> map = new HashMap<>();
        if (periodList.size() == 0) {
            LocalDate result = priceService.getAfterStartModifyPeriod(priceDto);
            if (result != null) {
                String yesterday = result.minusDays(1).toString();
                map.put("maxDate" , yesterday);
                return map;
            } else {
                map.put("maxDate", null);
                return map;
            }
        } else {
            // 선택이 불가하다고 전달!
            map.put("message" , periodList.get(0).getM_price_startPeriod() + " ~ " + periodList.get(0).getM_price_lastPeriod() + "\n" + "기간의 날짜는 선택 불가합니다");
            return map;

        }
    }

    @PostMapping("add")
    @ResponseBody
    public int add(@RequestBody List<Map<String, Object>> addData) {

        int cnt = 0;
        for (int i=0; i<addData.size(); i++) {
            Map<String, Object> map = addData.get(i);
            priceService.addPriceData(map);
            cnt += 1;
        }
        return cnt;
    }

}
