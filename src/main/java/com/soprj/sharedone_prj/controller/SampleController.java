package com.soprj.sharedone_prj.controller;

import com.soprj.sharedone_prj.domain.SampleDTO;
import com.soprj.sharedone_prj.service.SampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SampleController {

    @Autowired
    private SampleService sampleService;

    @GetMapping("")
    public String getTest() {
        return "redirect:/report/orderReport";
    }


    @PostMapping("test")
    public void test(SampleDTO sampleDTO) {
        sampleService.register(sampleDTO);
    }
}
