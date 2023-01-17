package com.soprj.sharedone_prj.service.order;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.order.*;
import com.soprj.sharedone_prj.mapper.order.OrderMapper;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderService {
    @Setter(onMethod_ = @Autowired)
    private OrderMapper mapper;

    public List<BuyerDto> buyerList() {
        return mapper.buyerSelect();
    }

    public BuyerDto buyerView(String m_Buyer_Id) {
        return mapper.buyerList(m_Buyer_Id);
    }

    public List<OrderItemDTO> itemList(int m_order_id)
    { return mapper.itemSelect(m_order_id); }

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

    public List<OrderDto> orderList(int page, String type, String keyword, OrderDto orderDto) {
        int records = 10;
        int offset = (page - 1) * records;

        int countAll = mapper.countAll(type, "%"+keyword+"%");
        System.out.println(countAll);
        int lastPage = (countAll - 1) / records + 1;

        int leftPageNumber = (page -1) / 10 * 10 + 1;
        int rightPageNumber = leftPageNumber + 9;
        rightPageNumber = Math.min(rightPageNumber, lastPage);

        // 이전버튼 유무
        boolean hasPrevButton = page > 10;
        // 다음버튼 유무
        boolean hasNextButton = page <= ((lastPage - 1) / 10 * 10);

        // 이전버튼 눌렀을 때 가는 페이지 번호
        int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9;
        int jumpNextPageNumber = (page - 1) / 10 * 10 + 11;

        orderDto.setHasPrevButton(hasPrevButton);
        orderDto.setHasNextButton(hasNextButton);
        orderDto.setJumpPrevPageNumber(jumpPrevPageNumber);
        orderDto.setJumpNextPageNumber(jumpNextPageNumber);
        orderDto.setCurrentPageNumber(page);
        orderDto.setLeftPageNumber(leftPageNumber);
        orderDto.setRightPageNumber(rightPageNumber);
        orderDto.setLastPageNumber(lastPage);

        return mapper.orderList(offset, records, type, "%"+keyword+"%");
    }

    public List<OrderDto> adminOrderList(int page, String type, String keyword, OrderDto orderDto) {
        int records = 10;
        int offset = (page - 1) * records;

        int countAll = mapper.adminCountAll(type, "%"+keyword+"%");
        System.out.println(countAll);
        int lastPage = (countAll - 1) / records + 1;

        int leftPageNumber = (page -1) / 10 * 10 + 1;
        int rightPageNumber = leftPageNumber + 9;
        rightPageNumber = Math.min(rightPageNumber, lastPage);

        // 이전버튼 유무
        boolean hasPrevButton = page > 10;
        // 다음버튼 유무
        boolean hasNextButton = page <= ((lastPage - 1) / 10 * 10);

        // 이전버튼 눌렀을 때 가는 페이지 번호
        int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9;
        int jumpNextPageNumber = (page - 1) / 10 * 10 + 11;

        orderDto.setHasPrevButton(hasPrevButton);
        orderDto.setHasNextButton(hasNextButton);
        orderDto.setJumpPrevPageNumber(jumpPrevPageNumber);
        orderDto.setJumpNextPageNumber(jumpNextPageNumber);
        orderDto.setCurrentPageNumber(page);
        orderDto.setLeftPageNumber(leftPageNumber);
        orderDto.setRightPageNumber(rightPageNumber);
        orderDto.setLastPageNumber(lastPage);

        return mapper.adminOrderList(offset, records, type, "%"+keyword+"%");
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

    public void orderRemove(int mOrderId) {
        mapper.orderItemRemove(mOrderId);
        mapper.orderHeaderRemove(mOrderId);

    }

    public void storageHeaderAdd(Map<String, Object> stringObjectMap) {
        mapper.storageHeaderAdd(stringObjectMap);
    }

    public void storageItemAdd(Map<String, Object> stringObjectMap) {
        mapper.storageItemAdd(stringObjectMap);
    }

    public OrderHeaderDTO orderHeader(int mOrderId) {
        return mapper.orderHeader(mOrderId);
    }

    public void updateHeader(Map<String, Object> map) {
        mapper.updateHeader(map);

    }
    public void updateItem(Map<String, Object> map) {
        mapper.updateItem(map);
    }

    // 기존 장바구니 리스트 삭제
    public void orderListDelete(String m_order_itemId, String m_order_id) {
        mapper.orderListDelete(m_order_itemId, m_order_id);
    }

    // 오더 수정 > m_order_header 업데이트
    public void addModifyHeader(Map<String, Object> map) {
        mapper.addModifyHeader(map);
    }
}
