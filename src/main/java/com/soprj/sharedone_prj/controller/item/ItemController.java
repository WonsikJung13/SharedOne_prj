package com.soprj.sharedone_prj.controller.item;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.service.item.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

@Controller
@RequestMapping("item")
public class ItemController {

    @Autowired
    private ItemService itemService;

    @GetMapping("register")
    public void register(@RequestParam(name = "m_item_id", defaultValue = "") String m_item_id,
                         Model model
    ) {
        if (!m_item_id.isEmpty()) {
            ItemDto selectItem = itemService.get(m_item_id);
            model.addAttribute("getItem", selectItem);
        }
        List<String> groupList = itemService.selectGroup();
        List<String> manufacturerList = itemService.selectManufacturer();

        model.addAttribute("groupList", groupList);
        model.addAttribute("manufacturerList", manufacturerList);
    }

    @PostMapping("register")
    public String register(ItemDto itemDto, RedirectAttributes rttr) throws Exception {

        Map<String, Object> map = new HashMap<String, Object>();

        int cnt = itemService.register(itemDto);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "제품 수정이 완료되었습니다.");
        } else {
            rttr.addFlashAttribute("message", "제품 수정을 실패하였습니다.");
        }
        return "redirect:/item/list";
    }

    @PostMapping("registerList")
    @ResponseBody
    public Map<String, Object> registerList (@RequestBody List<Object> dataList) throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();
        ObjectMapper mapper = new ObjectMapper();
        int cnt = 0;
        for (int i = 0; i < dataList.size(); i++) {
            ItemDto itemDto = mapper.convertValue(dataList.get(i),ItemDto.class);
            itemService.register(itemDto);
            cnt += 1;
        }
            System.out.println("cnt: " + cnt);
            map.put("cnt", cnt);
        return map;
    }


    @GetMapping("list")
    public void list(Model model,
                     @RequestParam(name = "m_item_id", defaultValue = "") String itemIdParam,
                     @RequestParam(name = "page", defaultValue = "1") int page,
                     ItemDto itemDto
    ) {
        List<ItemDto> list = itemService.itemList(itemIdParam, page, itemDto);
        List<String> groupList = itemService.selectGroup();
        List<String> manufacturerList = itemService.selectManufacturer();


        model.addAttribute("itemList", list);
        model.addAttribute("groupList", groupList);
        model.addAttribute("manufacturerList", manufacturerList);
    }

    @PostMapping("remove")
    public String remove(@RequestParam Map<String,String> removeIdList,
                         RedirectAttributes rttr) {
        System.out.println("removeIdList: " + removeIdList);
        String[] removeList = removeIdList.get("m_item_id").split(",");
        System.out.println("remveList: " + removeList);
        int cnt = 0;
        for (int i = 0; i < removeList.length; i++) {
            System.out.println("removeId: " + removeList[i]);
            itemService.remove(removeList[i]);
            cnt = cnt + 1;
        }
        System.out.println(cnt);

        if (cnt >= 1) {
            rttr.addFlashAttribute("message", cnt +"개의 제품이 제거되었습니다.");
        }
        else {
            rttr.addFlashAttribute("message", "제품 제거를 실패하였습니다.");
        }
        return "redirect:/item/list";
    }
}