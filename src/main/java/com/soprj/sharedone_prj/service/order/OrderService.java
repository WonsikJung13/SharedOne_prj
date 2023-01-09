package com.soprj.sharedone_prj.service.order;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;
import com.soprj.sharedone_prj.domain.order.OrderDto;
import com.soprj.sharedone_prj.domain.order.ItemListVO;
import com.soprj.sharedone_prj.domain.order.OrderPriceVO;
import com.soprj.sharedone_prj.mapper.order.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

//    public ItemDto itemView(String m_item_id) {
//        return mapper.itemList(m_item_id);
//    }


    public OrderDto orderInsert() {
        return mapper.orderInsert();
    }

    public List<ItemListVO> itemListForDropDown(Object m_order_inserted, Object m_buyer_id) {
        return mapper.itemListForDropDown(m_order_inserted, m_buyer_id);
    }

    public OrderPriceVO orderPrice(Object m_order_inserted, Object m_item_id, Object m_buyer_id) {
        return mapper.orderPrice(m_order_inserted, m_item_id, m_buyer_id);
    }
}
