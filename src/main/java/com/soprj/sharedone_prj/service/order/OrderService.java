package com.soprj.sharedone_prj.service.order;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.domain.order.*;
import com.soprj.sharedone_prj.mapper.order.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderService {
    @Autowired
    private OrderMapper mapper;

    public List<BuyerDto> buyerList() {
        return mapper.buyerSelect();
    }

    public BuyerDto buyerView(String m_Buyer_Id) {
        return mapper.buyerList(m_Buyer_Id);
    }

    public List<ItemDto> itemList() { return mapper.itemSelect(); }

    public OrderDto orderInsert() {
        return mapper.orderInsert();
    }

    public List<ItemListVO> itemListForDropDown(Object m_order_inserted, Object m_buyer_id) {
        return mapper.itemListForDropDown(m_order_inserted, m_buyer_id);
    }

    public OrderPriceVO orderPrice(Object m_order_inserted, Object m_item_id, Object m_buyer_id) {
        return mapper.orderPrice(m_order_inserted, m_item_id, m_buyer_id);
    }

    public int addDataHeader(Map<String, Object> stringObjectMap) {
        return mapper.addDataHeader(stringObjectMap);
    }

    public int addDataItem(Map<String, Object> stringObjectMap) {
        return mapper.addDataItem(stringObjectMap);
    }

    public  List<OrderDto> orderList() {
        return mapper.orderList();
    }

//    public List<OrderItemDTO> orderDetail(int m_order_id) {
//        return mapper.orderDetail(m_order_id);
//    }

    public OrderHeaderDTO orderDetail(int m_order_id) {
        return mapper.orderDetail(m_order_id);
    }

    public int orderAccept(OrderDto orderDto) {
        return mapper.orderAccept(orderDto);
    }

    public int orderRemove(int mOrderId) {
        return mapper.orderRemove(mOrderId);
    }
}
