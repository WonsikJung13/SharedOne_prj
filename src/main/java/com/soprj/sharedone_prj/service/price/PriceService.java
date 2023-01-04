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
}
