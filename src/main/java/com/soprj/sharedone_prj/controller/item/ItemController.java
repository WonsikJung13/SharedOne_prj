package com.soprj.sharedone_prj.controller.item;

import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.service.item.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("item")
public class ItemController {

    @Autowired
    private ItemService itemService;

    @GetMapping("register")
    public void register(@RequestParam(name = "m_item_id", defaultValue = "") String itemIdParam,
                         Model model
    ) {
        if (!itemIdParam.isEmpty()) {
            ItemDto selectItem = itemService.get(itemIdParam);
            System.out.println("itemIdParam: " + itemIdParam);
            model.addAttribute("getItem", selectItem);
        }
        List<String> groupList = itemService.selectGroup();
        List<String> manufacturerList = itemService.selectManufacturer();

        model.addAttribute("groupList", groupList);
        model.addAttribute("manufacturerList", manufacturerList);

    }

    @PostMapping("register")
    public String register(ItemDto itemDto
    ) {
        System.out.println("등록창 : " + itemDto);
        int cnt = itemService.register(itemDto);
        return "redirect:/item/list";
    }

    @GetMapping("list")
    public void list(Model model,
                     @RequestParam(name = "m_item_id", defaultValue = "0") String itemIdParam,
                     @RequestParam(name = "page", defaultValue = "1") int page,
                     ItemDto itemDto
    ) {
        List<ItemDto> list = itemService.itemList(itemIdParam, page, itemDto);
        List<String> groupList = itemService.selectGroup();
        List<String> manufacturerList = itemService.selectManufacturer();


        model.addAttribute("itemList", list);
        model.addAttribute("groupList", groupList);
        model.addAttribute("manufacturerList", manufacturerList);
        System.out.println("groupList: " + groupList);
        System.out.println("itemList: " + list);
    }

    @PostMapping("remove")
    public String remove(String m_item_id) {
        System.out.println("controller remove 진행");
        int cnt = itemService.remove(m_item_id);

        return "redirect:/item/list";
    }
}
