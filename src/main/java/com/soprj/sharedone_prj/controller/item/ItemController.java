package com.soprj.sharedone_prj.controller.item;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.soprj.sharedone_prj.domain.item.CartDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.service.item.ItemService;
import org.apache.tomcat.Jar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @ResponseBody
    public String register(@RequestBody Map<String, Object> itemDto) throws Exception {
        System.out.println("???" + itemDto);
//        for ( String param : paramAray) {
//            System.out.println("param: " + param);
//        }
//        System.out.println("등록진행!" + itemDto);
//        System.out.println(itemDto.get(0));
//        System.out.println("name: " + itemDto.get("m_item_id"));
//        System.out.println(itemDto.get("m_item_group"));

//        int cnt = itemService.register(itemDto);

        return "redirect:/item/list";
    }

//    @PostMapping("registerList")
//    @ResponseBody
//    public Map<String, Object> registerList(ItemDto itemDto) throws Exception {
//        System.out.println("ajax 요청 도착!" + itemDto);
//        Map<String, Object> map = new HashMap<String, Object>();
//
//        return map;
//    }

    @PostMapping("registerList")
    @ResponseBody
    public Map<String, Object> registerList (ItemDto itemDto) throws Exception {
//        String m_item_name, String m_item_group, String m_item_manufacturer, String m_item_unit
//        ItemDto itemDto = new ItemDto();
//        itemDto.setM_item_name(m_item_name);
//        itemDto.setM_item_group(m_item_group);
//        itemDto.setM_item_manufacturer(m_item_manufacturer);
//        itemDto.setM_item_unit(m_item_unit);
        System.out.println(itemDto);
//        itemDto.setM_item_name(1);
        return null;
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
    public String remove(String m_item_id) {
        System.out.println("remove 진행");
        int cnt = itemService.remove(m_item_id);

        return "redirect:/item/list";
    }

//    @PutMapping("itemCart")
//    @ResponseBody
//    public Map<String, Object> itemCart(@RequestBody CartDto cartDto, Model model) {
//        System.out.println("item: " + cartDto);
//        Map<String, Object> map = new HashMap<>();
//
//        itemService.itemCart(cartDto);
//
//        model.addAttribute("cartDto", cartDto);
//        System.out.println("cartDto: " + cartDto);
////        map.put()
//        return map;
//    }
}
