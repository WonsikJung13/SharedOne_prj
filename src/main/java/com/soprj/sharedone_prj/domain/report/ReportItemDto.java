package com.soprj.sharedone_prj.domain.report;

import lombok.Data;

@Data
public class ReportItemDto {
    private String m_order_itemId;
    private String m_orderItemName;
    private int m_order_count;
    private int m_order_totalPrice;
}
