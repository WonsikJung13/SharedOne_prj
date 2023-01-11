package com.soprj.sharedone_prj.mapper.price;

import com.soprj.sharedone_prj.domain.price.PriceDto;

import java.util.List;

public interface PriceMapper {
    List<PriceDto> getPriceList(int offset, int records);

    int insertRegister(PriceDto price);

    PriceDto selectById(int m_price_id);

    int updateById(PriceDto priceDto);

    PriceDto buyerList(String m_buyer_id);

    PriceDto itemList(String m_item_id);

    List<PriceDto> getBuyerList();

    List<PriceDto> getItemList();

    int countAll();

    int remove(String removeList);

//    PriceDto priceList(String m_price_id);

    List<PriceDto> getPricePeriod(PriceDto priceDto);

    // MIN값이 필요하면 사용
//    String getBeforeLastPeriod(PriceDto priceDto);

    PriceDto getAfterStartPeriod(PriceDto priceDto);
}
