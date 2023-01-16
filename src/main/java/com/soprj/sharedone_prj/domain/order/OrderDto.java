package com.soprj.sharedone_prj.domain.order;

import lombok.Data;

@Data
public class OrderDto {
//    order header
    private int m_order_id;
    private String m_order_date;
    private String m_order_inserted;
    private String m_order_status;

    private String m_buyer_id;
    private String m_member_id;
    private String m_order_currency;
//  order items

    private int m_order_count;
    private String m_order_unit;
    private int m_order_price;
    private String m_order_comment;
    private int m_price_id;
    private String m_order_buyerName;
    private int m_order_sumPrice;
    private int m_order_buyerId;

    private String m_order_buyerAddress;
    private String m_order_buyerRegion;
    private int m_order_buyerNumber;
    private String m_order_buyerCurrency;
    private int m_order_totalPrice;
    private String m_order_itemId;
    private String m_order_itemName;
    private String m_order_itemGroup;
    private String m_order_itemManufacturer;
    private String m_order_memo;

    public int lastPageNumber;
    public int leftPageNumber;
    public int rightPageNumber;
    public int currentPageNumber;
    private boolean hasPrevButton;
    private boolean hasNextButton;
    private int jumpPrevPageNumber;
    private int jumpNextPageNumber;



}
