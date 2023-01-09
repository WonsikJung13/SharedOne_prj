package com.soprj.sharedone_prj.controller.order;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.domain.order.ItemListVO;
import com.soprj.sharedone_prj.domain.order.OrderPriceVO;
import com.soprj.sharedone_prj.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;


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

    @RequestMapping("itemList")
    @ResponseBody
    public OrderPriceVO orderPrice(@RequestBody Map<String, Object> data) {
        OrderPriceVO orderPrice = orderService.orderPrice(data.get("requestDate"), data.get("selectedItem"), data.get("selectedBuyer"));
        return orderPrice;
    }

    @RequestMapping("itemListForDropDown")
    @ResponseBody
    public List<ItemListVO> itemListForDropDown(@RequestBody Map<String, Object> datas) {
        List<ItemListVO> itemList = orderService.itemListForDropDown(datas.get("requestDate"), datas.get("selected"));
        return itemList;
    }

    @GetMapping("list")
    private void itemList(){

    }

    @PostMapping("register")
    public String Register(){
        orderService.orderInsert();
        return "redirect:/order/list";
    }

    @PostMapping("add")
    public void Add(){

    }
}
