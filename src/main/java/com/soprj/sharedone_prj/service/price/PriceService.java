package com.soprj.sharedone_prj.service.price;

import com.soprj.sharedone_prj.domain.price.PriceDto;
import com.soprj.sharedone_prj.mapper.price.PriceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PriceService {

    @Autowired
    private PriceMapper priceMapper;

    public List<PriceDto> getPriceList() {
        return priceMapper.getPriceList();
    }


    public int register(PriceDto price) {
        return priceMapper.insertRegister(price);
    }

    public PriceDto getById(int m_price_id) {
        return priceMapper.selectById(m_price_id);
    }

    public int getByIdModify(PriceDto priceDto) {
        return priceMapper.updateById(priceDto);
    }

    public PriceDto buyerList(String m_buyer_id) {
        return priceMapper.buyerList(m_buyer_id);
    }

    public PriceDto itemList(String m_item_id) {
        return priceMapper.itemList(m_item_id);
    }

    public List<PriceDto> getBuyerList() {
        return priceMapper.getBuyerList();
    }

    public List<PriceDto> getItemList() {
        return priceMapper.getItemList();
    }
}
