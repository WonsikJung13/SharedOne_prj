package com.soprj.sharedone_prj.controller.order;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping ("register")
    private void register(Model model) {
//    셀렉트 이름 가져오기
        List<BuyerDto> list = orderService.buyerList();
        model.addAttribute("buyerList", list);

        List<ItemDto> itemList = orderService.itemList();
        model.addAttribute("itemList", itemList);
    }
    @GetMapping ("buyerList/{selected}")
    @ResponseBody
    public BuyerDto buyerList(@PathVariable String selected) {
        BuyerDto list = orderService.buyerView(selected);
        return list;
    };

    @GetMapping("itemList/{selected}")
    @ResponseBody
    public ItemDto itemList(@PathVariable String selected) {
        ItemDto list = orderService.itemView(selected);
        return list;
    }
    @GetMapping("list")
    private void itemList(){

    }
}
