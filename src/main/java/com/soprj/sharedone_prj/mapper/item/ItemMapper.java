package com.soprj.sharedone_prj.mapper.item;

import com.soprj.sharedone_prj.domain.item.ItemDto;

import java.util.List;

public interface ItemMapper {

    int register(ItemDto itemDto);

    List<ItemDto> selectItemList(int offset, int records, String type, String keyword);

    ItemDto select(String m_item_id);

    int update(ItemDto itemDto);

    int remove(String removeList);

    List<String> selectGroup();

    List<String> selectManufacturer(String m_item_group);

    int countAll(String type, String keyword);

    int itemCompare(ItemDto itemCompareList);
}