package com.soprj.sharedone_prj.controller.report;

import com.soprj.sharedone_prj.domain.report.ReportHeaderDto;
import com.soprj.sharedone_prj.domain.report.TotalReportDto;
import com.soprj.sharedone_prj.service.report.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("orderReport")
    public void report(Model model, @RequestParam(name = "t", defaultValue = "all") String type,
                       @RequestParam(name = "q", defaultValue = "") String keyword) {
//        List<ReportHeaderDto> report = reportService.getOrderHeader();
        List<TotalReportDto> report = reportService.reportList(type, keyword);
        model.addAttribute("report", report);

        List<Map<String, String>> sortedReport = reportService.sortedReport();
        model.addAttribute("sortedReport", sortedReport);

        List<Map<String, String>> buyerReport = reportService.buyerReport();
        model.addAttribute("buyerReport", buyerReport);

        List<Map<String, String>> memberReport = reportService.memberReport();
        model.addAttribute("memberReport", memberReport);
    }

    @RequestMapping("orderReport/{m_order_id}")
    @ResponseBody
    public ReportHeaderDto reportDetail(@PathVariable int m_order_id) {
        ReportHeaderDto result = reportService.reportDetail(m_order_id);

        return result;
    }
}
