package com.soprj.sharedone_prj.controller;

import com.soprj.sharedone_prj.domain.SampleDTO;
import com.soprj.sharedone_prj.service.SampleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class SampleController {

    @Autowired
    private SampleService sampleService;

    @GetMapping("main")
    public void main() {
    }


}
