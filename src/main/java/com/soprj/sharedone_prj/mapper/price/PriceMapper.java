package com.soprj.sharedone_prj.mapper.price;

import com.soprj.sharedone_prj.domain.price.PriceDto;

import java.util.List;

public interface PriceMapper {
    List<PriceDto> getPriceList();

    int insertRegister(PriceDto price);

    PriceDto selectById(int m_price_id);

    int updateById(PriceDto priceDto);

    PriceDto buyerList(String m_buyer_id);

    PriceDto itemList(String m_item_id);

    List<PriceDto> getBuyerList();

    List<PriceDto> getItemList();
}
