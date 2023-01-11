package com.soprj.sharedone_prj.domain.price;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;


@Data
public class PriceDto {
    private String m_buyer_id;
    private String m_buyer_name;
    private String m_buyer_currency;
    private String m_item_id;
    private String m_item_name;

    private int m_price_id;
    private int m_price_price;
    private String m_price_currency;
    private int m_price_discount;
    private LocalDate m_price_startPeriod;
    private LocalDate m_price_lastPeriod;
    private int m_price_lastPrice;
    private LocalDateTime m_price_inserted;

//    private LocalDate maxDate;

    public int lastPageNumber;
    public int leftPageNumber;
    public int rightPageNumber;
    public int currentPageNumber;
    private boolean hasPrevButton;
    private boolean hasNextButton;
    private int jumpPrevPageNumber;
    private int jumpNextPageNumber;

}
