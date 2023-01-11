package com.soprj.sharedone_prj.mapper.buyer;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.price.PriceDto;

import java.util.List;
import java.util.Map;

public interface BuyerMapper {

    List<BuyerDto> list();

    BuyerDto selectDuo(String m_buyer_name, int m_buyer_id);

    int addBuyer(BuyerDto buyer);

    int insert(Map<String, Object> buyer);

    int updateBuyer(BuyerDto buyer);

    int removeById(int m_buyer_id);

    BuyerDto select(int m_buyer_id);

    BuyerDto getBuyerNum(String m_buyer_number);

    List<BuyerDto> getBuyerList(int offset, int records);

    int countAll();
}
