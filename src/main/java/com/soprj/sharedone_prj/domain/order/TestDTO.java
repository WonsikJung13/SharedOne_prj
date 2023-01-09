package com.soprj.sharedone_prj.domain.order;

import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
public class TestDTO {
    private int m_order_id;
    private int m_order_buyerId;
    private String m_order_buyerName;
    private String m_order_buyerAddress;
    private String m_order_buyerRegion;
    private int m_order_buyerNumber;
    private String m_order_buyerCurrency;
    private String m_order_inserted;
    private String m_order_comment;
    private int m_order_totalPrice;
    private String m_order_itemId;
    private String m_order_itemName;
    private String m_order_itemGroup;
    private String m_order_itemManufacturer;
    private int m_order_price;
    private int m_order_count;
}
