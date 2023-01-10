package com.soprj.sharedone_prj.mapper.item;

import com.soprj.sharedone_prj.domain.item.CartDto;
import com.soprj.sharedone_prj.domain.item.ItemDto;

import java.util.List;

public interface ItemMapper {

    int register(ItemDto itemDto);

    List<ItemDto> selectItemList(String itemIdParam, int offset, int records);

    ItemDto select(String m_item_id);

    int update(ItemDto itemDto);

    int remove(String removeList);

    List<String> selectGroup();

    List<String> selectManufacturer();

    int countAll();
}