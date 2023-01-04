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
    public void register(@RequestParam(name = "m_item_id", defaultValue = "0") int m_item_id,
                         Model model
    ) {
        if (m_item_id != 0) {
            ItemDto selectItem = itemService.get(m_item_id);

            model.addAttribute("getItem", selectItem);
        }

    }

    @PostMapping("register")
    public String register(ItemDto itemDto
//                         ,@RequestParam(name = "m_item_id", defaultValue = "0") int m_item_id
    ) {
        System.out.println("controller: " + itemDto);

//        if (m_item_id == 0) {
            int cnt = itemService.register(itemDto);
//        }
//        else {
//            int cnt = itemService.update(itemDto, m_item_id);
//        }

        return "redirect:/item/list";
    }

    @GetMapping("list")
    public void list(Model model
    ) {
        List<ItemDto> list = itemService.itemList();

        model.addAttribute("itemList", list);

    }

    @PostMapping("remove")
    public String remove(int m_item_id) {
        System.out.println("controller remove 진행");
        int cnt = itemService.remove(m_item_id);

        return "redirect:/item/list";
    }
}
