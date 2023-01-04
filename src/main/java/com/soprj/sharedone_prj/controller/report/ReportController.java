package com.soprj.sharedone_prj.controller.report;

import com.soprj.sharedone_prj.service.report.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("orderReport")
    public void report() {
        reportService.getOrderHeader();
        reportService.getOrderItem();
    }
}
