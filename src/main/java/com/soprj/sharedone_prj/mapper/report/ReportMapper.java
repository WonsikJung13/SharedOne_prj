package com.soprj.sharedone_prj.mapper.report;

import com.soprj.sharedone_prj.domain.report.ReportHeaderDto;

import java.util.List;

public interface ReportMapper {
//    List<ReportHeaderDto> getOrderHeader();

    List<ReportHeaderDto> reportList();

    ReportHeaderDto reportDetail(int mOrderId);

//    void getOrderItem();
}
