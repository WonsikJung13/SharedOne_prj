package com.soprj.sharedone_prj.mapper.order;

import com.soprj.sharedone_prj.domain.buyer.BuyerDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;

import java.util.List;

public interface OrderMapper {

    List<BuyerDto> buyerSelect();

  BuyerDto buyerList(String m_Buyer_Id);

    List<ItemDto> itemSelect();

    ItemDto itemList(String m_item_id);
}
