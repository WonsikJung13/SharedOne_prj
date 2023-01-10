package com.soprj.sharedone_prj.controller.report;

import com.soprj.sharedone_prj.domain.report.ReportHeaderDto;
import com.soprj.sharedone_prj.service.report.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("orderReport")
    public void report(Model model) {
        List<ReportHeaderDto> report = reportService.getOrderHeader();
        model.addAttribute("report", report);
    }
}
