package com.soprj.sharedone_prj.controller.order;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.domain.order.*;
import com.soprj.sharedone_prj.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("register")
    private void register(Model model) {
//    셀렉트 이름 가져오기
        List<BuyerDto> list = orderService.buyerList();
        model.addAttribute("buyerList", list);

        List<ItemDto> itemList = orderService.itemList();
        model.addAttribute("itemList", itemList);
    }

//  바이어 데이터 가져오기
    @GetMapping("buyerList/{selected}")
    @ResponseBody
    public BuyerDto buyerList(@PathVariable String selected) {
        BuyerDto list = orderService.buyerView(selected);
        return list;
    }

    ;

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


    @PostMapping("register")
    public String Register() {
        orderService.orderInsert();
        return "redirect:/order/list";
    }

    //  장바구니 오더 보내기
    @PostMapping("add")
    public String Add(@RequestBody List<Map<String, Object>> addData) {

        orderService.addDataHeader(addData.get(0));
        ObjectMapper mapper = new ObjectMapper();
        OrderDto orderDto = mapper.convertValue(addData.get(0), OrderDto.class);

        int id = orderDto.getM_order_id();

        for (int i = 0; i < addData.size(); i++) {
            addData.get(i).put("m_order_id", id);
            orderService.addDataItem(addData.get(i));
        }
        return "redirect:/order/list";
    }

    // 주문 관리 리스트 보여주기
    @GetMapping("list")
    public void list(Model model) {
        List<OrderDto> list = orderService.orderList();
        model.addAttribute("orderList", list);
    }


    @PostMapping("list/{m_order_id}")
    @ResponseBody
    public List<OrderItemDTO> orderDetail(@PathVariable int m_order_id) {
//        int orderId = Integer.valueOf((String) map.get("m_order_id"));

        List<OrderItemDTO> list = orderService.orderDetail(m_order_id);

        return list;
    }


}
