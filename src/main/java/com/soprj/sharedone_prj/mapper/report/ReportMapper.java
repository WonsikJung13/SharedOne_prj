package com.soprj.sharedone_prj.mapper.report;

import com.soprj.sharedone_prj.domain.report.ReportHeaderDto;

import java.util.List;
import java.util.Map;

public interface ReportMapper {
//    List<ReportHeaderDto> getOrderHeader();

    List<ReportHeaderDto> reportList();

    ReportHeaderDto reportDetail(int mOrderId);

    List<Map<String, String>> sortedReport();

    List<Map<String, String>> buyerReport();

//    void getOrderItem();
}
