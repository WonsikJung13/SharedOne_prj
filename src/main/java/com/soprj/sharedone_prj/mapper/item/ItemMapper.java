package com.soprj.sharedone_prj.mapper.item;

import com.soprj.sharedone_prj.domain.item.CartDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;

import java.util.List;

public interface ItemMapper {

    int register(List<ItemDto> itemDto);

    List<ItemDto> selectItemList(String itemIdParam, int offset, int records);

    ItemDto select(String m_item_id);

    int update(List<ItemDto> itemDto);

    int remove(String m_item_id);

    List<String> selectGroup();

    List<String> selectManufacturer();

    int countAll();


//    List<CartDto> cartInfo();
//
//    void cartInsert(CartDto cartDto);
}
