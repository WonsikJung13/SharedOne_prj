package com.soprj.sharadeone_prj.controller;

import com.soprj.sharadeone_prj.domain.SampleDTO;
import com.soprj.sharadeone_prj.service.SampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SampleController {

    @Autowired
    private SampleService sampleService;

    @RequestMapping("test")
    public void test(SampleDTO sampleDTO) {
        sampleService.register(sampleDTO);
    }
}
