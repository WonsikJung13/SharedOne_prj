package com.soprj.sharedone_prj.domain.order;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class OrderDto {
    private int m_buyer_id;
    private int m_member_id;
    private LocalDateTime m_order_date;
    private int m_order_id;
    private int m_order_count;
    private String m_order_unit;
    private int m_order_price;
    private String m_order_memo;
    private int m_price_id;


}
