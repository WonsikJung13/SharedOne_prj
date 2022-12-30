package com.soprj.sharedone_prj.controller.order;

import com.soprj.sharedone_prj.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;


}
