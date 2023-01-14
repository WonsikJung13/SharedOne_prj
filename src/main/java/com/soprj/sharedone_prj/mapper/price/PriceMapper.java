package com.soprj.sharedone_prj.mapper.price;

import com.soprj.sharedone_prj.domain.price.PriceDto;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface PriceMapper {
    List<PriceDto> getPriceList(int offset, int records, String type, String keyword);

    int insertRegister(PriceDto price);

    PriceDto selectById(int m_price_id);

    int updateById(PriceDto priceDto);

    PriceDto buyerList(String m_buyer_id);

    PriceDto itemList(String m_item_id);

    List<PriceDto> getBuyerList();

    List<PriceDto> getItemList();

    int countAll(String type, String keyword);

    int remove(String removeList);

    List<PriceDto> getPricePeriod(PriceDto priceDto);

    LocalDate getAfterStartPeriod(PriceDto priceDto);

    int addPriceData(Map<String, Object> stringObjectMap);

}
