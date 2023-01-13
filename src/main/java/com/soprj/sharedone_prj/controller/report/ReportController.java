package com.soprj.sharedone_prj.controller.report;

import com.soprj.sharedone_prj.domain.report.ReportHeaderDto;
import com.soprj.sharedone_prj.service.report.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("orderReport")
    public void report(Model model) {
//        List<ReportHeaderDto> report = reportService.getOrderHeader();
        List<ReportHeaderDto> report = reportService.reportList();
        model.addAttribute("report", report);
    }

    @RequestMapping("orderReport/{m_order_id}")
    @ResponseBody
    public ReportHeaderDto reportDetail(@PathVariable int m_order_id) {
        ReportHeaderDto result = reportService.reportDetail(m_order_id);

        return result;
    }
}
