package com.soprj.sharedone_prj.service.buyer;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.mapper.buyer.BuyerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuyerService {

    @Autowired
    private BuyerMapper buyerMapper;

    public List<BuyerDto> listBuyer() {
        return buyerMapper.list();
    }

    public BuyerDto getDuo(String m_buyer_name, int m_buyer_id) {
        return buyerMapper.selectDuo(m_buyer_name, m_buyer_id);
    }


    public int addBuyer(BuyerDto buyer) {
        return buyerMapper.addBuyer(buyer);
    }


    public int update(BuyerDto buyer) {
        return buyerMapper.updateBuyer(buyer);
    }

    public int register(BuyerDto buyer) {
        int cnt = buyerMapper.insert(buyer);
        return cnt;
    }

    public int remove(int m_buyer_id) {
        return buyerMapper.removeById(m_buyer_id);
    }

    public BuyerDto get(int m_buyer_id) {
        return buyerMapper.select(m_buyer_id);
    }

    public BuyerDto getBuyerNum(String m_buyer_number) {
        return buyerMapper.getBuyerNum(m_buyer_number);
    }
}


