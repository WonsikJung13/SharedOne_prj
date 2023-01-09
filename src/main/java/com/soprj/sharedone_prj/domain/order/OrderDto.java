package com.soprj.sharedone_prj.domain.order;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OrderDto {
//    order header
    private int m_order_id;
    private String m_order_date;
    private String m_order_inserted;
    private String m_order_status;

    private int m_buyer_id;
    private int m_member_id;
    private String m_order_currency;
//  order items

    private int m_order_count;
    private String m_order_unit;
    private int m_order_price;
    private String m_order_comment;
    private int m_price_id;

}
