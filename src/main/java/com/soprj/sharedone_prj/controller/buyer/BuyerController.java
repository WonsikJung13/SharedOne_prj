package com.soprj.sharedone_prj.controller.buyer;

import com.soprj.sharedone_prj.service.buyer.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("buyer")
public class BuyerController {

    @Autowired
    private BuyerService buyerService;

    @RequestMapping("list")
    public void list(){
        
    }

}
