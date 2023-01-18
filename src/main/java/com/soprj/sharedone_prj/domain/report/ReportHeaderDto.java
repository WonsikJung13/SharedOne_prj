package com.soprj.sharedone_prj.domain.report;

import com.soprj.sharedone_prj.domain.order.OrderItemDTO;
import lombok.Data;

import java.text.DecimalFormat;
import java.time.LocalDate;
import java.util.List;

@Data
public class ReportHeaderDto {
    private int m_order_id;
    private String m_buyer_id;
    private String m_order_date;
    private LocalDate m_order_inserted;
    private String m_order_status;
    private String m_member_id;
    private String m_order_buyerName;
    private String m_order_buyerAddress;
    private String m_order_buyerRegion;
    private int m_order_buyerNumber;
    private String m_order_buyerCurrency;
    private int m_order_sumPrice;
    private String m_order_comment;
    private String m_order_memo;

    private List<OrderItemDTO> orderItemDTOList;

    public String getDecimal() {
        DecimalFormat df = new DecimalFormat ("###,###");
        // df.format() 괄호 안에 본인 데이터 중 천원 단위 필요한 프로퍼티 넣기
        // 이후 jsp에서 decimal 로 호출하면 됨
        String result = df.format(m_order_sumPrice);

        return result;
    }
}
