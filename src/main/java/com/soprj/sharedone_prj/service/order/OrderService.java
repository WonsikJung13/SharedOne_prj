package com.soprj.sharedone_prj.service.order;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.mapper.order.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrderMapper mapper;

    public List<BuyerDto> buyerList() {
        return mapper.buyerSelect();
    }

    public BuyerDto buyerView(String m_Buyer_Id) {
        return mapper.buyerList(m_Buyer_Id);
    }
}
