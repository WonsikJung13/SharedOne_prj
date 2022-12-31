package com.soprj.sharedone_prj.mapper.buyer;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;

import java.util.List;

public interface BuyerMapper {

    List<BuyerDto> list();

    BuyerDto selectDuo(String m_buyer_name, int m_buyer_id);

    int addBuyer(BuyerDto buyer);

    int insert(BuyerDto buyer);

    int updateBuyer(BuyerDto buyer);

    int removeById(int m_buyer_id);

    BuyerDto select(int m_buyer_id);

}
