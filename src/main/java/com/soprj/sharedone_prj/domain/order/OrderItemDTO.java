package com.soprj.sharedone_prj.domain.order;

import lombok.Data;

@Data
public class OrderItemDTO {
    private int m_order_id;
    private int m_order_count;
    private int m_price_id;
    private int m_order_price;
    private String m_order_itemId;
    private String m_order_itemName;
    private String m_order_itemGroup;
    private String m_order_itemManufacturer;
    private int m_order_totalPrice;

}
