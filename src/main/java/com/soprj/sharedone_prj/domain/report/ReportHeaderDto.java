package com.soprj.sharedone_prj.domain.report;

import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class ReportHeaderDto {
    private int m_order_id;
    private String m_order_buyerName;
    private LocalDate m_order_inserted;
    private String m_order_status;
    private int m_order_sumPrice;
    private List<ReportItemDto> reportItemDtoList;
}
