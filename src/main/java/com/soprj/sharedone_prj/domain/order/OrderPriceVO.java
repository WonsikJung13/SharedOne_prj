package com.soprj.sharedone_prj.domain.order;

import lombok.Data;

@Data
public class OrderPriceVO {
    private int m_price_lastPrice;
    private String m_item_name;
    private String m_item_group;
    private String m_item_manufacturer;
}
