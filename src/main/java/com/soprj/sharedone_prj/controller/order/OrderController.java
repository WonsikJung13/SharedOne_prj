package com.soprj.sharedone_prj.controller.order;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.order.*;
import com.soprj.sharedone_prj.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @GetMapping("register")
    private void register(Model model, Principal principal) {
//    셀렉트 이름 가져오기
        List<BuyerDto> list = orderService.buyerList();
        model.addAttribute("buyerList", list);

//        List<ItemDto> itemList = orderService.itemList();
//        model.addAttribute("itemList", itemList);

        model.addAttribute("name", principal.getName());
    }

    //  바이어 데이터 가져오기
    @GetMapping("buyerList/{selected}")
    @ResponseBody
    public BuyerDto buyerList(@PathVariable String selected) {
        BuyerDto list = orderService.buyerView(selected);
        return list;
    }

    @RequestMapping("itemList")
    @ResponseBody
    public OrderPriceVO orderPrice(@RequestBody Map<Object, Object> data) {
        OrderPriceVO orderPrice = orderService.orderPrice(data.get("requestDate"), data.get("selectedItem"), data.get("selectedBuyer"));
        return orderPrice;
    }

    @RequestMapping("itemListForDropDown")
    @ResponseBody
    public List<ItemListVO> itemListForDropDown(@RequestBody Map<Object, Object> datas) {
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

        // id 값 추출 코드
        ObjectMapper mapper = new ObjectMapper();
        OrderDto orderDto = mapper.convertValue(addData.get(0), OrderDto.class);
        int id = orderDto.getM_order_id();

        for (int i = 0; i < addData.size(); i++) {
            addData.get(i).put("m_order_id", id);
            orderService.addDataItem(addData.get(i));
        }

        return "redirect:/order/list";
    }

    //  장바구니 오더 임시저장
    @PostMapping("storageAdd")
    public String storageAdd(@RequestBody List<Map<String, Object>> addData) {
        System.out.println("애드" + addData);
        orderService.storageHeaderAdd(addData.get(0));
        ObjectMapper mapper = new ObjectMapper();
        OrderDto orderDto = mapper.convertValue(addData.get(0), OrderDto.class);

        int id = orderDto.getM_order_id();

        for (int i = 0; i < addData.size(); i++) {
            addData.get(i).put("m_order_id", id);
            orderService.storageItemAdd(addData.get(i));
        }
        return "redirect:/order/list";
    }

    // 주문 관리 리스트 보여주기
    @GetMapping("list")
    public void list(@RequestParam(name = "page", defaultValue = "1") int page,
                     @RequestParam(name = "t", defaultValue = "all") String type,
                     @RequestParam(name = "q", defaultValue = "") String keyword,
                     OrderDto orderDto,
                     Model model) {
        List<OrderDto> list = orderService.orderList(page, type, keyword, orderDto);
        model.addAttribute("orderList", list);
    }

    @RequestMapping("list/{m_order_id}")
    @ResponseBody
    public OrderHeaderDTO orderDetail(@PathVariable int m_order_id) {
        OrderHeaderDTO result = orderService.orderDetail(m_order_id);
        System.out.println(result);
        return result;
    }

    @PostMapping("list")
    public String orderAccept(OrderDto orderDto, String m_order_status) {

        orderService.orderAccept(orderDto);

        return "redirect:/order/list";
    }

    @GetMapping("modify")
    public void modify(int m_order_id, Model model) {
        OrderHeaderDTO list = orderService.orderHeader(m_order_id);
        model.addAttribute("orderHeader", list);


        List<OrderItemDTO> itemList = orderService.itemList(m_order_id);
        model.addAttribute("itemList", itemList);

    }

    @PostMapping("update")
    @ResponseBody
    public void update(@RequestBody Map<String, Object> data) {
//        orderService.updateHeader(data.get(0));
        System.out.println("11");
        System.out.println(data);

//        for (int i = 0; i < data.size(); i++) {
//            data.get(i).put("m_order_id", m_order_id);
//            orderService.updateItem(data.get(i));
//        }

    }

    //    수정 등록
//    @PostMapping("ModifyAdd")
//    public void ModifyAdd(@RequestBody Map<String, Object> headerItem) {
//        System.out.println("asdaasdasd");
////        orderService.updateHeader(headerItem);
//    }

    // 오더 아이템 부분 update 쿼리
    @PostMapping("ModifyAdd")
    public void ModifyAddItem(@RequestBody List<Map<String, Object>> addItem) {
//        if (addItem.size() > 0) {
//            for (int i = 0; i < addItem.size(); i++) {
//                orderService.addModifyItem(addItem.get(i));
//                System.out.println(addItem.get(i));
//            }
//        }
        System.out.println("additem");
    }

    @PostMapping("ModifyHeader")
    public void ModifyHeader(@RequestBody Map<String, Object> header) {
        System.out.println("Header");
//        orderService.updateHeader(header);
        System.out.println(header);
    }

    @PostMapping("modify")
    public List<OrderItemDTO> itemz(@RequestBody List<List<Map<String, Object>>> data) {
        System.out.println("오긴와?");
        for (int i = 0; i < data.size(); i++) {
            System.out.println(data.get(i).get(0));
            orderService.deleteItem(data.get(i).get(0));
        }
        return null;
    }

    @DeleteMapping("deleteList/{order}")
    public void deleteList(@PathVariable String order) {
        String[] itemId = order.split("_");
        String m_order_itemId = itemId[0];
        String m_order_id = itemId[1];
        orderService.orderListDelete(m_order_itemId, m_order_id);


    }


    // 관리자 리스트
    @GetMapping("adminList")
    public void adminList(@RequestParam(name = "page", defaultValue = "1") int page,
                          @RequestParam(name = "t", defaultValue = "all") String type,
                          @RequestParam(name = "q", defaultValue = "") String keyword,
                          OrderDto orderDto,
                          Model model) {
        List<OrderDto> list = orderService.adminOrderList(page, type, keyword, orderDto);
        model.addAttribute("orderList", list);
    }

    @RequestMapping("adminList/{m_order_id}")
    @ResponseBody
    public OrderHeaderDTO adminDetail(@PathVariable int m_order_id) {
        OrderHeaderDTO result = orderService.orderDetail(m_order_id);

        return result;
    }


    //    삭제하기
    @PostMapping("remove")
    public String remove(String m_order_id) {
        String[] order = m_order_id.split(",");
        for (int i = 0; i < order.length; i++) {
            orderService.orderRemove(Integer.parseInt(order[i]));
        }
        return "redirect:/order/adminList";
    }


    @RequestMapping("items/{m_order_id}")
    @ResponseBody
    public List<OrderItemDTO> itemss(@PathVariable int m_order_id) {
        return orderService.itemList(m_order_id);
    }


}
