package com.soprj.sharedone_prj.mapper.buyer;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.price.PriceDto;

import java.util.List;
import java.util.Map;

public interface BuyerMapper {

    BuyerDto selectDuo(String m_buyer_name, String m_buyer_id);

    int insert(Map<String, Object> buyer);

    int updateBuyer(BuyerDto buyer);

    int removeById(String m_buyer_id);

    BuyerDto getBuyerNum(String m_buyer_number);

    List<BuyerDto> getBuyerList(int offset, int records, String searchNum, String searchText);

    int countAll(String searchNum, String searchText);
}
