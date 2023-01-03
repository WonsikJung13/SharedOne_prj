package com.soprj.sharedone_prj.domain.price;

import lombok.Data;

import java.sql.Date;
import java.time.LocalDateTime;


@Data
public class PriceDto {
    private int m_buyer_id;
    private String m_buyer_name;
    private int m_item_id;
    private String m_item_name;

    private int m_price_id;
    private int m_price_price;
    private String m_price_unit;
    private int m_price_discount;
    private Date m_price_startPeriod;
    private Date m_price_lastPeriod;
    private int m_price_lastPrice;
    private LocalDateTime m_price_inserted;

}
